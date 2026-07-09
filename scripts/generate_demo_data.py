"""
UMKM Copilot AI
generate_demo_data.py

Generate realistic SQL seed data for PostgreSQL / Supabase.

Output:
    scripts/seed_database.sql
"""

from __future__ import annotations

import random
import uuid

from pathlib import Path
from datetime import datetime, timedelta

# ==========================================================
# CONFIGURATION
# ==========================================================

OUTPUT_FILE = Path("scripts/seed_database.sql")

RANDOM_SEED = 42

NUM_PRODUCTS = 40

DAYS_HISTORY = 90

MIN_TRANSACTION_PER_DAY = 5
MAX_TRANSACTION_PER_DAY = 20

NUM_MARKETING_HISTORY = 100

NUM_AI_SESSION = 500

NUM_INSIGHTS = 50

random.seed(RANDOM_SEED)

# ==========================================================
# BUSINESS TYPES
# ==========================================================

BUSINESS_TYPES = [

    "Coffee Shop",

    "Bakery",

    "Warung",

    "Laundry",

    "Toko Kelontong",

    "Barbershop",

    "Apotek"

]

# ==========================================================
# BUSINESS PROFILE
# ==========================================================

BUSINESS = {

    "name": "Demo Coffee",

    "owner": "Agus",

    "type": random.choice(BUSINESS_TYPES),

    "phone": "081234567890",

    "email": "owner@demo.com",

    "address": "Bandung",

    "currency": "IDR",

}

# ==========================================================
# REALISTIC PRODUCT CATALOG
# ==========================================================

PRODUCT_CATALOG = [

    {
        "name": "Americano",
        "category": "Minuman",
        "price": 22000,
        "cost": 10000,
        "unit": "cup",
        "weight": 25,
    },

    {
        "name": "Latte",
        "category": "Minuman",
        "price": 30000,
        "cost": 15000,
        "unit": "cup",
        "weight": 20,
    },

    {
        "name": "Cappuccino",
        "category": "Minuman",
        "price": 32000,
        "cost": 16000,
        "unit": "cup",
        "weight": 18,
    },

    {
        "name": "Mocha",
        "category": "Minuman",
        "price": 34000,
        "cost": 17000,
        "unit": "cup",
        "weight": 15,
    },

    {
        "name": "Espresso",
        "category": "Minuman",
        "price": 18000,
        "cost": 8000,
        "unit": "cup",
        "weight": 12,
    },

    {
        "name": "Es Kopi Susu",
        "category": "Minuman",
        "price": 28000,
        "cost": 14000,
        "unit": "cup",
        "weight": 30,
    },

    {
        "name": "Matcha Latte",
        "category": "Minuman",
        "price": 33000,
        "cost": 17000,
        "unit": "cup",
        "weight": 10,
    },

    {
        "name": "Chocolate",
        "category": "Minuman",
        "price": 30000,
        "cost": 15000,
        "unit": "cup",
        "weight": 10,
    },

    {
        "name": "Croissant",
        "category": "Makanan",
        "price": 25000,
        "cost": 12000,
        "unit": "pcs",
        "weight": 15,
    },

    {
        "name": "Brownies",
        "category": "Dessert",
        "price": 28000,
        "cost": 13000,
        "unit": "pcs",
        "weight": 12,
    },

    {
        "name": "Cheesecake",
        "category": "Dessert",
        "price": 35000,
        "cost": 18000,
        "unit": "slice",
        "weight": 8,
    },

    {
        "name": "Donut",
        "category": "Snack",
        "price": 15000,
        "cost": 7000,
        "unit": "pcs",
        "weight": 14,
    },

    {
        "name": "French Fries",
        "category": "Snack",
        "price": 22000,
        "cost": 9000,
        "unit": "box",
        "weight": 10,
    },

    {
        "name": "Chicken Sandwich",
        "category": "Makanan",
        "price": 38000,
        "cost": 19000,
        "unit": "pcs",
        "weight": 9,
    },

    {
        "name": "Mineral Water",
        "category": "Minuman",
        "price": 8000,
        "cost": 3000,
        "unit": "bottle",
        "weight": 18,
    },

]

# ==========================================================
# PAYMENT DISTRIBUTION
# ==========================================================

PAYMENT_METHODS = [

    "cash",

    "cash",

    "cash",

    "cash",

    "qris",

    "qris",

    "qris",

    "transfer",

    "transfer",

    "credit_card",

]

