-- ==========================================================
-- UMKM Copilot AI
-- init_database.sql
-- PostgreSQL 15+ / Supabase Compatible
-- Final reviewed version
-- ==========================================================

BEGIN;

-- ==========================================================
-- EXTENSION
-- ==========================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ==========================================================
-- ENUM TYPES
-- ==========================================================

DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'transaction_status'
    ) THEN
        CREATE TYPE transaction_status AS ENUM
        (
            'completed',
            'cancelled',
            'refunded'
        );
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'payment_method_type'
    ) THEN
        CREATE TYPE payment_method_type AS ENUM
        (
            'cash',
            'qris',
            'transfer',
            'credit_card',
            'other'
        );
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'conversation_role'
    ) THEN
        CREATE TYPE conversation_role AS ENUM
        (
            'user',
            'assistant',
            'system'
        );
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'insight_type'
    ) THEN
        CREATE TYPE insight_type AS ENUM
        (
            'sales',
            'marketing',
            'inventory',
            'customer',
            'general'
        );
    END IF;
END
$$;

-- ==========================================================
-- TRIGGER FUNCTION
-- ==========================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- ==========================================================
-- BUSINESS PROFILE
-- ==========================================================

CREATE TABLE IF NOT EXISTS business_profile
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_name TEXT NOT NULL
        UNIQUE
        CHECK (LENGTH(TRIM(business_name)) > 0),

    owner_name TEXT,

    business_type TEXT,

    phone TEXT,

    email TEXT
        CHECK
        (
            email IS NULL
            OR email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
        ),

    address TEXT,

    currency TEXT NOT NULL
        DEFAULT 'IDR',

    timezone TEXT NOT NULL
        DEFAULT 'Asia/Jakarta',

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE business_profile IS
'Stores business profile information.';

COMMENT ON COLUMN business_profile.business_name IS
'Registered business name.';

COMMENT ON COLUMN business_profile.owner_name IS
'Business owner.';

COMMENT ON COLUMN business_profile.currency IS
'Default business currency.';

COMMENT ON COLUMN business_profile.timezone IS
'Business timezone.';

DROP TRIGGER IF EXISTS trg_business_profile_updated
ON business_profile;

CREATE TRIGGER trg_business_profile_updated
BEFORE UPDATE
ON business_profile
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ==========================================================
-- PRODUCTS
-- ==========================================================