# ==========================================================
# TRANSACTION STATUS
# ==========================================================

TRANSACTION_STATUS = [

    "completed",

    "completed",

    "completed",

    "completed",

    "completed",

    "completed",

    "completed",

    "completed",

    "cancelled",

    "refunded",

]

# ==========================================================
# MARKETING PLATFORMS
# ==========================================================

PLATFORMS = [

    "Instagram",

    "Facebook",

    "TikTok",

    "WhatsApp",

]

# ==========================================================
# SQL HELPER
# ==========================================================

def sql(value):

    if value is None:
        return "NULL"

    if isinstance(value, bool):
        return "TRUE" if value else "FALSE"

    if isinstance(value, (int, float)):
        return str(value)

    return "'" + str(value).replace("'", "''") + "'"

# ==========================================================
# RANDOM HELPERS
# ==========================================================

def random_datetime(day: datetime) -> datetime:
    """
    Generate random business hour.
    """

    return day.replace(

        hour=random.randint(8, 21),

        minute=random.randint(0, 59),

        second=random.randint(0, 59),

        microsecond=0,

    )


def weekend_multiplier(day: datetime) -> float:
    """
    Weekend sales are higher.
    """

    if day.weekday() == 5:
        return 1.6

    if day.weekday() == 6:
        return 1.8

    return 1.0


def random_quantity(category: str) -> int:
    """
    More realistic quantity.
    """

    if category == "Minuman":
        return random.randint(1, 2)

    if category == "Snack":
        return random.randint(1, 3)

    if category == "Dessert":
        return random.randint(1, 2)

    return random.randint(1, 4)

# ==========================================================
# BUSINESS GENERATOR
# ==========================================================

business_id = str(uuid.uuid4())

business_sql = f"""
INSERT INTO business_profile
(
    id,
    business_name,
    owner_name,
    business_type,
    phone,
    email,
    address,
    currency
)
VALUES
(
    {sql(business_id)},
    {sql(BUSINESS["name"])},
    {sql(BUSINESS["owner"])},
    {sql(BUSINESS["type"])},
    {sql(BUSINESS["phone"])},
    {sql(BUSINESS["email"])},
    {sql(BUSINESS["address"])},
    {sql(BUSINESS["currency"])}
)
ON CONFLICT DO NOTHING;
"""

# ==========================================================
# PRODUCT GENERATOR
# ==========================================================

products = []

product_sql = []

sku_number = 1

while len(products) < NUM_PRODUCTS:

    template = random.choice(PRODUCT_CATALOG)

    name = template["name"]

    # Hindari nama yang sama
    if any(p["name"] == name for p in products):

        name = f"{name} {len(products)+1}"

    sku = f"SKU-{sku_number:04d}"

    sku_number += 1

    stock = random.randint(20, 150)

    minimum_stock = random.randint(5, 20)

    # Sebagian produk dibuat hampir habis
    if random.random() < 0.15:

        stock = random.randint(1, minimum_stock)

    pid = str(uuid.uuid4())

    product = {

        "id": pid,

        "business_id": business_id,

        "name": name,

        "category": template["category"],

        "selling_price": template["price"],

        "cost_price": template["cost"],

        "stock": stock,

        "minimum_stock": minimum_stock,

        "unit": template["unit"],

        "weight": template["weight"],

    }

    products.append(product)

    product_sql.append(
f"""
INSERT INTO products
(
    id,
    business_id,
    name,
    category,
    sku,
    selling_price,
    cost_price,
    stock,
    minimum_stock,
    unit
)
VALUES
(
    {sql(pid)},
    {sql(business_id)},
    {sql(name)},
    {sql(template["category"])},
    {sql(sku)},
    {template["price"]},
    {template["cost"]},
    {stock},
    {minimum_stock},
    {sql(template["unit"])}
)
ON CONFLICT (sku)
DO NOTHING;
"""
    )

# ==========================================================
# WEIGHTED PRODUCT LIST
# ==========================================================

weighted_products = []

for product in products:

    weighted_products.extend(

        [product] * product["weight"]

    )

# ==========================================================
# INVENTORY SIMULATION
# ==========================================================

inventory = {}

for product in products:

    inventory[product["id"]] = {

        "stock": product["stock"],

        "minimum_stock": product["minimum_stock"]

    }

# ==========================================================
# PRODUCT PICKER
# ==========================================================

def choose_product():
    """
    Weighted random product.
    Produk populer lebih sering dipilih.
    """

    return random.choice(weighted_products)

# ==========================================================
# STOCK UPDATE
# ==========================================================

def reduce_stock(product_id: str, qty: int):

    if product_id not in inventory:

        return

    inventory[product_id]["stock"] = max(
        0,
        inventory[product_id]["stock"] - qty
    )

# ==========================================================
# LOW STOCK REPORT
# ==========================================================

def low_stock_products():

    result = []

    for product in products:

        item = inventory[product["id"]]

        if item["stock"] <= item["minimum_stock"]:

            result.append(product)

    return result

# ==========================================================
# PRICE SIMULATION
# ==========================================================

def selling_price(product):

    """
    Kadang ada promo.

    ±10%
    """

    price = product["selling_price"]

    if random.random() < 0.10:

        discount = random.choice([5, 10, 15])

        price = int(

            price *

            (100 - discount)

            / 100

        )

    return price

# ==========================================================
# PRODUCT STATISTICS
# ==========================================================

print("=" * 60)
print("Products generated")
print("=" * 60)

print("Business :", BUSINESS["name"])
print("Type     :", BUSINESS["type"])
print("Products :", len(products))
print("Low Stock:", len(low_stock_products()))

# ==========================================================
# TRANSACTION GENERATOR
# ==========================================================

transaction_sql = []

today = datetime.now()

transaction_counter = 0

# ==========================================================
# GENERATE TRANSACTIONS
# ==========================================================

for day_offset in range(DAYS_HISTORY):

    current_day = today - timedelta(days=day_offset)

    multiplier = weekend_multiplier(current_day)

    transaction_count = int(

        random.randint(

            MIN_TRANSACTION_PER_DAY,

            MAX_TRANSACTION_PER_DAY

        ) * multiplier

    )

    for _ in range(transaction_count):

        # --------------------------------------------------
        # Pick product using weighted popularity
        # --------------------------------------------------

        product = choose_product()

        qty = random_quantity(product["category"])

        # --------------------------------------------------
        # Skip if stock empty
        # --------------------------------------------------

        current_stock = inventory[product["id"]]["stock"]

        if current_stock <= 0:

            continue

        if qty > current_stock:

            qty = current_stock

        # --------------------------------------------------
        # Selling price (promotion simulation)
        # --------------------------------------------------

        unit_price = selling_price(product)

        total_price = qty * unit_price

        # --------------------------------------------------
        # Payment
        # --------------------------------------------------

        payment = random.choice(PAYMENT_METHODS)

        # --------------------------------------------------
        # Status
        # --------------------------------------------------

        status = random.choice(TRANSACTION_STATUS)

        # --------------------------------------------------
        # Random transaction time
        # --------------------------------------------------

        trx_datetime = random_datetime(current_day)

        # --------------------------------------------------
        # Notes
        # --------------------------------------------------

        if status == "completed":

            notes = "Completed successfully."

        elif status == "cancelled":

            notes = "Cancelled by customer."

        else:

            notes = "Refund processed."

        # --------------------------------------------------
        # Reduce stock only for completed transactions
        # --------------------------------------------------

        if status == "completed":

            reduce_stock(

                product["id"],

                qty

            )

        # --------------------------------------------------
        # SQL
        # --------------------------------------------------

        transaction_sql.append(

f"""
INSERT INTO transactions
(
    id,
    business_id,
    product_id,
    product_name,
    quantity,
    unit_price,
    total_price,
    payment_method,
    status,
    notes,
    transaction_date
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(product["id"])},
    {sql(product["name"])},
    {qty},
    {unit_price},
    {total_price},
    '{payment}',
    '{status}',
    {sql(notes)},
    '{trx_datetime.isoformat()}'
);
"""
        )

        transaction_counter += 1

# ==========================================================
# SALES SUMMARY
# ==========================================================

completed_transaction = 0

cancelled_transaction = 0

refunded_transaction = 0

revenue = 0

for sql_statement in transaction_sql:

    if "'completed'" in sql_statement:

        completed_transaction += 1

    elif "'cancelled'" in sql_statement:

        cancelled_transaction += 1

    elif "'refunded'" in sql_statement:

        refunded_transaction += 1

# ==========================================================
# LOW STOCK AFTER SALES
# ==========================================================

low_stock = low_stock_products()

print("=" * 60)
print("Transaction generation completed")
print("=" * 60)

print("Transactions :", transaction_counter)

print("Completed    :", completed_transaction)