CREATE TABLE IF NOT EXISTS products
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_id UUID NOT NULL
        REFERENCES business_profile(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    name TEXT NOT NULL
        CHECK (LENGTH(TRIM(name)) > 0),

    category TEXT,

    sku TEXT,

    description TEXT,

    selling_price BIGINT NOT NULL
        CHECK (selling_price >= 0),

    cost_price BIGINT NOT NULL
        DEFAULT 0
        CHECK (cost_price >= 0),

    stock INTEGER NOT NULL
        DEFAULT 0
        CHECK (stock >= 0),

    minimum_stock INTEGER NOT NULL
        DEFAULT 0
        CHECK (minimum_stock >= 0),

    unit TEXT NOT NULL
        DEFAULT 'pcs'
        CHECK
        (
            unit IN
            (
                'pcs',
                'cup',
                'bottle',
                'pack',
                'kg',
                'gram',
                'liter'
            )
        ),

    barcode TEXT,

    image_url TEXT,

    is_active BOOLEAN NOT NULL
        DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE products IS
'Stores products sold by the business.';

COMMENT ON COLUMN products.business_id IS
'Owner business.';

COMMENT ON COLUMN products.selling_price IS
'Selling price.';

COMMENT ON COLUMN products.cost_price IS
'Cost price.';

COMMENT ON COLUMN products.stock IS
'Current stock.';

COMMENT ON COLUMN products.minimum_stock IS
'Reorder threshold.';

COMMENT ON COLUMN products.unit IS
'Product measurement unit.';

DROP TRIGGER IF EXISTS trg_products_updated
ON products;

CREATE TRIGGER trg_products_updated
BEFORE UPDATE
ON products
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ==========================================================
-- TRANSACTIONS
-- ==========================================================

CREATE TABLE IF NOT EXISTS transactions
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_id UUID NOT NULL
        REFERENCES business_profile(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    product_id UUID
        REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    product_name TEXT NOT NULL
        CHECK (LENGTH(TRIM(product_name)) > 0),

    quantity INTEGER NOT NULL
        CHECK (quantity > 0),

    unit_price BIGINT NOT NULL
        CHECK (unit_price >= 0),

    total_price BIGINT NOT NULL
        CHECK (total_price = quantity * unit_price),

    payment_method payment_method_type NOT NULL
        DEFAULT 'cash',

    status transaction_status NOT NULL
        DEFAULT 'completed',

    notes TEXT,

    transaction_date TIMESTAMPTZ NOT NULL
        DEFAULT NOW(),

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE transactions IS
'Stores sales transaction history.';

COMMENT ON COLUMN transactions.business_id IS
'Business that owns the transaction.';

COMMENT ON COLUMN transactions.product_id IS
'Referenced product. Historical records keep product_name even if product_id becomes null.';

COMMENT ON COLUMN transactions.product_name IS
'Snapshot of the product name at transaction time.';

COMMENT ON COLUMN transactions.quantity IS
'Number of items sold.';

COMMENT ON COLUMN transactions.unit_price IS
'Unit selling price when the transaction occurred.';

COMMENT ON COLUMN transactions.total_price IS
'Must equal quantity x unit_price.';

COMMENT ON COLUMN transactions.payment_method IS
'Payment method used by customer.';

COMMENT ON COLUMN transactions.status IS
'Transaction status.';

COMMENT ON COLUMN transactions.transaction_date IS
'Date and time when the transaction occurred.';

DROP TRIGGER IF EXISTS trg_transactions_updated
ON transactions;

CREATE TRIGGER trg_transactions_updated
BEFORE UPDATE
ON transactions
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ==========================================================
-- MARKETING HISTORY
-- ==========================================================

CREATE TABLE IF NOT EXISTS marketing_history
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_id UUID NOT NULL
        REFERENCES business_profile(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    product_id UUID
        REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    platform TEXT NOT NULL
        CHECK (LENGTH(TRIM(platform)) > 0),

    prompt TEXT,

    caption TEXT NOT NULL
        CHECK (LENGTH(TRIM(caption)) > 0),

    hashtags TEXT,

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE marketing_history IS
'Stores AI-generated marketing content.';

COMMENT ON COLUMN marketing_history.business_id IS
'Business that owns this marketing content.';

COMMENT ON COLUMN marketing_history.product_id IS
'Referenced product if applicable.';

COMMENT ON COLUMN marketing_history.platform IS
'Publishing platform.';

COMMENT ON COLUMN marketing_history.prompt IS
'Prompt sent to AI model.';

COMMENT ON COLUMN marketing_history.caption IS
'Generated marketing caption.';

COMMENT ON COLUMN marketing_history.hashtags IS
'Recommended hashtags.';

-- ==========================================================
-- AI CONVERSATIONS
-- ==========================================================

CREATE TABLE IF NOT EXISTS ai_conversations
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_id UUID NOT NULL
        REFERENCES business_profile(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    session_id UUID NOT NULL,

    role conversation_role NOT NULL,

    agent TEXT,

    message TEXT NOT NULL
        CHECK (LENGTH(TRIM(message)) > 0),

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE ai_conversations IS
'Conversation history between users and AI agents.';

COMMENT ON COLUMN ai_conversations.business_id IS
'Business that owns the conversation.';

COMMENT ON COLUMN ai_conversations.session_id IS
'Conversation session identifier.';

COMMENT ON COLUMN ai_conversations.role IS
'Conversation role.';

COMMENT ON COLUMN ai_conversations.agent IS
'Responsible AI agent.';

COMMENT ON COLUMN ai_conversations.message IS
'Conversation message content.';

-- ==========================================================
-- INSIGHTS
-- ==========================================================

CREATE TABLE IF NOT EXISTS insights
(
    id UUID PRIMARY KEY
        DEFAULT gen_random_uuid(),

    business_id UUID NOT NULL
        REFERENCES business_profile(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    insight_category insight_type NOT NULL
        DEFAULT 'general',

    title TEXT NOT NULL
        CHECK (LENGTH(TRIM(title)) > 0),

    content TEXT NOT NULL
        CHECK (LENGTH(TRIM(content)) > 0),

    created_at TIMESTAMPTZ NOT NULL
        DEFAULT NOW()
);

COMMENT ON TABLE insights IS
'AI-generated business insights.';

COMMENT ON COLUMN insights.business_id IS
'Business that owns this insight.';

COMMENT ON COLUMN insights.insight_category IS
'Sales, marketing, inventory, customer, or general.';

COMMENT ON COLUMN insights.title IS
'Insight title.';

COMMENT ON COLUMN insights.content IS
'Insight description generated by AI.';

-- ==========================================================
-- INDEXES
-- ==========================================================

CREATE INDEX IF NOT EXISTS idx_products_business
ON products(business_id);

CREATE INDEX IF NOT EXISTS idx_products_name
ON products(name);

CREATE INDEX IF NOT EXISTS idx_products_category
ON products(category);

CREATE INDEX IF NOT EXISTS idx_products_active
ON products(is_active);

CREATE INDEX IF NOT EXISTS idx_products_stock
ON products(stock);

CREATE UNIQUE INDEX IF NOT EXISTS idx_products_business_sku_unique
ON products(business_id, sku)
WHERE sku IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS idx_products_business_barcode_unique
ON products(business_id, barcode)
WHERE barcode IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_transactions_business
ON transactions(business_id);

CREATE INDEX IF NOT EXISTS idx_transactions_product
ON transactions(product_id);

CREATE INDEX IF NOT EXISTS idx_transactions_date
ON transactions(transaction_date);

CREATE INDEX IF NOT EXISTS idx_transactions_status
ON transactions(status);

CREATE INDEX IF NOT EXISTS idx_transactions_payment
ON transactions(payment_method);

CREATE INDEX IF NOT EXISTS idx_transactions_business_date
ON transactions(business_id, transaction_date);

CREATE INDEX IF NOT EXISTS idx_transactions_business_status
ON transactions(business_id, status);

CREATE INDEX IF NOT EXISTS idx_transactions_business_product
ON transactions(business_id, product_id);

CREATE INDEX IF NOT EXISTS idx_marketing_business
ON marketing_history(business_id);

CREATE INDEX IF NOT EXISTS idx_marketing_product
ON marketing_history(product_id);

CREATE INDEX IF NOT EXISTS idx_marketing_platform
ON marketing_history(platform);

CREATE INDEX IF NOT EXISTS idx_ai_business
ON ai_conversations(business_id);

CREATE INDEX IF NOT EXISTS idx_ai_session
ON ai_conversations(session_id);

CREATE INDEX IF NOT EXISTS idx_ai_role
ON ai_conversations(role);

CREATE INDEX IF NOT EXISTS idx_insights_business
ON insights(business_id);

CREATE INDEX IF NOT EXISTS idx_insights_category
ON insights(insight_category);

-- ==========================================================
-- VIEWS
-- ==========================================================

CREATE OR REPLACE VIEW sales_summary AS
SELECT
    business_id,
    DATE(transaction_date) AS sales_date,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_items,
    SUM(total_price) AS total_revenue,
    AVG(total_price)::BIGINT AS average_transaction,
    MIN(total_price) AS minimum_transaction,
    MAX(total_price) AS maximum_transaction,
    COUNT(DISTINCT COALESCE(product_id::TEXT, product_name)) AS unique_products
FROM transactions
WHERE status = 'completed'
GROUP BY
    business_id,
    DATE(transaction_date);

COMMENT ON VIEW sales_summary IS
'Daily sales summary used by dashboard, reporting, and AI insight generation.';

CREATE OR REPLACE VIEW product_summary AS
SELECT
    t.business_id,
    t.product_id,
    COALESCE(p.name, t.product_name) AS product_name,
    p.category,
    COUNT(*) AS total_transactions,
    SUM(t.quantity) AS total_quantity_sold,
    SUM(t.total_price) AS total_revenue,
    AVG(t.unit_price)::BIGINT AS average_unit_price,
    MIN(t.transaction_date) AS first_sold_at,
    MAX(t.transaction_date) AS last_sold_at
FROM transactions t
LEFT JOIN products p
    ON p.id = t.product_id
WHERE t.status = 'completed'
GROUP BY
    t.business_id,
    t.product_id,
    COALESCE(p.name, t.product_name),
    p.category;

COMMENT ON VIEW product_summary IS
'Sales performance summary by product.';

CREATE OR REPLACE VIEW inventory_summary AS
SELECT
    business_id,
    id AS product_id,
    name AS product_name,
    category,
    sku,
    stock,
    minimum_stock,
    unit,
    is_active,
    CASE
        WHEN stock = 0 THEN 'out_of_stock'
        WHEN stock <= minimum_stock THEN 'low_stock'
        ELSE 'safe'
    END AS stock_status,
    cost_price,
    selling_price,
    stock * cost_price AS inventory_cost_value,
    stock * selling_price AS inventory_sales_value,
    updated_at
FROM products;

COMMENT ON VIEW inventory_summary IS
'Inventory status summary by product.';

-- ==========================================================
-- SUPABASE PRIVILEGES
-- ==========================================================

GRANT USAGE ON SCHEMA public TO anon, authenticated, service_role;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public
TO anon, authenticated, service_role;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public
TO anon, authenticated, service_role;

GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public
TO anon, authenticated, service_role;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON TABLES TO anon, authenticated, service_role;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON FUNCTIONS TO anon, authenticated, service_role;

COMMIT;

-- ==========================================================
-- END OF FILE
-- UMKM Copilot AI
-- init_database.sql
-- ==========================================================