print("Cancelled    :", cancelled_transaction)

print("Refunded     :", refunded_transaction)

print("Low Stock    :", len(low_stock))

# ==========================================================
# INVENTORY REPORT
# ==========================================================

for item in low_stock[:10]:

    remain = inventory[item["id"]]["stock"]

    minimum = inventory[item["id"]]["minimum_stock"]

    print(

        f"{item['name']:<25}"

        f"Stock={remain:<4}"

        f"Minimum={minimum}"

    )

# ==========================================================
# MARKETING HISTORY
# ==========================================================

marketing_sql = []

MARKETING_PROMPTS = [

    "Create Instagram caption",

    "Create Facebook promotion",

    "Create TikTok campaign",

    "Create WhatsApp broadcast",

    "Create product advertisement",

    "Promote today's best seller",

]

HASHTAGS = [

    "#coffee #umkm",

    "#coffeeshop #bandung",

    "#kuliner #kopi",

    "#localbusiness",

    "#freshcoffee",

    "#viralcoffee",

]

for _ in range(NUM_MARKETING_HISTORY):

    product = random.choice(products)

    platform = random.choice(PLATFORMS)

    prompt = random.choice(MARKETING_PROMPTS)

    caption = (

        f"Nikmati {product['name']} "

        f"hanya Rp{product['selling_price']:,}. "

        "Tersedia hari ini!"

    )

    hashtags = random.choice(HASHTAGS)

    created = datetime.now() - timedelta(

        days=random.randint(0, DAYS_HISTORY)

    )

    marketing_sql.append(

f"""
INSERT INTO marketing_history
(
    id,
    business_id,
    product_id,
    platform,
    prompt,
    caption,
    hashtags,
    created_at
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(product["id"])},
    {sql(platform)},
    {sql(prompt)},
    {sql(caption)},
    {sql(hashtags)},
    '{created.isoformat()}'
);
"""
    )

print("=" * 60)
print("Marketing history generated")
print("=" * 60)
print("Records :", len(marketing_sql))

# ==========================================================
# AI CONVERSATIONS
# ==========================================================

conversation_sql = []

AI_PAIRS = [

(
"Berapa omzet hari ini?",
"Omzet hari ini sekitar Rp2.450.000."
),

(
"Produk terlaris apa?",
"Es Kopi Susu merupakan produk terlaris."
),

(
"Produk yang stoknya hampir habis?",
"Croissant hampir habis dan perlu restock."
),

(
"Buat caption Instagram.",
"Caption berhasil dibuat untuk Instagram."
),

(
"Tambah stok Americano.",
"Stok Americano berhasil diperbarui."
),

(
"Penjualan minggu ini bagaimana?",
"Penjualan meningkat dibanding minggu lalu."
),

(
"Apakah QRIS sering digunakan?",
"QRIS merupakan metode pembayaran kedua terbanyak."
),

(
"Produk mana yang kurang laku?",
"Cheesecake memiliki penjualan paling rendah."
),

(
"Apakah akhir pekan lebih ramai?",
"Ya, transaksi meningkat signifikan pada Sabtu dan Minggu."
),

(
"Buat promosi hari ini.",
"Promo berhasil dibuat untuk pelanggan."
),

]

AGENTS = [

"router",

"transaction",

"inventory",

"marketing",

"insight",

]

for _ in range(NUM_AI_SESSION):

    session_id = str(uuid.uuid4())

    question, answer = random.choice(AI_PAIRS)

    created = datetime.now() - timedelta(

        days=random.randint(0, DAYS_HISTORY)

    )

    user_agent = "router"

    assistant_agent = random.choice(AGENTS)

    conversation_sql.append(

f"""
INSERT INTO ai_conversations
(
    id,
    business_id,
    session_id,
    role,
    agent,
    message,
    created_at
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(session_id)},
    'user',
    {sql(user_agent)},
    {sql(question)},
    '{created.isoformat()}'
);

INSERT INTO ai_conversations
(
    id,
    business_id,
    session_id,
    role,
    agent,
    message,
    created_at
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(session_id)},
    'assistant',
    {sql(assistant_agent)},
    {sql(answer)},
    '{created.isoformat()}'
);
"""
    )

print("=" * 60)
print("AI conversations generated")
print("=" * 60)
print("Sessions :", len(conversation_sql))
print("Messages :", len(conversation_sql) * 2)

# ==========================================================
# AI CONVERSATIONS
# ==========================================================

conversation_pairs = [
    (
        "Berapa omzet hari ini?",
        "Omzet hari ini mencapai Rp2.450.000."
    ),
    (
        "Produk terlaris minggu ini?",
        "Latte merupakan produk terlaris minggu ini."
    ),
    (
        "Tambah stok Croissant.",
        "Stok Croissant berhasil ditambahkan."
    ),
    (
        "Buat caption Instagram.",
        "Caption Instagram berhasil dibuat."
    ),
    (
        "Bagaimana kondisi stok?",
        "Beberapa produk berada di bawah minimum stock."
    ),
    (
        "Berapa transaksi bulan ini?",
        "Jumlah transaksi bulan ini meningkat dibanding bulan lalu."
    ),
    (
        "Produk apa yang perlu dipromosikan?",
        "Brownies memiliki penjualan rendah dan layak dipromosikan."
    ),
    (
        "Bagaimana penjualan QRIS?",
        "Pembayaran QRIS menunjukkan tren meningkat."
    ),
]

conversation_sql = []

for _ in range(500):

    session_id = str(uuid.uuid4())

    question, answer = random.choice(conversation_pairs)

    conversation_sql.append(
        f"""
INSERT INTO ai_conversations
(
    id,
    business_id,
    session_id,
    role,
    agent,
    message
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(session_id)},
    'user',
    'router',
    {sql(question)}
);
"""
    )

    conversation_sql.append(
        f"""
INSERT INTO ai_conversations
(
    id,
    business_id,
    session_id,
    role,
    agent,
    message
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(session_id)},
    'assistant',
    'copilot',
    {sql(answer)}
);
"""
    )

# ==========================================================
# INSIGHTS
# ==========================================================

insight_templates = [
    (
        "sales",
        "Omzet Mingguan",
        "Penjualan minggu ini meningkat dibanding minggu sebelumnya."
    ),
    (
        "sales",
        "Produk Terlaris",
        "Latte menjadi produk dengan penjualan tertinggi."
    ),
    (
        "inventory",
        "Stok Rendah",
        "Croissant hampir habis dan perlu segera di-restock."
    ),
    (
        "marketing",
        "QRIS Meningkat",
        "Penggunaan QRIS meningkat dalam 30 hari terakhir."
    ),
    (
        "marketing",
        "Produk Kurang Laku",
        "Brownies memiliki penjualan rendah dan layak dipromosikan."
    ),
    (
        "customer",
        "Jam Ramai",
        "Transaksi paling tinggi terjadi pukul 17.00–20.00."
    ),
    (
        "general",
        "Ringkasan Bulanan",
        "Kinerja bisnis tetap stabil selama bulan ini."
    ),
]

insight_sql = []

for _ in range(50):

    category, title, content = random.choice(insight_templates)

    insight_sql.append(
        f"""
INSERT INTO insights
(
    id,
    business_id,
    insight_category,
    title,
    content
)
VALUES
(
    {sql(str(uuid.uuid4()))},
    {sql(business_id)},
    {sql(category)},
    {sql(title)},
    {sql(content)}
);
"""
    )

# ==========================================================
# WRITE SQL FILE
# ==========================================================

sql_output = []

sql_output.append("-- ==========================================================")
sql_output.append("-- UMKM Copilot AI")
sql_output.append("-- Auto Generated Seed")
sql_output.append("-- ==========================================================")
sql_output.append("")
sql_output.append("BEGIN;")
sql_output.append("")

sql_output.append(business_sql)

sql_output.extend(product_sql)
sql_output.extend(transaction_sql)
sql_output.extend(marketing_sql)
sql_output.extend(conversation_sql)
sql_output.extend(insight_sql)

sql_output.append("")
sql_output.append("COMMIT;")
sql_output.append("")

OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)

OUTPUT_FILE.write_text(
    "\n".join(sql_output),
    encoding="utf-8"
)

# ==========================================================
# SUMMARY
# ==========================================================

print("=" * 60)
print("UMKM Copilot AI Demo Seed Generated")
print("=" * 60)
print(f"Output File      : {OUTPUT_FILE.resolve()}")
print(f"Business         : 1")
print(f"Products         : {len(products)}")
print(f"Transactions     : {len(transaction_sql)}")
print(f"Marketing Posts  : {len(marketing_sql)}")
print(f"Conversations    : {len(conversation_sql)}")
print(f"Insights         : {len(insight_sql)}")
print("=" * 60)