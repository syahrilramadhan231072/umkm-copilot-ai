-- ==========================================================
-- UMKM Copilot AI
-- Auto Generated Seed
-- ==========================================================

BEGIN;


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
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Demo Coffee',
    'Agus',
    'Barbershop',
    '081234567890',
    'owner@demo.com',
    'Bandung',
    'IDR'
)
ON CONFLICT DO NOTHING;


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
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Latte',
    'Minuman',
    'SKU-0001',
    30000,
    15000,
    26,
    13,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Cappuccino',
    'Minuman',
    'SKU-0002',
    32000,
    16000,
    46,
    7,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Americano',
    'Minuman',
    'SKU-0003',
    22000,
    10000,
    27,
    7,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Croissant',
    'Makanan',
    'SKU-0004',
    25000,
    12000,
    26,
    11,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Donut',
    'Snack',
    'SKU-0005',
    15000,
    7000,
    127,
    12,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'ac40f533-b291-4954-9525-c7f766410f6c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Espresso',
    'Minuman',
    'SKU-0006',
    18000,
    8000,
    21,
    10,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Es Kopi Susu',
    'Minuman',
    'SKU-0007',
    28000,
    14000,
    91,
    9,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries',
    'Snack',
    'SKU-0008',
    22000,
    9000,
    2,
    8,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Es Kopi Susu 9',
    'Minuman',
    'SKU-0009',
    28000,
    14000,
    108,
    13,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Donut 10',
    'Snack',
    'SKU-0010',
    15000,
    7000,
    137,
    8,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '38efc317-230b-4476-b375-582f84f58917',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Matcha Latte',
    'Minuman',
    'SKU-0011',
    33000,
    17000,
    40,
    14,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Brownies',
    'Dessert',
    'SKU-0012',
    28000,
    13000,
    112,
    11,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Americano 13',
    'Minuman',
    'SKU-0013',
    22000,
    10000,
    78,
    14,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Chicken Sandwich',
    'Makanan',
    'SKU-0014',
    38000,
    19000,
    79,
    8,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Chocolate',
    'Minuman',
    'SKU-0015',
    30000,
    15000,
    113,
    10,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Mocha',
    'Minuman',
    'SKU-0016',
    34000,
    17000,
    88,
    7,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '06be25cd-93c3-4805-9119-86738ea795fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Cappuccino 17',
    'Minuman',
    'SKU-0017',
    32000,
    16000,
    82,
    10,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Espresso 18',
    'Minuman',
    'SKU-0018',
    18000,
    8000,
    76,
    15,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries 19',
    'Snack',
    'SKU-0019',
    22000,
    9000,
    34,
    12,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries 20',
    'Snack',
    'SKU-0020',
    22000,
    9000,
    100,
    17,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Mocha 21',
    'Minuman',
    'SKU-0021',
    34000,
    17000,
    100,
    11,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Matcha Latte 22',
    'Minuman',
    'SKU-0022',
    33000,
    17000,
    137,
    9,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Mocha 23',
    'Minuman',
    'SKU-0023',
    34000,
    17000,
    87,
    18,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Matcha Latte 24',
    'Minuman',
    'SKU-0024',
    33000,
    17000,
    112,
    12,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'c3fa5a1f-ace5-40d4-ab57-eea46d289ab9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Cappuccino 25',
    'Minuman',
    'SKU-0025',
    32000,
    16000,
    2,
    20,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Chicken Sandwich 26',
    'Makanan',
    'SKU-0026',
    38000,
    19000,
    48,
    9,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries 27',
    'Snack',
    'SKU-0027',
    22000,
    9000,
    128,
    7,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Brownies 28',
    'Dessert',
    'SKU-0028',
    28000,
    13000,
    139,
    13,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '972f5405-721f-487d-ab7d-578d96b2671e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Chicken Sandwich 29',
    'Makanan',
    'SKU-0029',
    38000,
    19000,
    22,
    8,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Croissant 30',
    'Makanan',
    'SKU-0030',
    25000,
    12000,
    7,
    15,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Cappuccino 31',
    'Minuman',
    'SKU-0031',
    32000,
    16000,
    136,
    5,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Mineral Water',
    'Minuman',
    'SKU-0032',
    8000,
    3000,
    87,
    10,
    'bottle'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Latte 33',
    'Minuman',
    'SKU-0033',
    30000,
    15000,
    96,
    11,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries 34',
    'Snack',
    'SKU-0034',
    22000,
    9000,
    61,
    5,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Chocolate 35',
    'Minuman',
    'SKU-0035',
    30000,
    15000,
    24,
    8,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Mineral Water 36',
    'Minuman',
    'SKU-0036',
    8000,
    3000,
    10,
    12,
    'bottle'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Latte 37',
    'Minuman',
    'SKU-0037',
    30000,
    15000,
    41,
    20,
    'cup'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'French Fries 38',
    'Snack',
    'SKU-0038',
    22000,
    9000,
    52,
    9,
    'box'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Croissant 39',
    'Makanan',
    'SKU-0039',
    25000,
    12000,
    62,
    13,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'Brownies 40',
    'Dessert',
    'SKU-0040',
    28000,
    13000,
    128,
    11,
    'pcs'
)
ON CONFLICT (sku)
DO NOTHING;


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
    'cf995936-a54e-410b-b620-ab5b63cea240',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-05T16:28:07'
);


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
    'c4055a0f-21a6-4858-aa94-4607ecc7bdb9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    28500,
    28500,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-05T11:37:14'
);


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
    '7c803de7-d0e2-45ce-a803-10e9bf7e813e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T09:57:02'
);


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
    '3e2e6134-e97f-4690-9e00-8051fa5ed472',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-05T11:34:08'
);


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
    '656b0e0a-a039-42fa-af02-c4a05232bf5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T11:06:06'
);


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
    '46fb19de-1658-4d3a-a213-f9f3e4befff0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'Croissant 30',
    3,
    25000,
    75000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T18:41:41'
);


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
    '5f261bda-84cb-451e-b890-3b36b2cdbac6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-05T11:12:12'
);


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
    '010b0b51-d9ff-4913-b172-4b71b7f104ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T15:15:55'
);


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
    '7df53849-5b13-447d-b3bd-8b505538f343',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    4,
    25000,
    100000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T08:41:34'
);


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
    'a26a6260-5d2d-4968-b632-e54af33c2dbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T14:31:30'
);


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
    'eadafd5d-2262-4d71-855e-298d8b36b2e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T08:24:16'
);


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
    '23d5af87-aa53-438a-ae97-8e2e5a9be7c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T10:12:18'
);


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
    'b4b75a1c-c722-4a37-929a-eda9d027053d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T19:20:03'
);


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
    'f9a8c75d-3041-4dd2-ba5a-bc0cd85fc9ab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T08:32:05'
);


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
    '6626632a-38d7-498e-91f1-5068f05e1725',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T09:56:36'
);


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
    'a119658e-7af1-4613-bdce-c829997e593d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-07-05T17:33:20'
);


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
    '10d7786e-b943-4868-835e-3b69ff799da1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-05T12:25:08'
);


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
    '47cc45eb-2568-4337-bd05-ef9efebb50e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-05T15:39:36'
);


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
    '0ad18088-7bf3-481d-9cc3-d940062d9e27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-05T10:59:22'
);


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
    '7bae92a2-abd8-4ea6-82ca-a3bcaf0bfc6e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-04T19:19:39'
);


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
    '6ba9eb08-836f-45f2-acc0-f333d9da9c18',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-04T18:06:56'
);


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
    'f18d0e2d-145b-437c-bd1f-817a5d1a93f0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    'French Fries',
    2,
    22000,
    44000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-04T10:17:18'
);


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
    '6279d1c6-a62e-4329-ab66-3a1eb0f3de8b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-04T15:16:57'
);


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
    '00fd2d29-5c09-42a4-b7be-3ca470ce0069',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-04T08:21:49'
);


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
    'd670c434-3ff1-4388-9356-f2c89d632197',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-04T19:27:35'
);


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
    '9e4f2de5-0b8e-4cf1-958b-dcd8afa3fdf0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    25500,
    25500,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-04T08:53:23'
);


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
    'acd5cd89-d15b-4746-a776-bf991c55e94d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-04T13:57:59'
);


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
    '96358e2b-181b-4f86-9ff0-9ada4eea08ad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-04T13:49:35'
);


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
    '1efba0a7-995e-44c1-8796-82c7bcd605de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-04T20:51:11'
);


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
    '19530510-b914-4948-8034-17a6a19ccd4b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    1,
    38000,
    38000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-04T20:42:55'
);


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
    'b677767c-e190-44b2-967f-6623946f6f55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-03T21:02:54'
);


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
    '51b6d4d7-6524-441a-a226-cace338cf955',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-03T12:52:50'
);


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
    'f6993e6d-b621-4e61-9424-2f8f606ff816',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    20900,
    20900,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-03T12:55:04'
);


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
    'fa4e6859-63e7-4ea0-b052-58a2bf552f3c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-03T13:01:07'
);


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
    '4183e4bd-c027-49cc-b6a3-3aa0bafe74f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-03T09:38:27'
);


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
    'f67fe25d-72b1-41ff-b32c-5ce3965d5d08',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-03T14:57:36'
);


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
    'b33957f9-2e61-4832-b9bc-e25c20d8ba23',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    29700,
    59400,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-03T20:34:43'
);


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
    '79bd2c1d-3885-4b4e-a9f4-55be458f4eda',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-07-03T13:42:54'
);


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
    'd99537d1-4dbd-4c43-a801-b3bdf1fd0331',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-03T14:44:18'
);


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
    'b226b43b-2c47-4267-a0d0-e473ca967fd7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    2,
    25000,
    50000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-03T17:36:19'
);


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
    '102dd090-5646-4b94-bbe1-f20d39c2cb13',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-03T20:37:38'
);


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
    'deb38c98-7d9d-41a2-861a-1984ba5ad53f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-03T15:50:57'
);


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
    '3207cd99-481b-4567-b633-741ae41ad438',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-07-02T09:52:48'
);


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
    'cfb24459-9312-49be-96d3-c991ff21dbac',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-02T08:02:15'
);


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
    'fe3376bc-aed6-4eec-b906-e3ce45c6de5c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-07-02T19:44:24'
);


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
    'e11f72b7-ee23-4f9a-97df-af0e4e12d233',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-02T20:27:14'
);


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
    '0898035d-f574-4d72-a32b-e8ae2ca870a4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-02T11:58:54'
);


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
    'd914c1ee-2d7e-4880-9cc3-078e7b54a248',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-07-02T16:38:20'
);


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
    '4cf19997-f080-41f3-b869-6e817f54812d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-02T10:47:55'
);


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
    '91da0018-1058-4c29-abdb-00395258e93a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-02T20:49:33'
);


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
    '4bf6619d-ef0d-40c5-9ff3-d734ae0af9d2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-02T11:17:21'
);


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
    '7201bb00-77df-4b1e-99f6-6b0cb975ff15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-02T19:09:45'
);


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
    'af8669bf-a0f0-4ef2-a099-3a5e1f702411',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    4,
    25000,
    100000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-01T14:03:13'
);


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
    'e538f2f6-4de5-4ae3-8d15-c6ccf1686af0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'Croissant 30',
    4,
    25000,
    100000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-07-01T21:56:48'
);


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
    'ae1f62e9-f1b0-4deb-bf24-ebadb9295ca9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-01T20:24:54'
);


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
    'a5412713-5c90-48cd-ac8e-dab53abbe7f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-07-01T14:21:42'
);


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
    '209bcfc5-5bb9-4f8a-80c6-50021bd3e58f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-07-01T16:01:58'
);


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
    '8f4d716d-2094-4683-9bf1-1e4077490b0e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-01T18:27:08'
);


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
    '4ffe2d73-ec34-40d6-828b-d17f65781e9f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    7200,
    7200,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-01T15:20:21'
);


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
    '271b7bdf-eb72-40a2-9185-7e3a9e1a0616',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    3,
    38000,
    114000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-01T21:05:30'
);


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
    'fcc9ac7d-2172-4055-b449-1fcbcd6b8fdb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-07-01T18:04:49'
);


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
    'aad2b099-d525-494c-8d3b-8baea6715f23',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-07-01T17:09:15'
);


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
    '48c6131f-68a1-4bce-835c-b2a25de28727',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-30T19:16:49'
);


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
    '90dde919-7e4c-442f-a9e2-907e0760a547',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3fa5a1f-ace5-40d4-ab57-eea46d289ab9',
    'Cappuccino 25',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-30T12:06:37'
);


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
    '290c6ef4-c642-4f1d-9f3d-3a208df0669c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-30T19:12:04'
);


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
    '1ae6180e-8272-4d64-b3a9-4b63c8dfffce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-30T20:07:50'
);


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
    '39352c36-ef34-407f-9404-493ff6f9bda4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    25000,
    25000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-30T09:32:41'
);


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
    '2af5bd6c-89d1-4fd1-8666-670cd301fdd7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-30T14:23:40'
);


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
    '24187a2e-707b-4315-9444-406b9b29a63d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-30T17:51:58'
);


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
    'b84b5bd7-c074-4a87-adad-f52424e4d546',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-30T13:54:15'
);


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
    '6efdedc5-5926-4c9e-9fbf-2651fdc1e3be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-30T17:39:42'
);


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
    '22c88a66-cb16-4c47-a65c-0374c621aa77',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T15:13:22'
);


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
    '4329cf6f-80f0-48da-8569-3530880e0547',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-29T16:00:33'
);


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
    '60538dd3-672e-4479-ac43-9d6332dc19ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T16:48:15'
);


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
    '1d6ae4b9-2062-422d-8692-a2e974781a4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-29T12:14:25'
);


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
    'c9cdd6e5-a814-40cf-baa7-a09afc46b404',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T16:33:22'
);


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
    '363ccf08-8567-47bd-9289-221f3cfd1ed8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T09:46:12'
);


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
    'd1a16ea7-81c4-43ab-809b-dd3f6db804a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-29T11:47:30'
);


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
    'b0628e5a-c946-452e-93ad-c865e7548669',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-29T11:23:11'
);


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
    'c9d3e736-4eff-4379-8fba-d27bb4604f25',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-29T08:03:35'
);


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
    'c4170286-f17e-4ed6-aacb-e69cb5f89ea4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    22000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-29T21:00:36'
);


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
    '7626e516-beba-4c51-8439-8380de6b81c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T08:16:55'
);


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
    '841deb04-d49b-426a-bf04-2b5d0ac78f61',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-29T09:36:40'
);


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
    'fd5789b3-48ab-439d-8a48-829d93716988',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-29T09:15:07'
);


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
    '8de15c94-6029-4df1-b69c-e1fdff92b5f0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-29T20:33:24'
);


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
    'cb1d1afd-152b-481d-9d53-ff5fcd5d9a7f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-29T12:36:39'
);


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
    'a51a7c22-1477-49d2-ae26-6d3894aa6d0b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-29T12:42:05'
);


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
    '17a2f41d-5151-4f42-bd7f-3124d81ce077',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-28T14:28:44'
);


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
    'e89265c5-7d93-4a8a-aa73-8680bb0e6ca7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    27000,
    54000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-28T09:43:14'
);


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
    'e7982f5c-3bbc-467c-9ffb-9f9875d6bf72',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-28T18:09:58'
);


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
    '69a132ab-9caf-4c68-bd00-9695376b2a34',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    30400,
    30400,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-28T19:52:36'
);


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
    '0921eff9-c224-46cc-b4f6-d7a55bdc1dd2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-28T12:32:34'
);


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
    'fd690a5b-a18e-4fa5-a61a-649048001fe7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    20900,
    41800,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-28T17:16:01'
);


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
    'ec364627-2950-4fff-a77a-2a72c4db678c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-06-28T08:48:43'
);


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
    '6b8ffea2-966a-4e75-be3a-2ee48ac92645',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-28T16:41:28'
);


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
    'a3116f45-912d-42e9-9e4a-3648b3440fa9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-28T09:30:22'
);


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
    '3f92c99d-d83c-4f47-aa5d-e0305bfc16f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-28T13:26:44'
);


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
    '12f5fd0b-5d87-4240-91c6-da2983fbf083',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-28T08:29:05'
);


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
    'd1576868-8c05-499d-afd8-d48716db04f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-28T21:00:42'
);


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
    'e57c2510-5808-4d3c-95bd-d66d40f786c4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-28T13:39:48'
);


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
    '30b1fe10-1ced-4f9e-83b2-5cb50229fa41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-28T16:08:59'
);


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
    '3a930fca-59fd-438b-a57a-d056680f0597',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-28T08:40:38'
);


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
    '2556c083-dca2-4649-8860-8628fd62565c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-28T14:05:14'
);


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
    'a44cc957-bcf6-45e3-a3dc-6a19cb940b24',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-28T19:18:32'
);


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
    '0b729f5e-7e71-430c-9ce7-3c01c887b2dc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-28T15:35:09'
);


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
    'ebc2e598-4495-4cc1-be40-3ba8cfeafb85',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T13:59:50'
);


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
    '9cdf896d-d636-47cc-9414-fbe0d0e92d8b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T21:37:37'
);


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
    '6340482b-5d50-4e62-a167-e412c29998eb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-27T13:35:48'
);


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
    '02c1ca3f-c2af-4ebf-9551-4becff91e562',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T19:15:36'
);


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
    '5271b4b1-c248-4917-9f06-d87918e2640e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T13:47:30'
);


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
    '3d3914bf-ce2c-47fe-8067-13ae23f78783',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T08:08:32'
);


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
    'd479c4ad-3781-4df2-9588-6b29abdba988',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-27T16:58:29'
);


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
    '7fffa802-fdd2-4970-812c-c7c038932717',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T15:50:16'
);


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
    '618845bf-7ce1-4961-b391-fe517064aad7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-27T14:20:40'
);


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
    '42de7796-1359-4372-a732-cdbcee03bfd5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    20900,
    62700,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T11:47:05'
);


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
    '83c98f8c-9be8-441b-b6c0-e164d704dc75',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T10:44:19'
);


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
    '39fa54c4-edb5-4f8f-aa9c-af8e2660a4be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T13:23:27'
);


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
    '217ecab2-f686-48d9-8291-d8d5f18ca628',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-27T10:11:05'
);


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
    '7b275383-9475-4cde-a87a-c8be95be46a2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-27T11:29:40'
);


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
    '6e39e8b4-2c18-49ae-89a0-12eb5dc0208d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T12:43:34'
);


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
    '9e9b1279-7369-4068-9832-69edb77672c6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-27T12:40:27'
);


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
    '44ba45db-7786-49e0-94ac-911647ba1855',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T21:30:06'
);


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
    'bf4b6f15-8931-4d5c-b220-5ed7bf56d25d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    4,
    38000,
    152000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-27T19:18:01'
);


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
    '2c9d1828-9c7a-46d9-9286-8ce5b7002918',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    18700,
    37400,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-27T19:31:53'
);


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
    'd97b965e-89d0-404a-a530-c762b91c8c4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T18:12:39'
);


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
    '463ccefc-2d3d-4bdc-b8df-a4b038b16793',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-27T20:28:02'
);


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
    'af5eeade-ffbc-416d-9323-fc161bebd3a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3fa5a1f-ace5-40d4-ab57-eea46d289ab9',
    'Cappuccino 25',
    1,
    28800,
    28800,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T10:12:08'
);


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
    '67db4a63-db6d-449d-9a8a-86da53da5496',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T12:58:52'
);


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
    '830163d4-973a-4fca-a48e-6fa6883891ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T15:04:09'
);


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
    'f68860bb-4cf0-4d89-a0c8-c0cdb801b0aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-27T09:50:25'
);


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
    '0c5a736b-1d57-4579-bb5f-a0ed2ec5cc5c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-27T18:47:43'
);


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
    '9bad9a28-2967-46e8-bc4c-f4823fc6fef5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-27T18:14:30'
);


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
    'b39c2b6e-72fc-497b-84a9-e9be978b5b7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-26T18:52:29'
);


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
    '5ed5638a-9c2a-440e-941b-cf557eb578a9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-26T08:19:31'
);


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
    '56d378fc-56ea-43cc-9746-2f5d68b459f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-26T14:29:23'
);


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
    '2de50c10-7524-4675-9ade-7f54b4ac682b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-26T18:06:53'
);


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
    '6c5d1926-c6b2-4f90-bded-d5297cf5dd88',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-26T19:23:13'
);


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
    '6b38dfe8-087c-424f-b47a-a2b3295584b5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T16:57:41'
);


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
    '871d8cb6-778b-482c-97f0-c9496841a198',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T21:52:29'
);


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
    'a5773607-8152-4bc5-9b4b-20550ad8f4ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-25T08:50:21'
);


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
    '9bb0a11b-40ae-4839-8ab1-e05063723a8a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T21:48:35'
);


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
    'e38acf44-1685-47a6-8eb1-69a849244dca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T20:09:50'
);


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
    'a646341b-095d-4fb1-ab81-272ea167519f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T16:16:51'
);


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
    '953ced87-8ab1-4695-98e7-78bc31189bb1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T08:22:50'
);


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
    '0ba846ad-c0c6-4088-9cf9-b011d80491db',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    34200,
    102600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T19:26:33'
);


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
    'bbc32e86-c01c-4d6f-881d-539af0c9e3fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-25T17:06:28'
);


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
    '2fdf5770-8bdf-4631-a3fd-de6b9d0fa662',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-25T12:29:41'
);


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
    'ca7f04f2-419e-4997-b6e2-8cbf71abe0af',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-25T18:06:31'
);


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
    '756dd756-3248-4860-b379-dd10edcee7ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-25T10:04:08'
);


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
    '6caaf891-4b70-46e8-a03e-8c127eff5c43',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-25T12:29:32'
);


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
    'f5bb12e9-814e-46a6-ac9a-ff42ca2893a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T13:52:29'
);


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
    '6eafb3e6-6ad8-48b3-9096-ecf29e9ba349',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-25T13:42:16'
);


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
    '1a05ab0b-3bb1-424d-a0a8-a1bfa7806640',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    28500,
    28500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-25T09:47:47'
);


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
    'a6459285-95f2-4ee0-8fbf-342cef446cf1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-24T21:42:48'
);


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
    '696503e6-f97b-4cb0-9bc7-7a23218a7fd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-24T11:09:42'
);


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
    '2d2f6c81-1383-46d7-b7cf-88881a176d29',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-24T13:07:48'
);


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
    'fc74f59f-06c0-443f-bc7e-a96d90681cd1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-24T17:43:41'
);


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
    '8dc944b9-4d3a-4f6f-8737-8a74f9ba94cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    25000,
    25000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-24T10:17:44'
);


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
    '10604f61-08ba-44bc-b6f0-5da5b779d489',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    32300,
    64600,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-23T09:09:47'
);


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
    '04246b68-cba8-4799-8c33-7072de84dc7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-23T14:29:21'
);


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
    '932dfd16-cceb-47d1-9d8b-73f9a5af03be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-23T17:05:56'
);


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
    '91f66e05-4b8f-44f4-9416-d1438a05b6be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-23T18:05:17'
);


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
    '2070dd7d-6892-44e5-a96b-69426c757835',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-23T12:13:48'
);


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
    'efa1008d-ba2e-4160-bda3-2ccb9646a0aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-23T18:43:37'
);


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
    '8e3f9c9e-3bb7-4197-aaca-f327f3986418',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-23T14:38:03'
);


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
    '6fd61e15-6c51-4453-b252-078a4a9c1763',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-23T20:16:18'
);


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
    'ba494016-9918-4946-80ac-24f2752b9a68',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    28050,
    28050,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-23T10:24:34'
);


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
    '5a713b74-a954-44a3-b5d1-b8f6bc0f66c6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    32300,
    96900,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-23T08:29:58'
);


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
    'c9f00f80-862f-40a1-aad3-609d5adc34cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-23T19:40:26'
);


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
    'c541a01c-401e-484b-a7d6-004155f757d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-23T20:39:29'
);


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
    '2c8116b3-924e-461b-bb6a-c3e7cc1f40b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-23T16:05:25'
);


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
    'bee3a381-86e9-4732-9eec-b1172b3c1ff5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-22T16:40:07'
);


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
    '73f97064-7f03-46a5-b6d2-ec76f03a6f02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-22T19:52:41'
);


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
    '28873951-47df-42f2-baf9-4a80dbdcf816',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-22T10:38:09'
);


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
    '36ab0291-e0cb-41ac-a940-5694878021cb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    2,
    25000,
    50000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-22T20:36:48'
);


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
    'f6e6b822-c8a2-4c49-95e5-1b5ea745f417',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-22T15:04:30'
);


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
    '1830c9fd-4d72-424a-8d96-c7d8a1e603be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-22T13:32:04'
);


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
    'f010ffa6-6a06-4053-bbac-5dd3e25127ed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-22T21:18:04'
);


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
    '8f702a86-276e-4d25-9c51-19a18dafbf47',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-22T15:58:51'
);


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
    '19ba243d-6bad-4469-8bbc-d9a601e4694d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-22T10:03:28'
);


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
    '281a630b-ea71-484a-a999-7a933d3f380f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-22T18:11:02'
);


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
    '214738b2-4111-417b-a81c-fe33c4f6b728',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-22T17:10:23'
);


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
    'de0d1414-7ffd-4f1e-96cb-482e7400ecd7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-22T20:40:41'
);


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
    '4c6f35ed-3ac4-4956-927b-ab56ca6e1911',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-22T12:16:46'
);


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
    '5b5bca18-8cfa-4541-9ef7-48f5c5c7d9e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T12:41:44'
);


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
    '083c0860-b7fa-413e-b639-d0632b2a5422',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T16:24:41'
);


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
    '27bfd608-6702-44be-b585-360a397740e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-21T18:42:27'
);


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
    '790efe97-16ed-4dd2-9a06-05068ac5bf52',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    2,
    7200,
    14400,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T13:49:31'
);


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
    '2be8fdcb-9b8c-4522-a563-f4da45046763',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T12:54:50'
);


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
    '5f3c5910-9093-45d2-8c46-181ee53b6c40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-21T17:24:09'
);


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
    '91dd38ba-87bf-4e19-8d2e-556f74d9c8d2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-21T19:28:02'
);


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
    'cdf46d6b-5183-4288-8697-072756307fa1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T17:18:48'
);


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
    '3dccf71e-9d65-4ae4-8943-9439b8bbcfcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-21T21:12:23'
);


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
    'ecdce699-4e83-41cb-a240-8b00cdefed19',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-21T16:33:26'
);


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
    '5a12304b-7b6b-42dd-b9a6-09f6261789a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T08:41:30'
);


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
    '7392b22e-e050-4947-9209-375b1edbd1f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-21T15:57:32'
);


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
    '5519748e-f2fd-4dd6-9a32-b292f48f3379',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    26600,
    53200,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-21T08:26:03'
);


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
    '5d79b618-d7db-4b85-a068-f06d87e9c967',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-21T13:14:01'
);


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
    '202fa550-cc2e-4ea5-8053-081aa5906c03',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-21T10:02:18'
);


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
    'a11fbb17-576b-4840-a1cd-0dfc1224f7de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    'French Fries',
    2,
    22000,
    44000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-20T09:01:16'
);


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
    '5df55e4b-f3c3-4ca6-b47a-86ca87abd690',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-20T14:07:49'
);


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
    'dfd391d8-8d7f-4bf2-babe-9bdbce4fa368',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T14:40:50'
);


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
    '3750971a-1ab2-452e-a914-79a20f198861',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-20T16:01:40'
);


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
    'eeb0ce80-4965-4afb-be33-8bd821e51cae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    1,
    8000,
    8000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T08:39:22'
);


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
    '502493fc-3795-4205-a389-cb577ba0ffa2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-20T13:04:33'
);


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
    'a88f779b-4838-4ebc-87fd-0ec7ef1bb9b6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    3,
    22000,
    66000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-20T08:24:55'
);


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
    '89952e5e-f289-469a-9930-d48d0f08919d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T19:01:22'
);


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
    'f0346db0-c6e7-45f6-801d-07f371af5ada',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    3,
    25000,
    75000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-20T19:48:21'
);


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
    'a16dcb57-55fd-4cab-a493-1888910bf220',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T19:30:40'
);


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
    '9da13db0-2112-43b9-894d-002c08a874f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    13500,
    13500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T11:02:50'
);


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
    'd625fe4c-6793-4a29-83f2-7733bd01ad7f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-20T14:52:34'
);


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
    'dccf877c-1765-41da-93ff-d471af19c0a7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    25500,
    51000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T13:55:49'
);


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
    '99afcd5b-61bb-4f3f-82cb-f7aeaee85ac5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T14:47:28'
);


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
    '3d4cd865-fa4d-4fe7-80e6-4985d627d938',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    3,
    38000,
    114000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-20T13:59:51'
);


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
    '6c1e6008-9be4-4a15-bbeb-553f12fc2b87',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T14:38:52'
);


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
    '2f15143b-51d9-4495-bafd-39790300e38a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T13:42:18'
);


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
    'afc2a820-c3e4-495a-9d61-4729ac3b4f47',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T19:28:22'
);


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
    '01bc6dd7-63ff-4aa7-8b83-315da934dbdd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-20T14:17:40'
);


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
    '1933014d-f70e-4dec-9833-5a00827823c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T16:51:47'
);


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
    '0155bc90-467c-4ec3-a0a0-a42edb17f24c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-20T08:08:04'
);


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
    '4467bddd-c4e6-4643-9463-a0ae953228e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    38000,
    114000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-20T17:09:43'
);


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
    '54db31dc-583f-48cb-8a6b-93b15ab00e24',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-20T10:33:23'
);


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
    'bbf1a692-87e8-4711-894a-90afde7189d0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T08:47:11'
);


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
    'ee2f8089-19cf-4b8e-8a56-c2412613df77',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-20T20:16:45'
);


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
    '50455496-486f-4c08-9d09-ca14197e6f9a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-20T11:07:08'
);


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
    'bc9ade69-8891-4a17-9801-170210253f5c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    4,
    25000,
    100000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-20T20:43:54'
);


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
    'f53a01d7-ed28-4bc2-9650-c84319ea4484',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-20T12:57:19'
);


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
    '5b30cec5-394c-4496-81b3-49f25a60e649',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-20T09:12:50'
);


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
    '108c4fd1-7f58-47fb-98cf-3c811dc4cff2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-20T15:51:35'
);


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
    'c0c85a25-03dd-4c6a-909d-34c9a7f076bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-19T14:49:26'
);


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
    '1ddd46fc-310c-489b-bfe2-44e8dc488878',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-19T15:29:43'
);


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
    '0eb051cf-1481-461b-84e4-097b4470ad0c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    1,
    8000,
    8000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-19T10:49:08'
);


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
    'cebdf531-e741-48e7-91fa-e29b010d3956',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-19T12:10:10'
);


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
    'd37ca388-b3b9-4381-b80f-444c5acd8b1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-19T21:05:16'
);


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
    'b9b8e321-32aa-4a7d-8c55-b5a2a4ca5f34',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-19T16:05:32'
);


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
    'cd9bb7ed-d13a-457a-a0a2-a2950422bdae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-06-19T13:53:59'
);


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
    '4c9af416-10ce-4c24-bd5f-2e16946a67a3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    25000,
    25000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-19T08:41:49'
);


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
    'c92a3478-9565-4ac7-9007-9f079f744e7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-19T17:40:01'
);


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
    '82df45b6-433c-4d91-8055-8cb2fd150275',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-18T11:51:51'
);


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
    '0422157d-2b97-4335-b9bd-267495ad9a58',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-18T15:26:30'
);


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
    'e4b38694-9738-4204-8c14-de3e62525d40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-18T21:45:20'
);


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
    'ad7f40b4-cf4b-4244-89ac-4e99dc058ee5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-18T16:06:20'
);


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
    'a8be5a82-88ca-4252-99c9-ac1963af6598',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-18T10:06:03'
);


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
    '6b1bb124-4f21-4740-a444-30655e26f62e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-18T21:57:10'
);


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
    '0937d908-1b93-453d-a041-9aa32dea8267',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-18T16:29:31'
);


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
    'fe2f02fe-a881-402a-b3e7-90e8b81d7246',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    19800,
    39600,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-18T11:13:37'
);


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
    '326db6b7-0d9a-4fbc-b049-30226ab9459b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    29700,
    29700,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-18T12:34:00'
);


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
    '42d87926-6111-4d56-8994-71177651186d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-18T20:25:23'
);


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
    '6bd0a233-f991-49dc-b772-da2696cf3935',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    18700,
    37400,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-18T16:18:04'
);


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
    '7a52ce4f-5758-4276-b2a2-737f1c1ea3ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-18T18:39:07'
);


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
    '51a89527-ff4c-4d43-90ad-6981c140dee9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-18T13:48:09'
);


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
    'f1f8e7d9-ae4b-44f4-a7ad-cf2d6bd96d7b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-18T10:45:21'
);


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
    'b662a72f-9d00-4260-9997-f328649d4c90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-18T13:59:39'
);


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
    'e76557ad-3cdc-44d4-a438-0bbf3ba865b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-18T17:21:32'
);


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
    '6db657f3-25c3-41ce-8620-f61db576de87',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27aa88cc-c9c0-499b-8a3a-10d880a0c22e',
    'Mineral Water 36',
    1,
    8000,
    8000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-18T21:01:23'
);


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
    'd31773bb-ce7e-4235-be06-bd33588653f5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-18T20:57:46'
);


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
    'c605cfa6-35ee-4598-8b9f-befba8eb36cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-06-18T11:46:03'
);


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
    'dd1cbd4a-c833-4fd0-ae52-ae22565e4c77',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-18T10:52:43'
);


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
    '4cb57d7e-a288-42f2-a2e8-f83ed411240b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-17T14:09:26'
);


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
    '1b35d0dd-c6ba-415a-8bc5-de77dcb1e448',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-17T21:54:47'
);


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
    '83433d20-eba9-4d4d-834c-06146bbc5072',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    2,
    25000,
    50000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-17T18:30:33'
);


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
    '0594aec6-3d3c-41b4-8870-26fa710feaa4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-17T13:43:49'
);


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
    'd4ad93cf-3b07-4029-9e93-20ef97b6af2d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-17T16:19:14'
);


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
    '90c9f150-1d4d-4dc8-838b-7517f81aec57',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-17T15:22:35'
);


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
    '3403ef93-16bb-4236-a51b-03bceaa3d967',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-17T14:52:22'
);


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
    '019280d8-44f2-463b-a78d-8a6c4c3a3e41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    23800,
    47600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-17T15:41:16'
);


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
    'b839f66d-ec7c-4d5a-95ab-ee038558f89b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-17T16:44:17'
);


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
    '3bb8a05e-e3a1-470d-9ca9-a37249e450ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    25500,
    25500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-17T08:06:26'
);


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
    '30cca814-b369-4f05-b57b-f70c71151008',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T16:59:10'
);


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
    '0211da03-7da6-4569-b441-44d941d3d092',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T13:18:41'
);


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
    'baa31c2e-6b02-4cbf-b922-b29191fae7da',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-16T19:46:54'
);


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
    '55f69655-436f-47f3-a6eb-97b5a70290d5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T21:25:50'
);


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
    '0445b515-2a6d-4389-bb67-82cbe12879af',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-16T08:19:36'
);


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
    '1ba1c7e2-3143-4b72-b1d7-a980d1f502ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-16T15:56:08'
);


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
    'e0f69d71-6c3b-41ee-aa86-0f3076160f07',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T10:46:29'
);


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
    'e1baf3c1-be43-4480-93ba-9456390dd109',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    30600,
    30600,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-16T18:48:12'
);


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
    '81ed5b46-b235-46c7-84de-58ae08b8dc97',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-16T16:20:05'
);


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
    '312a9c39-7600-4ae4-a3f4-b33303ad3282',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T13:59:15'
);


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
    '5207196e-ee0c-4752-9c1a-04834d572763',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-16T13:19:37'
);


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
    '05bee169-198e-4fe0-9d51-74f224fdf7aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-16T08:42:07'
);


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
    'c24ca027-716d-41d3-98ae-cd29a121cbed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-16T19:07:40'
);


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
    '4395d4b4-d0bd-454c-9e67-f1b9fe0fb199',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-16T15:09:29'
);


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
    '6cca5f45-cc20-4981-92ac-3f94f6fa8afa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-15T16:28:33'
);


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
    '2cbafb3a-0209-4ca8-8942-7694c052e3a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    21250,
    21250,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-15T17:34:09'
);


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
    '6263b7c9-248d-430e-bbde-8d812ebd3973',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-15T18:13:45'
);


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
    'dd7f2d1f-1c00-492b-b9ff-54e8e813e537',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-15T15:08:32'
);


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
    '051ae7b2-f714-4c29-a452-a204ccf965ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    4,
    38000,
    152000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-15T18:51:19'
);


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
    'b3c43b11-666c-4ad2-9805-37e7d33752ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-15T17:04:02'
);


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
    '8ba830cc-2ed5-442a-abc7-147bb78d2337',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    1,
    25000,
    25000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-15T08:18:26'
);


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
    '3ae881ee-627f-48de-92f2-eda81d365fda',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-15T14:28:55'
);


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
    '5a21f806-a75e-4e23-9b5f-7730781a2ce6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-15T18:55:22'
);


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
    '074d8dde-18df-45b3-a72e-8fe079bbc6a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-15T10:46:14'
);


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
    'dbc83269-96db-4d51-a175-97fe277c2fcc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-15T14:34:24'
);


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
    '968f15ed-97cc-45c9-b9f9-ba602d64de4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    2,
    38000,
    76000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-15T11:59:56'
);


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
    '575b7173-0c3e-42bc-a1d1-d5d811cddbba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-15T20:59:56'
);


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
    'a670770b-1d5e-4b5b-8fab-cd22881ff66f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-15T08:28:38'
);


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
    'a808a703-684e-4626-9011-649a9900ac41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-15T11:34:13'
);


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
    '84737f8d-1eff-475e-a825-b07d2c4121b8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-15T21:58:46'
);


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
    'ad6a0826-bd5f-4cea-b640-f0248a807336',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-15T12:56:09'
);


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
    'caee1f7c-1273-499b-b9b8-4400bb1f7794',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    3,
    38000,
    114000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-14T19:58:11'
);


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
    '4e339b60-45f6-4b2c-8eb6-90b4e49700e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-14T13:44:26'
);


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
    '35aebbce-2a37-4109-b4a2-44c45b26c53c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    2,
    38000,
    76000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-14T15:15:54'
);


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
    '0a5b27b2-b2be-4d97-951f-e26356dda15e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-14T08:35:26'
);


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
    '8c557901-7487-4e32-8549-d2dda0d12ec8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    2,
    38000,
    76000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-14T13:41:05'
);


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
    '493f0bda-001c-4ad0-89f7-ba0b15f132d7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    6800,
    13600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-14T12:24:43'
);


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
    '7d4ca2eb-53c2-46f8-b0ea-79bd3b6b766e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-14T11:30:13'
);


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
    '562b87c0-c0c9-4843-95a8-62b75dd5563f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-14T11:47:07'
);


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
    '1b742c20-4f7d-4125-a301-2f287b4fbbdb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-14T11:35:20'
);


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
    'f5ccddd9-d4cb-46aa-8522-10b8a4c8ef07',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-14T12:23:32'
);


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
    'f9d96dc8-5e21-4cbb-b105-9c1faf417bc9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    25500,
    51000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-14T11:23:20'
);


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
    '62f881b3-511f-4e0d-8e1b-6c2337ac7c75',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    1,
    38000,
    38000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-14T08:16:35'
);


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
    '2792154d-dc51-434a-a214-943df1720216',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-14T21:15:31'
);


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
    '172ab0a1-0553-46ba-8ab0-1908a6292cc0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-14T20:52:31'
);


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
    'ed92319e-6f0b-4a17-bcc5-e2d73ec36554',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-14T10:46:34'
);


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
    'd982c695-30a0-41c5-abd9-778cac041d8d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-14T16:02:53'
);


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
    '2bf78f57-c92a-4177-aeaa-5fc90d02dd3c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    1,
    25000,
    25000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-14T21:40:14'
);


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
    'd9692abd-32c2-4153-b8aa-5f8150e8bb67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    2,
    21250,
    42500,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-14T08:39:40'
);


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
    'd011810e-788b-43ee-9760-db6b5dff554c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    25500,
    51000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-14T08:01:33'
);


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
    'e22d7dbc-c251-4ece-8a1a-e1d77377990b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    25500,
    51000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-13T09:58:06'
);


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
    '69a98511-0915-4396-9a61-5a04d306aecd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-13T12:52:22'
);


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
    '0ed173b7-2497-43ed-90ca-ab72a171e4d7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    28800,
    57600,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-13T11:44:14'
);


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
    '9eee7722-b986-4f96-b59b-b5bb31f0e501',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-13T09:25:24'
);


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
    'b0533002-a52a-428e-bca7-407df2e53092',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-13T21:27:41'
);


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
    '1195a4c5-34eb-41c8-a639-abdba91d282c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-13T11:57:55'
);


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
    '352b05c4-c2bc-437c-a737-d0665d7c29f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-13T16:36:42'
);


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
    'db91a9ae-486d-40d0-90b6-b206a1f9cd33',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-13T11:37:09'
);


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
    '10da2f77-51d9-40d3-b76d-e6002fbfc969',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-13T17:53:54'
);


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
    '2ed5ed58-8a22-4693-8a3f-38eb53c39df1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-13T20:47:08'
);


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
    'e0a032d3-1970-4884-92bc-d84919f4cb8f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-13T09:27:14'
);


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
    '8bdc3ee4-a208-4a2b-b623-fe7eb588c5d4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    3,
    25000,
    75000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-06-13T14:49:20'
);


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
    '5d303fb5-92d1-422b-9c83-2b1084ca4ccb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-13T11:22:35'
);


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
    '5f94fbd4-f939-4240-945c-c0e9c5471a73',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    28050,
    56100,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-13T19:04:05'
);


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
    '8793a9cb-026b-4f86-914d-ec63e50dbcef',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-13T13:23:06'
);


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
    'c89dd26a-cfdc-45c9-a129-5abae320c13d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-13T20:17:06'
);


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
    '886b1a39-57a5-4d4a-b33c-2ee515292fe0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    33000,
    66000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-13T14:06:01'
);


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
    '2dddf89b-d8b5-4653-b903-9250eedb6372',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-12T08:18:26'
);


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
    '58c1980c-05e2-4f65-8807-28e00d18f1a3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-12T17:33:10'
);


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
    '1a26754e-00e7-41dd-8431-e086866fdb41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-12T15:09:04'
);


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
    'bdbb36ff-10bc-434e-a046-4f2c261fcaeb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-12T20:04:23'
);


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
    '3ac8bcd1-de91-4348-9321-f550604c1cc7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-12T17:12:29'
);


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
    '26ad0966-84ae-4c6d-8db4-ec1830c4f788',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-12T21:39:24'
);


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
    'ffa49d59-8ba4-4d5c-8cf8-dd81795656f2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-12T12:20:38'
);


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
    '38cb1161-4683-498b-925e-ce1137a9666e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-11T12:47:44'
);


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
    '61245838-222b-4192-945e-31148cca2f3f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-11T12:52:50'
);


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
    'b790275a-3d8b-42f4-a6c8-ba63cb910e5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-11T17:34:11'
);


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
    'f871addf-5362-44a4-b9c7-38d89150a014',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-11T15:51:18'
);


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
    '7e301b62-4c4a-4a46-800d-0827908b64f2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    4,
    25000,
    100000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-11T11:16:42'
);


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
    'ec9c387a-b2e3-4e00-b45b-e39bba03c5fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-11T17:30:37'
);


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
    '21dc25e1-18f5-4aea-979c-46acd937ae94',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-11T17:40:58'
);


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
    '3ef20e9b-3b92-4bc0-b0bc-ca7b1230f5fd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-11T18:39:02'
);


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
    '095a5271-d7fd-43f6-af9a-ec40c49dfdeb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-11T09:00:06'
);


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
    '1d910832-078e-4116-8e83-353593009f44',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-11T17:44:36'
);


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
    '349a1de1-b23f-42dc-aecc-1cd05c8279b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-11T19:32:09'
);


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
    '2cc7f9aa-1ce4-4115-ae15-4f6f833cd4c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-10T09:53:46'
);


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
    '3d35934c-2994-4527-837a-1e5e00f536d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-10T16:30:22'
);


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
    'd84891ed-1a03-428d-953a-36cedf19a2a9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-10T09:19:02'
);


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
    '12221346-84dc-4b05-85e4-b2cea2ffc64e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-10T19:15:33'
);


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
    'f3260415-5327-4359-a6d4-854110374e4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-10T15:14:51'
);


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
    '683d60b5-ef40-460a-8e91-8ebf79a3ef47',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-10T08:47:39'
);


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
    'f1cc7f06-d790-4442-8148-d213e40d19f5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-10T19:13:13'
);


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
    '0a6ea08f-a568-4ab6-b1fe-f63d4877e7c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-10T13:20:12'
);


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
    '2612da20-5984-4996-9dbd-37144a14f8c2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-10T18:20:38'
);


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
    '18677b89-70fc-4250-9004-6fc7040f2431',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-10T13:54:29'
);


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
    'b5ebb427-2f5a-46bf-895b-7852356fe256',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-10T17:05:43'
);


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
    'f32a0a59-7c24-42a6-922a-f767a9dd3aea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-10T19:09:32'
);


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
    '4b3e723e-38c7-4ef5-a6c9-3ec08cd21e00',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-10T14:11:31'
);


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
    '46e8c7ae-9ea2-4e13-89dd-e63cb64ae239',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-10T10:11:20'
);


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
    '5726ad82-6847-46e1-a96d-cbac7792d7b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-10T10:12:52'
);


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
    '578d0036-87d6-4586-a555-ff9a5afbb443',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-09T19:53:28'
);


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
    '2c49534b-39a5-406a-ba13-e6c15b61068b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    20900,
    20900,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-09T08:17:14'
);


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
    'bff8fe98-cff3-4885-9a0e-1ea84dd9ade9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-09T19:49:49'
);


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
    'a308c853-1488-4283-b32d-f0789c5d1663',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-09T12:49:34'
);


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
    'afab9381-e604-4d8a-8202-c54f1382c4cd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-09T12:55:02'
);


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
    '0c0c6ff1-567e-4890-90a5-f2c25e40e739',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-09T21:07:49'
);


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
    '2ba3de1b-70cb-4317-ae44-f0a3d3f14be1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    2,
    38000,
    76000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-09T21:45:39'
);


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
    '71fe2508-6707-477b-905c-b537f552c0ef',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-09T17:34:10'
);


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
    '7528baec-0625-46f6-9b61-5a90d7c3f3d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-09T18:52:06'
);


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
    '1d5f9032-2a70-4540-adbd-277a6ba8078d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-09T11:09:45'
);


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
    'ff3997e6-fe3f-470c-9006-834681f483cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-09T10:36:40'
);


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
    '818ad723-f32d-41eb-a25a-64f7d0909022',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-09T14:32:47'
);


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
    '796c844b-ac51-4a40-b8d4-d11d8df197aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-09T17:00:55'
);


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
    '54264c70-bf5c-4c2b-b63a-ac8a0d06a591',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-08T11:27:52'
);


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
    '8adb1a55-b3da-4d7a-bc0b-b97a13399cde',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-08T16:36:08'
);


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
    '994c8b93-87a4-41e6-991b-abb43a86e05d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-08T09:40:50'
);


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
    '69e2dd54-6643-42c3-a83f-8d2df7013b2b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-08T15:00:27'
);


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
    '6f92afe2-e9a7-48f1-b2dc-a69ddd7f4c28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-08T21:59:56'
);


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
    '3ddb8363-5232-4db7-994c-1801cd2266ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-08T13:42:57'
);


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
    '6e50af6b-f09f-45d4-80ff-ef414cb0a1b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-08T14:41:05'
);


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
    '3c10358a-60a3-4775-a5f8-a463490a9eb4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-07T11:33:43'
);


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
    '6e8255e5-46df-4419-95e2-6daf322db0d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    28800,
    28800,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T19:08:30'
);


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
    '3cef2e97-1bcd-4daf-b502-c71adca706b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Croissant',
    2,
    25000,
    50000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T13:23:56'
);


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
    '900aad82-6887-4ee1-85a9-1721353ea871',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T09:33:36'
);


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
    '67e3e8a5-24df-4c66-abdf-a9ce9a2f0bd0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T14:39:43'
);


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
    'd3c50617-3762-4d05-bacb-533077414cc3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    30400,
    30400,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T17:46:24'
);


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
    '89dcfb64-bc7d-429f-bfc6-e93d12735fd8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T12:41:05'
);


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
    '174b0e83-437d-42d5-bd54-f0121523855f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T11:33:38'
);


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
    'fa8ae8ec-a912-4605-9f84-aabb76b75d1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T14:07:15'
);


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
    'ad1be1cf-700a-4dcf-88eb-e213d3735340',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T13:08:24'
);


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
    'fd4a1fc1-4b64-4697-885e-87e29dd3153f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-07T20:04:01'
);


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
    '9185d6c5-ef2a-401b-aab7-36d0bc47fdb4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    32300,
    32300,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-07T12:40:45'
);


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
    'cfea68c3-7589-4ad2-9808-34f5f9a79abe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-06T12:05:19'
);


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
    '2c31d275-adbb-4bdf-a4c8-ea11565c151f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-06T13:25:37'
);


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
    'edb1785a-8b80-4354-8361-b13d7dd971c4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    30400,
    30400,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T15:39:38'
);


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
    'd17ead58-7f41-4b77-bac7-74d17795cea1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T08:45:08'
);


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
    '1ac02cdc-92fb-4d30-b9ca-d3c0f0af12ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-06T16:50:52'
);


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
    'aaf6d98e-f062-4182-a7cf-9903fd2e306b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T20:57:01'
);


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
    'a61ff60a-a634-49f5-9f8b-9eb6323a58a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T19:36:40'
);


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
    'b295b82f-ccec-40be-ad16-34b59750625a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T15:54:36'
);


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
    'e2555b6b-8647-411d-a8c3-5e3ab6234c55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-06T18:46:07'
);


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
    '35f57ca3-3c37-4213-a6c6-23773bcd1d95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    20900,
    20900,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T15:23:24'
);


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
    '553ab703-4637-43dd-b017-e7f58268a490',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-06T20:58:45'
);


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
    'bbe8d299-c7ba-45df-affb-3880d7fdac95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T21:04:36'
);


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
    'ee87e4b0-a4d4-4e37-98f1-111d64bb8e25',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-06T14:04:56'
);


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
    '57e6deba-1b4e-4ab4-bc72-98d43ed98848',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T09:35:29'
);


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
    'b872319e-c2ca-46fb-902d-6268130c0f84',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-06T19:39:15'
);


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
    'd1029bb9-2852-4a6f-9450-880393a102e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-06T19:57:34'
);


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
    'c405abf0-2a8d-495a-8977-b6ac49fc877e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    27000,
    27000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T16:22:40'
);


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
    'c8453ed6-4892-434e-a602-374314f25308',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    25500,
    51000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T09:13:33'
);


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
    '13aac73f-9dec-4187-9f96-14c0084e2872',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T19:17:05'
);


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
    'f4db26cc-a2e2-4472-b548-455c56d3c6fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-06T19:57:23'
);


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
    'fb3f19f8-c462-4e43-a8f0-d0e2af4f29fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-06T18:52:25'
);


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
    '33e98995-2b4b-49fe-8100-51026ecac787',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-06T20:25:44'
);


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
    '8e0fa939-21ee-4958-a9e6-e104194d0364',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-06T11:08:49'
);


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
    '439e3400-c31a-4579-92f5-087ebee05c67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-05T14:07:34'
);


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
    'd7d2defd-bf81-48dc-b3dc-3a79e47ad8d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-05T21:07:05'
);


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
    '67c30c72-ccc3-492d-ba99-882c8abe8a81',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-05T11:53:54'
);


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
    'afe51035-9c25-48c7-a1c7-5ec94d1498e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    31350,
    31350,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-05T16:03:43'
);


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
    'e1295f65-f3f4-4a36-ba03-4dbf4a3f0d5a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-05T14:54:28'
);


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
    '00ebc4b5-2f35-4d2a-bf5f-e999b9eb4106',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    2,
    23750,
    47500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-05T08:03:53'
);


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
    '3642a978-2dfe-4739-bdd1-a8e4900dbdc3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-05T18:40:41'
);


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
    '0653bc99-6137-4bf8-8133-266535f02262',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-05T09:12:57'
);


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
    '31e737a8-9836-4931-909b-7297d4d28fde',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-04T08:29:03'
);


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
    '9ecfab7c-f079-4d16-8ce4-0e1ee743c09d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-04T08:24:43'
);


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
    'bcb0c2a2-f1ab-4118-bf77-3b524ba481db',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-04T15:56:09'
);


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
    '7c32a28f-e808-414e-8c94-94e410886376',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-04T16:30:03'
);


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
    'f52da18a-b250-4bfa-a733-28b3c1af0d28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-04T18:56:51'
);


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
    '773c2618-e2e4-47b0-b396-5f9152a92b4e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-04T14:50:45'
);


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
    '19834b06-82ff-4444-a3eb-688f2288196c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-04T17:32:20'
);


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
    'dd313c04-ffc3-48b0-ad52-34f58928e600',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-04T11:01:57'
);


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
    'c91405ea-e9bb-4eb8-94b8-85904e8e8c27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-06-04T13:49:37'
);


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
    'a9357862-6ba3-4d6b-a151-dea173c5e39d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    2,
    38000,
    76000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-04T16:52:50'
);


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
    'd73183bc-3ddb-4855-b2cc-66804e003ee0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-04T21:54:11'
);


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
    'ddba095f-352b-462a-a548-aa2664275c50',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    15000,
    15000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-06-04T08:45:44'
);


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
    '1759cffd-0aa9-45e0-9904-43cb060ae699',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-04T16:19:11'
);


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
    'd07504a4-31d4-4f72-b4ee-2c9b1200e92d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    20900,
    20900,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-04T08:33:30'
);


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
    '60e66e3f-a947-4b1c-b1a6-250294bd1827',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-04T13:45:11'
);


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
    '52a5bc42-dc0e-48c7-92be-df6de6f570d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    28900,
    28900,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-04T21:33:55'
);


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
    '1e654fc8-43df-4980-a018-bfe8af6728a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-03T20:40:31'
);


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
    'b6e35ebb-6316-4142-9852-c286b0cde9ad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-03T20:22:14'
);


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
    '6ad2b157-e86c-476f-b8a1-d17690c79109',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-03T10:46:00'
);


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
    '260153fa-bc3f-406c-b420-2a6c83fc4cdb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-03T10:38:20'
);


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
    '99c9fb60-66db-4e6d-bbe0-346e851cf298',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-03T19:04:15'
);


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
    'eef13049-b1a5-433b-93eb-443e3cf570bf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-03T15:00:16'
);


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
    '8cfac855-abfe-46b1-b352-2b97ffe95efb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-03T20:06:46'
);


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
    '0556c06d-00f9-4f1e-ace4-f23e99d18262',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-03T14:31:56'
);


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
    '993d77e1-c7a8-4cc9-bc7c-fed2b5643664',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-06-02T18:48:43'
);


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
    '01c55ea4-f82b-4435-aee2-565b46c0dcc7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T08:20:16'
);


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
    'aa86cb7a-15a9-4361-b69f-20e1e71f1d06',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-02T19:04:35'
);


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
    'b0e7b85d-a21f-43aa-8086-4b502d585068',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-06-02T19:01:27'
);


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
    '61b427d6-1960-4205-b8c8-cf1d5e8ec8b8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T11:12:26'
);


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
    '84ebe497-e8d9-4f89-8b4d-19204faa4ac2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-02T09:03:25'
);


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
    '765f8743-da0e-445c-b2db-9ed2632afb24',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-02T14:05:18'
);


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
    'ef40483f-b76f-443b-9448-857813bfdccc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    28500,
    28500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T09:30:54'
);


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
    '11dd6dba-b292-4ed0-8b1e-546718937fae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-02T18:16:05'
);


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
    '3ddde944-119d-4484-853d-f1ca9bc5ca37',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-02T10:28:02'
);


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
    'c99c1d92-98ff-4150-82ae-82055839d2fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T17:03:09'
);


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
    '242f5160-7983-4f66-8951-9cb41f7135d9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-02T20:37:14'
);


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
    '916c7cf5-ca4c-4d05-b4a1-bd67d462c696',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    25000,
    25000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-02T16:43:55'
);


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
    'cc05b9a5-7846-4917-ba65-4038463a63d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T21:45:02'
);


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
    'd49bc1a0-f282-41a8-b9d6-fdded92d93b5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-02T10:13:51'
);


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
    '70aed5b1-5e2a-4c52-8620-dd75fe2c33d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    31350,
    31350,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-02T21:40:09'
);


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
    '80cf64d9-8bba-4582-b413-70666af57fe6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-02T14:35:25'
);


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
    '1881a6f4-f234-44c7-bd31-567ed51021d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-06-01T17:33:50'
);


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
    '01d093e7-f88a-4c22-98b1-a5f878677815',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    2,
    38000,
    76000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-06-01T20:06:59'
);


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
    'e2d8bffa-06c2-49d1-b2aa-bd8dc854327a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-01T14:16:24'
);


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
    '1a32882e-17dc-482c-bc17-91679db938fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    27000,
    54000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-01T17:38:43'
);


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
    '44e143d4-67f8-413e-8f8e-20d90d873bd4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-01T08:47:30'
);


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
    'dd3b2e1a-7b81-434f-ab3b-a26193169e75',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    28800,
    57600,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-01T21:31:54'
);


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
    '1a47dddb-62cc-47d6-ae73-d4832f4830fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-06-01T12:46:26'
);


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
    '85ccf61e-b731-4017-8c48-6ea3471207bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-06-01T20:33:55'
);


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
    'bd6c0efa-8ba1-495f-8cb6-4942d5e703a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-06-01T11:02:29'
);


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
    '2ff7a2c0-b62c-412a-8627-6d3a4f518ae5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-31T18:59:07'
);


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
    'abdcde73-81b1-4133-b90d-44def7654381',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-31T10:55:30'
);


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
    '15dbaf7e-6c3f-48a1-9139-8c2018048f92',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-31T12:01:24'
);


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
    'c23005ea-0b83-44f6-afad-ee978a1a754f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-31T18:14:43'
);


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
    '92d5e3ed-a360-4619-bf57-71f5e3c2845f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-31T21:49:49'
);


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
    '5b3b4966-cca6-43b6-b21c-6e49ffb570d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-31T20:00:14'
);


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
    'ee7099d1-0a74-445a-a22b-2293a5ae675b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-31T14:54:22'
);


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
    'c5ded717-d95d-4eea-9b55-bad35c4c0f13',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-31T21:39:25'
);


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
    '2297ae96-6b1c-4f68-8da0-5c1d429bdde1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-31T18:38:38'
);


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
    '73d88c9d-787c-44aa-ad56-c1d2486caf93',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-30T12:40:20'
);


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
    '984dd01b-af8f-4181-b760-de14a781cbcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-30T10:33:48'
);


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
    'e6c63599-8dd5-469b-b729-0746cee7e39c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-30T18:20:43'
);


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
    '0b3ebbef-dff5-45bc-8432-93643e4ea9c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-30T14:24:47'
);


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
    'f8df5f60-73e3-40f3-9567-8569d759db82',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-30T18:50:30'
);


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
    '11624239-2a71-4caa-b5a4-ed3eef2aee36',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-30T12:06:30'
);


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
    'cc824a8c-8f79-49ee-bb0e-d18ea327f7bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-30T18:57:21'
);


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
    '3c473933-1a29-4783-854a-846f50d78c3e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-30T20:56:21'
);


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
    'ad0ccc9e-85c8-4d4c-bbb3-f6911fcc2a90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-30T21:40:37'
);


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
    'edacae31-3e13-4455-a953-39682e48e491',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-30T12:26:03'
);


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
    'dd2dfbbd-1b1c-4980-a988-e758aec2c9d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-30T17:57:58'
);


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
    '9e62f07d-5a67-4e0a-8e61-38c5456eb9f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-30T15:21:40'
);


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
    '5fe562dd-0273-48e5-a5ce-76f9d4ee9a98',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-30T12:13:48'
);


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
    '8f28f344-bb3a-4c64-867a-73c4dbe04461',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-30T17:27:40'
);


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
    'b18f75a7-a2a6-4f7c-a6c1-9aeb573d8451',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    1,
    36100,
    36100,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-30T13:48:53'
);


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
    'cb08d410-02ac-474c-8942-889a08e2cec5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    28500,
    28500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-30T19:56:22'
);


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
    '6c8ea52e-0cba-4725-9b3e-23d5678d9642',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-30T12:10:04'
);


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
    '30c57548-b800-4d8a-9265-10589f605c20',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-29T16:21:27'
);


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
    'eed72f91-d131-4758-ad61-056fb6f145b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-29T08:14:14'
);


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
    'b77b41b9-98e8-4063-b4e9-1c2caf83fcd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-29T18:16:49'
);


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
    '2874f8cf-237e-4c53-b492-c6b5cd4168c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-29T18:53:01'
);


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
    '9fd90397-019e-4a9e-bd0c-df449120302c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-28T12:30:44'
);


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
    'a0c44563-cb11-42c5-949a-a065901262d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-28T14:42:06'
);


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
    'ad663d32-d025-4b3f-bc1d-ebbdea69e2c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-28T11:38:12'
);


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
    'da0b9ec2-0f2c-43d2-a23a-1a278e3da405',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-28T10:02:35'
);


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
    'bfc2feda-3fa7-46f6-a830-7060923d4a61',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T18:05:58'
);


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
    '45c05359-0db1-49ed-8301-ea123a76ed73',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-27T09:46:46'
);


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
    'a79613af-d04d-42b7-9bee-19e685ec3e18',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-27T12:29:03'
);


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
    '7037be6f-0f3d-402b-819f-a487ecdcc3ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-27T20:43:20'
);


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
    '12149641-cd85-4016-8fc5-db1db9e15a6a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    17100,
    17100,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T13:57:28'
);


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
    '7a08908d-bfa3-4d5f-bc4d-08cb39524afe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-27T09:25:25'
);


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
    'c649f9f9-1be0-44bb-a0b1-95c28db93abd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-27T18:56:51'
);


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
    '1d02cd4c-176a-486d-b15a-3dd577ca9e15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T09:26:58'
);


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
    'a8c07366-8668-4c3b-91d2-1d0c65090673',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-27T17:01:55'
);


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
    'b7f77b57-376f-49d9-a816-0c0415a9a35e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T15:02:04'
);


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
    'bdbea5f1-d034-4ef4-a905-a0e79be47c94',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    28900,
    57800,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-27T19:36:14'
);


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
    '32ce0998-7948-431e-97ec-6b1d73f64f87',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T13:42:43'
);


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
    'd9f02e6e-283b-4639-97e8-583f954b885a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-27T08:00:41'
);


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
    '29f12f42-3ab3-4879-b543-3296668b592c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T20:31:20'
);


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
    'e648c059-ddde-40b5-b351-266db1de281c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-27T11:35:41'
);


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
    'ee2ce013-14c9-4aeb-9e09-e03cccc8be26',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-27T15:51:36'
);


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
    '22592b59-0bfa-4b52-90df-e00014ccb840',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-27T09:31:47'
);


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
    'fd9ed6f2-0016-4f2e-abb8-cc276d88ee68',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-27T16:00:52'
);


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
    '50a32cd3-077f-4498-ac99-6419756ea4b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-27T18:42:29'
);


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
    '07d864f3-aa65-45c7-bf6b-72174e9514ab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-05-26T15:45:42'
);


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
    'dcd8494f-7669-48dc-9faf-9d8bcbd64721',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T13:22:53'
);


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
    '49caaf96-cca7-4cc1-b5e8-35d4b1b2bb19',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T15:08:52'
);


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
    '4ccb882f-5721-44d2-81e3-0e2ae8b31379',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    1,
    38000,
    38000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T09:59:54'
);


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
    '340d2a7b-b205-4650-b1d4-eaa70a68d8ad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T09:48:26'
);


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
    '32eaf23b-8a92-4f70-9e28-cb18b4cd9a9a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-26T18:37:32'
);


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
    '9ddb6d72-2586-4743-b982-5f0ab55c9596',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-26T15:59:32'
);


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
    '453195a9-c563-4b43-956a-2bbb643694bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T14:42:38'
);


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
    '85c08bdf-cfa0-4f16-83e7-01dea94ddb54',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-26T12:25:21'
);


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
    '9d385f84-d1b1-4d20-8b06-f727e2f3abde',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-26T17:44:56'
);


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
    '4390b071-6560-41a7-b036-51fc6552050d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-26T11:13:39'
);


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
    '15b1fd7d-07f0-4ae3-94de-42a6817bf470',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-25T16:44:40'
);


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
    '3ac03c41-d424-4763-a611-884aa2111ff1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-25T17:36:42'
);


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
    '81d2bab2-d289-4017-8e0b-2095a9beeca6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-25T12:48:50'
);


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
    '6f051b2a-2192-4266-9f99-5b9d23970d9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-25T19:50:18'
);


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
    '858b14c7-6101-448e-b7a0-150d104ec8f3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-25T17:55:43'
);


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
    '8482bbbb-0e69-4470-be5c-a90959df2744',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    2,
    25000,
    50000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-25T11:32:50'
);


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
    '96e32d30-0823-4a9b-9485-0f7eb02139e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-25T20:43:20'
);


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
    '9675fff0-5e21-416d-862f-49c717fb156e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    19800,
    19800,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-25T21:49:55'
);


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
    '8d3c2706-a005-449e-9cf7-2c2d78bf9ef2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-25T16:47:38'
);


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
    '27a4729a-98f9-4f74-bec7-f6c190561d88',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-25T10:11:47'
);


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
    'c85653ba-5d0a-4bd9-b951-9646c1391c25',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'Americano',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T10:37:54'
);


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
    '1796bd46-f133-402d-907b-37e53ddef12f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T10:59:20'
);


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
    'e06a6dde-c0c6-44f9-a442-0192689475dc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T16:14:11'
);


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
    '813dcb38-72be-4810-ab3b-738b0eb4e87e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-24T09:22:14'
);


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
    '0f76b634-4b65-417c-acae-60da0e91c4de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T20:39:33'
);


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
    '9e698bcb-d87b-4af8-8f6f-1d520be3da1e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T11:57:41'
);


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
    '49d52899-27e9-4c3e-af15-9b3c7a0ab538',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T20:07:24'
);


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
    'bb93e343-4019-41f7-8198-872669b2eada',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    28900,
    57800,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-24T20:32:28'
);


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
    'd3ae3d76-4b3d-47be-a93f-54c3c1ea587a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T16:05:06'
);


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
    '8f4b15a8-bdd6-414e-a2dd-eee7f2a7c3cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T21:43:27'
);


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
    '3ec1c137-fca9-41df-aa01-ba04e5f2b116',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T19:43:09'
);


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
    '8aace23f-040c-4ca8-98dd-49f81429d7c4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T09:03:11'
);


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
    'be8e4383-4682-4a64-afc1-24d287717187',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T14:24:28'
);


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
    '1b9de7b4-dc80-4585-a557-46554aed3d2a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T16:00:41'
);


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
    '5e86004d-13cb-4112-88cc-72b1a1fe9cca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-24T09:18:48'
);


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
    'fbb3af42-d51a-46c2-bc5d-269ed5a38f58',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T10:34:14'
);


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
    'e7b9662d-81bb-4f1a-bafa-a94abce4b385',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-24T18:56:58'
);


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
    'c388e270-658b-4143-9afa-8a57266eaa71',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    2,
    25000,
    50000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-24T17:25:34'
);


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
    'eb203abe-ac6c-482e-9018-017d53b2ba7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T14:57:41'
);


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
    '3e0c43c9-5296-4747-918a-1fe91ea2f30f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-24T09:11:42'
);


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
    '9bb2cf2c-a5e0-4391-b2bb-5365e9ce9a09',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    1,
    25000,
    25000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-24T18:35:04'
);


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
    'b9e8a24a-d67e-4827-98c0-eb38e74dd497',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-24T15:21:22'
);


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
    '30896aa3-77c9-46ac-919a-3b7d966bf6c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-24T11:20:31'
);


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
    '512d8b06-9d11-4b75-82a4-7da023d0127e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-23T17:23:51'
);


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
    'e413b88f-bbc7-4b88-b57e-05a9eee17740',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-23T20:14:45'
);


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
    '7035e308-ff2b-46eb-98c8-2e493630c981',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T15:29:28'
);


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
    '142731e8-bbae-4c5b-bb78-e196dc7a082a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T18:38:05'
);


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
    'a6f46173-c3ee-49ab-8abf-583ad22dc7d4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T19:56:40'
);


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
    '2c859ca3-5e8d-4f41-9219-b95481d26fb1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    14250,
    42750,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-23T21:37:37'
);


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
    '5e02249a-6efe-44ef-80dc-75431be8c833',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-23T16:57:34'
);


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
    '92f66a04-77f3-498e-b316-79a490a67770',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-23T19:54:18'
);


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
    '79e2dd36-1498-4e92-adc8-2e266f1e0e1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-23T18:15:54'
);


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
    '9283ab7a-12ad-478c-ba6c-40f9eb1d2c90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-23T17:42:55'
);


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
    '44bdf0e5-5751-4306-bb39-48af1b2d14da',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T20:31:14'
);


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
    '10e337f4-b95c-4327-9000-48a3e31b3605',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T18:20:06'
);


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
    '36de1abd-2add-48f2-ad88-239499c2a4e8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-23T17:41:57'
);


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
    '7cc68fbd-238c-478d-96dd-2a11a345e132',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-23T14:22:52'
);


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
    '083afbc6-95c6-4b86-81dd-8de9aa059e98',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-23T16:56:08'
);


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
    'b9081b61-d7fa-4566-9e1f-fec6889733c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-23T11:09:11'
);


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
    '48132f94-1822-45b7-93fc-674fb357dbc2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T14:51:21'
);


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
    'c9cd17b8-217a-45e2-ada0-f4f845c4b0e8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-23T17:10:41'
);


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
    '3086adde-d202-4030-baac-d7d0262829d7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    1,
    38000,
    38000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-23T17:10:08'
);


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
    'f0e653a1-6b14-40c7-a42c-1ae6ea811fa0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    25200,
    25200,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-23T14:38:36'
);


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
    'a08e3b60-ccef-4c79-a6d4-b86f07fdd729',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-23T17:30:55'
);


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
    '2c88f73f-b5ee-411d-95d2-ae65ee7a458c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-23T10:50:37'
);


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
    '40a90c4e-0fcd-4d5e-aeed-88627c80af60',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-23T19:43:21'
);


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
    '19deb01d-b684-488c-b205-377b8f8291a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-22T16:55:58'
);


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
    '79d09dfb-9800-4b26-80d7-5d7b4107eb94',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-22T10:30:57'
);


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
    'a158d962-c04d-4537-90c5-2a6b73024d5e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-22T21:00:57'
);


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
    'b96f2478-d415-40e5-80b4-9ce4f4f1f275',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-22T13:37:51'
);


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
    'fa4310ae-2a76-41e8-ada8-b2c4b247d6de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-22T20:14:58'
);


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
    'c9e1003f-19ad-4dee-a639-ffd80b9b670f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-22T12:12:00'
);


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
    '5b07dc95-7f0d-4cd1-8b44-efcb655491a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-22T19:51:20'
);


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
    'eea33296-c8aa-4a89-9823-e6b9276bad8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    3,
    38000,
    114000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-22T12:16:54'
);


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
    '01650e58-669b-4bca-8903-eb61f2a97ef7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-22T18:25:48'
);


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
    '3e62580d-bb4e-440e-998d-24b02009da66',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-22T10:23:35'
);


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
    'ed29bfb9-a23c-4abc-82e4-ff4331111dad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-22T13:49:45'
);


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
    'b1dfd0a7-e960-4d49-9d08-23b31e7414e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-22T15:50:44'
);


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
    '6e3fd595-52c2-4d92-a15c-f9bbba5180a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-22T20:35:39'
);


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
    'b6a04a19-27ad-43b8-8a55-3604bfcffb63',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    20900,
    62700,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-22T17:27:05'
);


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
    'adad9654-035b-47bb-ac72-291d016124e4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-21T19:24:59'
);


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
    '5542be77-d039-4b48-9228-e001135cf302',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-21T20:52:11'
);


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
    '4acb5816-5881-4455-861c-a76592ed0e0f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    18700,
    37400,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-21T11:02:50'
);


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
    'dd1263be-f255-4a6b-b99a-837e1ad0242b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-21T09:17:49'
);


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
    'bf0eb536-367a-49b8-8f4f-d1084b779251',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-21T11:33:00'
);


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
    '795d38de-e925-4f13-82b4-043bb7d5e554',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-20T17:12:29'
);


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
    '93bf8463-1355-4cf9-a03f-1539435c818d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-20T09:35:04'
);


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
    '8fbabcab-99d1-4ef8-8078-00a5671fd571',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-20T12:56:34'
);


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
    'bbd19d53-e3a4-4791-8a42-2e086f3bd36c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-20T15:49:15'
);


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
    'e1c622fc-41d2-4d21-92e4-497f8a8eedff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-20T15:07:16'
);


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
    '89a9ba7d-5aa4-49b5-8a1d-cb4affc5bdab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-20T16:34:00'
);


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
    '6d5bae3a-3308-40b3-9d0e-35aada8bfca2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-20T09:35:59'
);


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
    '333e1f78-6386-46ef-a685-eff4f5b231d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-20T12:11:47'
);


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
    'b9f69b8c-1401-44a4-b357-b39c9df01bdd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-20T21:16:13'
);


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
    '6355d38b-af1c-4e34-8a3c-86248bcde380',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-20T10:49:06'
);


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
    '795b0563-aeee-4da4-b3f6-e264d0aa34ca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-20T08:48:54'
);


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
    '3c895355-9bad-4781-8cbb-d45a0fd0d5c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-20T13:31:57'
);


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
    '32162f69-4d1c-4c90-9288-7e9875ffc661',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-20T14:14:48'
);


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
    'b32c1662-1a19-4649-967f-9629629cb8a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-19T15:07:44'
);


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
    '9c0ff39b-22d9-4221-a2ae-75fe1ea9699b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    32300,
    32300,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-19T09:20:23'
);


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
    '3b0ce37d-1ae7-4a17-b3ec-15b8b900ab8f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-19T15:39:21'
);


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
    '1d825734-0434-4d60-b765-22c71f66bea6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-19T21:25:17'
);


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
    '6ab07741-9640-4a9d-b2ae-0dc52387d088',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-19T21:06:46'
);


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
    '695c2bde-7f34-4df2-be87-e51718550ac9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-19T10:51:47'
);


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
    '543dbd5c-fc38-4129-9c29-31beb09c07c2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-18T21:40:33'
);


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
    '06538b6d-df57-44a8-a99f-6c0688ef13d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-18T16:54:36'
);


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
    '2abdde9d-9d45-4b3b-936b-c18c8bc941bf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    16200,
    16200,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-18T15:47:21'
);


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
    '47d49971-744c-4d56-8cba-19c237a8f775',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-18T13:01:26'
);


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
    '073df096-3dec-4595-914e-d846175cd80b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-18T17:36:41'
);


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
    'c3f91de7-b8ac-483c-ae84-94536efe650e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-18T13:43:32'
);


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
    '86c6cb58-9e0e-46f9-9b36-660c91b3c651',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-18T17:18:29'
);


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
    'b53cbde8-ae63-4c27-a887-7c9a8dd30255',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-18T18:39:36'
);


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
    'c262115c-818b-4b24-be34-e878cacba9b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-17T19:17:38'
);


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
    'a066d1ed-e5de-4d26-a9a8-62560cae50a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-17T16:28:26'
);


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
    'e457a326-2c30-4dfe-80ce-b4891f33ab15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T18:16:47'
);


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
    '2f5aecf0-21ed-4b9b-bdaa-7439b85e3533',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T09:59:56'
);


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
    'fb3052ff-0591-4ab8-bb03-5be1221c30ab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    27000,
    27000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T09:16:39'
);


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
    'c0136898-c3d9-4a13-a606-3675d8f8356a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-17T11:15:47'
);


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
    'f1a14114-ead3-451e-b098-1f9edeb51564',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-17T21:10:01'
);


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
    '185934f3-0ff4-423b-bae3-35fce38f6033',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-17T15:55:34'
);


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
    '4b361683-35e5-40e8-a516-e92d3840e02d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T17:38:29'
);


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
    '4151dfc6-3517-45e9-8e79-a1b5a2300ef4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T13:30:34'
);


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
    'fb7f549a-8610-4520-9c2a-a526cfe38577',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-17T12:09:19'
);


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
    'e205baab-79f8-4820-95eb-23023c55bc8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T12:30:34'
);


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
    '4b597094-08df-495c-8bef-6615cc538cd2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T08:49:27'
);


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
    '15c77d95-6b49-4115-a7c7-2ffcc38f7f9c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    22000,
    66000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-17T13:12:26'
);


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
    '0c8673df-b0e7-40db-bb01-71bf0d7c7e6c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T21:24:14'
);


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
    'a3360884-7f12-4c71-9a13-60ce75c1f6b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-17T20:51:58'
);


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
    '1b3934e9-f346-443b-8a45-2b1a31bec3b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T14:12:54'
);


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
    'f77dd5e6-ba9d-436c-8b67-8551ee03f813',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-17T15:12:20'
);


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
    'bc9a9526-1c7a-4a91-9d12-7f0ce31cca9f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'Latte',
    1,
    25500,
    25500,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T09:18:17'
);


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
    '4e61a18a-f03f-44eb-8bad-0ad45fa2ad90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T10:00:31'
);


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
    'e4d7ce02-8790-42e4-9120-533498f7d69d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T15:44:50'
);


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
    '24920997-f4c8-4e14-8078-2d9a8b9f42cb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    30400,
    60800,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T20:25:04'
);


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
    '0dd7f7d6-cb04-4a93-b30e-fada350cc256',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-17T21:00:07'
);


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
    '6fb718d7-462f-4a4f-a8d3-ffaae7197b48',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-17T19:02:12'
);


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
    'ce7e6b3c-6b97-4924-88f4-24a3781f04b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T14:43:19'
);


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
    'b47ce0ac-fbd9-43b5-8601-38f9465afb6e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-17T16:07:16'
);


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
    'a7f6c776-d387-42b7-8585-e2fdac4f5608',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-17T09:15:40'
);


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
    'a9fa02db-b18f-4964-876d-f5279a08ad3b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-16T09:25:50'
);


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
    'd55d1a20-58a6-467c-a00e-1736cada52f5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-16T19:38:09'
);


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
    'f30dae0d-3797-4a5d-bad1-a0340a3efc45',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-16T20:40:03'
);


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
    '76e01659-c215-4082-a68d-9e51d7025b10',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-16T16:50:41'
);


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
    '2b024f46-3f3c-4442-954a-8b4215393ec6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-16T13:46:08'
);


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
    '5b35dada-3919-43e7-9490-24ec5cece2c2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-16T12:34:44'
);


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
    '49170355-70b1-4d31-8849-7d42f96f65c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-16T13:46:29'
);


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
    'd04a9ed5-579b-4fcd-8561-9a283b37dac5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    30400,
    30400,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-16T21:16:34'
);


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
    'f873921f-5866-4dde-ad07-6f6a2ce1077e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-16T11:20:46'
);


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
    '61e57cd3-3575-49c7-931f-2107c64a65c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    33000,
    66000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-16T12:20:26'
);


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
    '5cc5280e-82f0-4528-b0f6-cbe92a244a57',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    28900,
    28900,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-16T21:08:11'
);


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
    '177842e2-a8c7-4d71-98e7-3ab761f14f86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-16T08:36:41'
);


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
    '1a431f3e-5f4b-41b4-ab6b-cba15e9a755e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-05-16T12:03:23'
);


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
    'efb6a985-429f-41e5-a4f4-4f05e9f729ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    20900,
    20900,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-16T15:51:40'
);


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
    'a81921a1-5b62-4680-ab91-9875cdbe23eb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-16T12:33:02'
);


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
    'e57ff8eb-4342-41c3-86da-1b31dd253d0d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-16T19:14:34'
);


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
    '36dedda9-3e96-454e-a905-5a5d9b08a348',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-16T18:11:35'
);


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
    'be012f3f-83f6-4aea-ba19-3305282fa101',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    4,
    25000,
    100000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-16T18:29:44'
);


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
    '1634768e-bd78-4825-adda-ea56ccb36bde',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-16T18:10:34'
);


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
    'ccd09b6f-e596-406f-958a-97f341dc96b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-16T21:23:26'
);


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
    '6d739598-00cc-4d81-91b8-47470d0bd153',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-15T20:35:59'
);


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
    '5e3c8589-ebc5-4313-93aa-2c90d496af2e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-15T08:46:02'
);


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
    '7742f45b-667e-41b3-ae9e-b7098cf84268',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T12:14:13'
);


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
    'ca9d92ba-8058-4a3a-8af6-7b9b425f0fc5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-15T16:35:36'
);


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
    '68fe0d62-fdd1-4e91-8d01-3e32d0696468',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    25200,
    25200,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T10:16:23'
);


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
    'ddbc46ae-ad69-483a-805b-0105d680b2f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T17:25:36'
);


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
    '5372a439-b3c8-42e8-93cb-59fd22c96ac6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-15T15:52:57'
);


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
    '5a7d8ff2-74c5-487f-86e1-34aab3769e6c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T19:51:36'
);


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
    '184c08e7-9ccd-4bbe-8ca2-ce5aa560aeca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    1,
    38000,
    38000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T21:27:26'
);


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
    '70de9458-0a02-40e4-917e-380ada13fd7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-15T18:49:40'
);


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
    'd12510e3-0f6b-48d0-8019-1330a0ba057d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    1,
    38000,
    38000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-15T16:36:09'
);


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
    '7a6baf87-cbd1-486b-9e50-61523f7205c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T20:38:36'
);


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
    '55adcc75-f5de-4b60-9789-ae6b501c6b55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-15T10:08:21'
);


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
    '83c86e86-e4a3-4cf7-8687-bf608a3fa166',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-15T14:16:05'
);


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
    '6c2b6be4-20fa-4956-bb48-9274f237ac68',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-15T15:35:12'
);


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
    '818c713f-b4d6-42e2-b9e3-fa6150b7e2c7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-15T17:47:33'
);


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
    'bac55ae9-7e39-4b23-baf6-3e1116778186',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    27000,
    27000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-15T09:07:42'
);


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
    '95afe11e-60a4-4735-9a9d-d4ca14c4877b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-15T13:38:41'
);


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
    '9abd1f6e-e9e8-4c4e-a243-df29ed74431a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-14T17:09:28'
);


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
    '5b49271b-3a21-45a1-9c97-bc06c6fc6def',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-14T19:03:15'
);


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
    'ad10d86b-8f78-4a37-b4e2-3f336d02f7ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    23800,
    47600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-14T15:30:01'
);


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
    '3b76aaa5-7605-4ca5-94df-afa4e89122b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-14T16:33:48'
);


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
    '8dd30cfe-c9c7-48b6-9c8e-cac9f3ee5487',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T14:37:57'
);


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
    'ec01a5bf-e289-4a07-90e5-a3721bced08d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T11:50:44'
);


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
    'd99551c3-871f-4948-a10c-d92ce38ab001',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T14:42:17'
);


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
    'd5cd4883-cbf9-47da-8363-588a1bf057ef',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    28050,
    28050,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-13T14:32:45'
);


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
    'd4ed880e-9b81-4020-8f6a-9d70439d8f86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-13T09:11:12'
);


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
    '9b3de43a-4f56-4d17-a13f-41414851319f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T11:59:33'
);


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
    'acc6fa79-6614-4b59-a0b6-c3235f645140',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T13:43:22'
);


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
    '6940deb7-dded-4bcc-be8a-4c4ecfd19fed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-13T20:03:40'
);


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
    '650eb1d0-6dfc-4666-84e2-0ee7a53e55ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-13T12:14:09'
);


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
    '7eb23b20-fc45-4e85-87eb-fd889b00b03a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T16:43:39'
);


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
    'a0d8a115-1fe0-4961-9b21-7691a5a37e41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T12:58:38'
);


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
    '3177e181-710c-4f28-87b2-b45f9b547783',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-13T17:34:43'
);


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
    '4abfb1a7-965e-4cfe-b4af-6ad6d3c1421a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-13T14:58:49'
);


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
    '632ce072-adbc-4939-a5f7-a200627fdb4d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    2,
    25000,
    50000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-12T19:07:11'
);


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
    '3010290a-e7c7-4157-acf8-f7ee9326ff1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-12T14:19:28'
);


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
    '31382227-4b83-4de2-a67b-219f6755fd6d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-12T10:01:48'
);


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
    '7840845d-a29e-4946-91d5-8c2d5276f369',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-12T13:05:44'
);


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
    '4b1869e5-5d09-4b3d-a10c-5f9d214cd402',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-12T19:41:23'
);


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
    '22cdc7b7-ba9c-428e-90bd-f42d1910eb28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-12T11:14:02'
);


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
    '959ceba9-450b-4662-bc00-6520d616b142',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    1,
    38000,
    38000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-12T19:42:12'
);


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
    'cf5e259d-5873-4faa-ad85-4723377b79b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-12T15:44:20'
);


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
    '760bd6af-844e-4d3f-b695-1dcc8b5ec9e0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-12T19:52:24'
);


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
    '95845eee-8d71-40ce-ae79-217bbd977d9e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-05-11T16:33:41'
);


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
    '318b0802-3b58-4fee-b24c-ae25749ac73c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-11T16:34:25'
);


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
    '28b33fab-f89b-4e8a-a74f-ee569fc2fa62',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    2,
    33000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-11T15:10:27'
);


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
    'bcf96ff3-fff5-4f45-ab7b-c60d85125b06',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    22000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-11T15:53:41'
);


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
    '5725f9b9-1ad6-4483-b4b8-a63f22a1b375',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-11T20:37:57'
);


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
    'a3656a4c-cd4a-49cb-889d-5ffaa8082416',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-11T08:11:29'
);


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
    '1971bb7c-3f9a-43aa-83ee-26239cb55a8a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    25200,
    50400,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-11T09:07:45'
);


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
    '9b9efc36-a98b-40a3-a4f0-4058902e7158',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    6800,
    13600,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-11T17:10:24'
);


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
    '2ea4190a-cde1-40e3-a2b0-fc88bc46ef2e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    20900,
    41800,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-11T21:42:55'
);


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
    '8f94d4e5-8f96-4f88-88c6-f2e3241e93a9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-11T14:19:19'
);


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
    '1b12c336-bdb2-44d4-a2ee-e01761954331',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-11T11:00:39'
);


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
    '0fa6c738-f9c6-4f32-8e39-495185bdb137',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-11T20:00:38'
);


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
    'af0b4cb8-8145-4d72-be33-c4d2fe22025c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    2,
    38000,
    76000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T14:28:05'
);


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
    'c6b22c30-7a5f-4b4f-9fb7-0c97e3e05660',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T08:11:09'
);


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
    '44f30d11-57d3-49f8-823d-fd1a264ec54d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-05-10T12:21:58'
);


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
    'f0611033-9607-40b2-8d0c-3a68cafe4295',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-10T18:18:39'
);


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
    'aec5f029-0d06-4a88-a01d-aad9c607fd5e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-10T08:05:49'
);


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
    '61c0c2a2-0ec8-4667-8319-0732f529084c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T20:27:53'
);


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
    'ff9404c5-b344-4a7a-949a-5e8618ab244c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-10T19:55:17'
);


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
    '0674c273-95a1-41ae-867a-574dfe87aa9e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-10T08:06:36'
);


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
    'b675efc2-7775-42f0-bf5c-5b54c2bb93bb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-10T14:38:54'
);


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
    'a83c6e1e-4f66-4208-ab0a-8c2d727e812f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-10T10:39:36'
);


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
    '419529f8-5fe1-4216-9e2a-77c446ad560a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-10T11:45:18'
);


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
    '7a4852aa-1523-4738-81ca-52329cbeb068',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T19:54:13'
);


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
    '1c434dcd-77ab-4f38-9ee8-2a2ecedb05b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Chicken Sandwich 29',
    2,
    34200,
    68400,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T08:40:12'
);


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
    '98cb0c35-4ea6-4bc2-b75b-c30cd7ef437d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T16:35:20'
);


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
    '78d06a37-79b3-48ff-9a17-162c291e6149',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-05-10T08:53:11'
);


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
    '6974aa08-5ece-4e24-a41c-f8daefad9c6a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T20:02:41'
);


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
    'bab8fa2d-4ed4-4a21-840b-55a67ff884cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T15:50:52'
);


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
    '617f2d7c-252c-4347-b09e-047658c45d0a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-10T17:43:21'
);


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
    'b6ff66bc-9e71-414f-a6af-2eee384a07b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T13:24:40'
);


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
    'c5064834-6a65-4098-9048-7647c1e7a927',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T17:07:55'
);


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
    '4c403b1a-8363-4be3-acc0-8f0ae11c122b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-10T14:05:31'
);


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
    '670a7a36-5f2a-4944-8c1b-12e3facb5d85',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    38000,
    114000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T16:19:11'
);


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
    '2629e024-ee3f-4f44-90c8-ae4519db9b6a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-10T15:32:01'
);


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
    '0b3772fd-5535-41de-b0cf-fa3ebecea66c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-10T12:49:20'
);


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
    'af34cba7-bced-4e82-bbfb-c895211cab49',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T11:46:02'
);


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
    '03d61738-dfb1-4591-b402-80311a951a8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T08:19:59'
);


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
    'e827c3df-995e-4798-b9f9-419e69c347cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-10T20:42:47'
);


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
    '9bf26909-5d1c-4ba4-b830-14eb56c7f55d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-10T13:12:12'
);


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
    'ca0c6813-d261-4c21-9b22-6321d49bed11',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-10T12:09:10'
);


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
    '19b2dae2-8ac3-4b9f-a509-f3fd2d5686ca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-09T09:13:34'
);


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
    '561f9a92-6cbb-47ac-a2a6-760096d6a55e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-09T11:10:04'
);


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
    '5725cceb-bd33-453e-83f2-665d20b66d11',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-09T08:08:01'
);


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
    '860e7476-2bda-427c-bdee-5e588056db37',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-09T14:25:11'
);


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
    '676992f2-06fb-4b8d-bdd9-6fa34e6a0efb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-09T09:59:48'
);


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
    'd49d370b-9355-468a-9188-a0cf381a6817',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    6800,
    6800,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-09T15:19:43'
);


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
    '43897ce5-ad49-43a0-97dc-ef5ec71af061',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-09T21:57:39'
);


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
    '349dc277-4209-4cb9-bd3e-acf7e8b73a17',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-09T15:31:01'
);


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
    '8987c4d8-6980-40f6-8ab3-9f59dbed6ee8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-09T20:22:38'
);


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
    '3bfe8fc0-c642-4fd7-a25d-396294848da0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-09T13:35:41'
);


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
    'a1b1f055-c0c1-44b2-8f91-d43d53bc4586',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-09T17:15:35'
);


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
    'cdd7baaa-ccbb-4668-9c66-e4c1a467de8e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-09T21:44:37'
);


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
    '7637aed2-060e-463a-a5ea-41c0a30fa5d9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'Croissant 39',
    3,
    25000,
    75000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-09T18:42:04'
);


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
    'ad89bb7d-7074-47c5-8fca-020b430dc5f0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-09T13:35:06'
);


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
    'a4e3c7aa-f602-42fe-8b67-f955e4010bd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-09T17:06:43'
);


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
    '97597796-52a4-4d95-9add-9ebf0971fad6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-09T11:52:08'
);


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
    '19ef298a-8245-4080-bc37-c1cd329c8d0c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-08T11:13:43'
);


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
    '27ff3785-6cfe-4c10-b939-ba60620fae07',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-08T19:58:22'
);


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
    'fc8dadf0-9ab4-4bff-9859-59674eda4e3d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    12750,
    38250,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-08T21:18:03'
);


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
    '8d424e67-87b8-4c85-8ab3-117879a7ab74',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-08T19:37:25'
);


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
    'e175a8fb-3116-40d1-8518-50d4b79b4f27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-08T11:42:11'
);


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
    '335f317a-b9fd-412d-a4bb-3175d27bd73e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-08T21:26:09'
);


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
    '306b04da-1334-4a5b-ac33-60d251071cc6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-08T10:46:56'
);


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
    '7271cf18-3063-4ddf-afc1-1755eab26206',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    27200,
    27200,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-07T20:44:38'
);


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
    '727700ed-3f56-43c6-8906-1552517558b9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-07T13:14:11'
);


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
    '0cbd5c0e-b9d5-4fef-8c2c-4dd644e5897f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-07T12:26:59'
);


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
    '8c3cbd12-7aaf-4a4b-8e5d-e5f860ec9100',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    3,
    22000,
    66000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-07T15:45:23'
);


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
    'fb648d05-d239-4123-8ada-e55411463c63',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-07T19:46:33'
);


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
    '55e6068b-6312-4d6d-985b-13805c093f71',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-07T09:15:30'
);


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
    '07ee5d83-54a7-4bf8-86ab-764fe8c00826',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-07T17:03:57'
);


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
    'a1bad772-0519-4616-a74c-842c1de1cacb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-07T17:46:21'
);


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
    '05e4c418-c207-4785-85eb-47ceaada1a21',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-07T19:50:36'
);


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
    '6af0c163-38a0-4702-a4ae-ab3114c8e93c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-07T17:03:42'
);


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
    '5d48831e-4c9d-42be-8f68-cfcd1a8b0250',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-07T16:04:54'
);


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
    'c85acc69-5462-46b5-8809-e47a8f23299c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-07T21:16:00'
);


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
    '15232a31-f53f-47a1-9d33-d6067d7df5eb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-07T13:51:11'
);


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
    'd0eb18c5-83c6-4bc3-aca7-6442398a497a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-07T13:05:09'
);


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
    '5aaf6fe6-601c-446f-9f71-131594821238',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-07T11:42:28'
);


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
    '15517048-552e-4615-8bca-1f5adc01d81e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-07T18:16:48'
);


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
    '99e11bde-29b4-4abf-9d93-4900a9dbd9a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-07T12:30:47'
);


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
    '87809ed0-586f-49ca-adea-5be6f4580f69',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-06T21:27:00'
);


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
    'bc5e642f-be61-4837-bd7d-84d623401403',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-06T18:02:06'
);


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
    '0d4940f1-4058-45bd-9877-6e159455c2f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-06T18:54:17'
);


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
    '31c64b70-6e59-47d7-a423-bab22b82aa02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-06T18:37:25'
);


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
    '88888097-3352-4d10-b4d6-d2ae63dd62a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-06T16:21:43'
);


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
    'a787d0e5-87f4-4c30-b75c-c5148200461f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-06T08:26:06'
);


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
    '88250dd1-9855-4bf1-b7d4-e8319aa89bba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-06T19:18:16'
);


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
    '332df86c-6f95-48ff-ae8d-044674c83a55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    31350,
    31350,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-05-06T18:57:53'
);


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
    'b7115ce7-73bc-4265-9399-d34720b24e33',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-06T21:38:08'
);


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
    '8d9b7b6b-0fc1-447a-be0b-65230a82836a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-06T18:29:59'
);


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
    'e4be2a1c-7948-4bd3-bc11-b9194b394114',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-06T10:49:04'
);


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
    '3e6bc17d-27a2-41ee-a866-e4c811bd5920',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-05T10:28:04'
);


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
    'b7ed1c95-1094-49f1-b9c3-46b1839c5bd5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-05T09:09:34'
);


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
    'f66375ab-0f94-495c-8c33-d8491bc748b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-05T09:04:36'
);


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
    '4f2df973-81bf-49f9-8dcc-0299d7e038c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    30600,
    61200,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-05T08:42:24'
);


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
    '24332dcf-00b3-4301-b2a7-8e3e56b7f007',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-05T08:32:45'
);


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
    '9c221100-d57d-41a3-8c4b-5ab7d122082e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-05T11:00:24'
);


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
    '28ac993d-7e10-4ee6-be6d-36cb3bd0bffc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-05T18:19:25'
);


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
    '1e867687-50b6-4f75-a35b-64e1d3f6c50f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-05T10:35:02'
);


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
    'b343ca2d-45f3-4268-9df7-a50d2911dae9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    2,
    38000,
    76000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-05T18:44:22'
);


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
    '6ddf227f-5826-4d32-914b-2e18715e6149',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-04T08:12:01'
);


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
    'e4c9405a-49d2-4ae6-b922-5b71b5158625',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-04T15:34:53'
);


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
    'a6308b43-9939-4681-a14d-327e24c3a09b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    7600,
    7600,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-04T14:07:13'
);


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
    'a7cc69da-0306-4a3f-b5d4-2df922211b8d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-04T08:47:09'
);


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
    'a40bd55b-db4e-47e7-bc6a-ad7de065724d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    18700,
    56100,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-04T19:41:08'
);


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
    '33f6fdd0-0c10-4245-b85d-e8ef368cce21',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    2,
    18000,
    36000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-04T21:52:06'
);


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
    '2ff51c81-3ef5-4a3b-b766-85c54975a44b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-04T09:51:12'
);


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
    '96119605-bafb-465d-be2f-f6cd812bfa95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    2,
    28000,
    56000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-04T10:20:53'
);


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
    '0a823687-19cb-4461-8db1-102b01ac975f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-04T09:17:09'
);


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
    '6a30f5db-c778-4be2-a227-53195f81f541',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-04T09:50:54'
);


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
    'f30f6035-d63b-4c05-bfa9-8271345573c0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    14250,
    14250,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-04T14:44:51'
);


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
    '3f62b0cb-570d-43a9-ac03-1ff0f2bfe022',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-04T15:26:15'
);


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
    '86023da2-04ca-4c48-9d1b-5b04f6ee3395',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-03T14:00:35'
);


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
    '695d8c2e-665d-4823-9e3b-b3bd46f6f9a4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    2,
    38000,
    76000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-03T17:23:55'
);


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
    '08950a25-f06d-48cb-8ae1-d101d3b54a86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T08:12:07'
);


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
    '4651748e-1629-4168-a264-9f65d9a23e28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T08:41:23'
);


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
    '20cf381a-7095-4b41-9eaf-eb0d10a983fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-05-03T20:56:48'
);


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
    '360315ab-9f90-4dee-bdfd-0ed7d0aaa724',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-03T10:10:50'
);


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
    '1223254f-cb23-470c-a3a0-e0a907f895f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T19:28:37'
);


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
    'c9c1b396-17e6-4f6a-b2cb-5ed481a0e183',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-03T20:07:20'
);


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
    '8d627125-204f-4567-b7b7-d3ef2901fbca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-03T14:57:14'
);


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
    '411b32f2-db12-46b5-9823-775666eba79d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T17:29:11'
);


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
    '5acd9fab-9e52-4ba9-88c0-bc540792223c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T12:12:21'
);


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
    'd86d3cff-1702-47af-adc1-c931bb109747',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T10:07:54'
);


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
    'df5ad723-7049-47c7-a404-8c583fe4cc15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-03T12:38:10'
);


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
    '7b6fa814-dbf0-4f8e-b73d-1d2e7c0e94b6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-03T14:54:33'
);


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
    '97e6f9c8-bfb2-49d9-bf7b-90d2164707ac',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-05-03T08:46:27'
);


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
    'f3b87c27-9970-4858-b4f8-8b2f4e725e83',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-05-03T17:09:58'
);


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
    '9a79cb1f-767a-474d-9f5d-a2f1c26107f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-02T20:51:44'
);


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
    'b19fabe9-d722-49e4-a5c8-2b0951c14088',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-02T20:00:44'
);


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
    '4c7a1b34-0411-4d6e-84d6-6a1dd7252cb2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-02T18:05:01'
);


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
    'da4b1e81-4c4a-422f-9d30-0d45b4d33ba6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-05-02T19:37:01'
);


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
    'fd19c17e-5852-4869-aa1b-a326c26fd965',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-05-02T20:55:23'
);


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
    '9c3aa5b4-3233-4faf-8066-a367b0f63ca0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-02T19:21:33'
);


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
    '1a0a2488-84c3-4eb2-9e36-3063673c86e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-01T17:50:13'
);


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
    'da61d5b8-f743-494c-95e2-dfec48f6a2f1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-05-01T18:23:56'
);


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
    '6670f2fd-21ec-4d10-8851-e07ec6bb21db',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-05-01T13:11:41'
);


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
    'f4f861d0-9804-4919-9f80-20a79ea2a8c0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-30T21:44:13'
);


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
    '7ad1ffc2-a4c6-45d0-8a2d-8c2bed583fcc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'qris',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-30T18:27:17'
);


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
    'dbc424d4-a67f-48c5-9597-267a66b02ad8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-30T19:34:43'
);


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
    'c0128261-b76f-4ea2-8dfc-f617efc53e50',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-30T11:57:56'
);


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
    'd565d6d7-0841-4eb2-8efd-c47679f44ce0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    7600,
    7600,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-30T09:10:17'
);


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
    '956c5100-5a34-4c74-8039-97d2a87a6d92',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-30T18:01:18'
);


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
    '85100eba-84a7-48ab-84fa-0363c6b17690',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-29T11:04:01'
);


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
    '21843d83-ca4b-4762-bb10-dbe4bb01ae1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    38000,
    114000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-29T15:37:42'
);


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
    '01c9c122-818a-41ac-83bb-c4331f4f60d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-29T20:19:10'
);


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
    '2200509d-fb55-476f-8974-3879f8564b4d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-29T10:22:18'
);


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
    '7db77856-c7e7-49a1-a4a0-201c329a4741',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-29T12:11:11'
);


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
    'fc11e36b-3809-4111-b070-ebb6dc763c5a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-29T17:08:28'
);


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
    'b6b57b36-d53f-4e19-9c9c-bd0f77d88b0d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-29T18:20:22'
);


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
    '6d1845df-5622-4883-8046-af0b5907b4a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-29T12:07:58'
);


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
    '5e561777-4943-4a6c-baae-18dc3da60e99',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-29T13:09:00'
);


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
    '1d503d7a-721c-49cb-ad3d-02c41363129b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-29T12:48:36'
);


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
    'e44b6e64-ac6d-4c4e-bb1a-61122994b07a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-29T08:08:43'
);


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
    'cc7af1dd-f4a0-4463-87b6-c06778f8ad7b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-29T21:14:28'
);


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
    '25701bea-3c31-4b51-907c-180a57bf0760',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-29T17:33:14'
);


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
    '0a707600-daa3-4d3f-a6d0-03375f864aa4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    27200,
    27200,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-29T16:25:12'
);


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
    '55593f81-a7b3-4834-8367-5836687b2a11',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-29T18:23:25'
);


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
    '5089a894-41d0-44cf-ae47-236204e7e1d0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-29T12:22:22'
);


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
    'c9b4c841-d16a-4740-bd0e-325a2c891680',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-29T19:56:28'
);


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
    '3a8d3925-277c-4925-a9be-87460c8efa44',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-29T10:53:37'
);


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
    '600918ba-e902-4090-9c40-d2537a15967c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-29T13:04:59'
);


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
    '0d4cb990-643a-441f-8e30-648969f9c993',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-28T10:35:29'
);


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
    '355921b1-9786-4e74-a4ba-b56b6ddce048',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-28T16:31:02'
);


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
    'b21fdf60-10c1-476c-b104-9145248c93fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-28T11:01:50'
);


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
    'b39d345d-6433-4581-8340-844ad384db6a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-28T18:42:57'
);


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
    '16e708dd-a996-4330-919f-688e28079005',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-28T09:48:17'
);


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
    '05aa2a73-0d64-4fc2-b4ec-739e07aa836c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-28T15:36:27'
);


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
    '67dcf299-d8e4-4032-be9a-640d758c7f82',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-28T16:46:36'
);


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
    '00e7d20e-413a-4030-a587-a6c5d6367fa4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-28T13:10:03'
);


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
    '2b64e157-600d-42e6-87e6-ef79aad0c09e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-28T12:18:33'
);


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
    '8528006c-c520-4ef7-bef0-b59d1dca4334',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-28T17:48:10'
);


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
    '13b4babd-cfc2-4e29-a91d-715a15a32ec3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    2,
    22000,
    44000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-28T18:44:44'
);


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
    'da0ed49e-19e3-4d92-adcd-99ac7e4efdcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-28T16:18:23'
);


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
    'b1a160d4-c29d-4b06-8500-2d13743e6301',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-28T11:09:32'
);


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
    '36be54e2-a767-4259-9774-ad6da3371d46',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-28T19:53:33'
);


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
    '0e4a5721-36b5-4366-8dca-88c4c6c99ef4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-27T13:19:44'
);


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
    '0d1caef8-198a-4921-9692-979f14bf5660',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-27T19:52:07'
);


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
    'dc23d0fb-d10b-403f-97d9-88869a89f048',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-27T12:08:13'
);


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
    '64e802af-abd1-4577-be00-d8527c3ef7e0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-27T08:49:30'
);


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
    '5a562144-e390-4248-9223-ada801b21580',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    23800,
    23800,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-27T08:30:07'
);


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
    'cb70b47a-ae5f-4d0f-b1eb-e7be1635044b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    3,
    20900,
    62700,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-04-26T11:37:57'
);


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
    'caa6ca0c-9964-45e4-8f3b-2a069987d930',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T10:54:47'
);


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
    '4eaae600-2be5-44a8-9639-6efdd992fff5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-26T11:32:36'
);


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
    '9020aaf4-4e89-430e-837b-b059d4a3603a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T10:57:48'
);


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
    '431cdfad-9440-4cda-afa5-7ecf1b63f9aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    1,
    30000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T16:54:45'
);


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
    'f1366ef4-058e-4da8-8fa3-19b58974ff40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T18:06:11'
);


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
    'f12bf789-61cf-4050-ad85-60f981f3af1d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-26T14:07:48'
);


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
    '4f9e5484-e52d-48d6-92ac-3e9278ab8be7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-26T15:48:23'
);


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
    'aeb85936-cf94-4e39-9a78-ed7184a48c4a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    16200,
    16200,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T12:29:38'
);


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
    '6266c0ca-0581-41be-8eb8-088000ee5dd6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-26T21:27:12'
);


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
    '401a832a-5f27-4827-9ef0-5caae2ccedd7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-26T10:25:25'
);


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
    '1f1a1fc4-39c0-439b-aed5-f4444a06a882',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    26600,
    26600,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-26T17:54:25'
);


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
    'ff7bbbde-84e8-41e9-867b-0fd23fdcec85',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-26T20:45:49'
);


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
    '5df9293c-2b6e-4b78-a780-db983639b7a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-26T15:32:17'
);


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
    '9cbc1523-8beb-4227-b137-d94884a634be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-26T15:14:40'
);


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
    '36e8a435-fe76-4cc0-9457-48f06096b4c2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac40f533-b291-4954-9525-c7f766410f6c',
    'Espresso',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-26T10:24:38'
);


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
    '38cc5f4e-954b-4861-b5f3-48be040ad334',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-26T20:04:42'
);


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
    '21b99a70-d47b-4846-bb9d-faf861d5bef2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T16:16:34'
);


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
    '4206496f-2475-4354-81c6-eeb9445a8616',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-25T09:24:28'
);


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
    '8de9f43a-4298-41bc-a209-943eff7b9832',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-25T10:35:42'
);


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
    '03cd6d62-41ed-4c3d-a750-f70f6c936fc4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-25T12:45:24'
);


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
    '7640a6c8-ca85-4c79-8111-c093852097b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-25T18:34:36'
);


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
    '5099bf76-6a76-4c84-a33c-9cf910449470',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-25T08:25:16'
);


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
    '1be89458-aac5-464f-9c1a-46cf8282f4e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    3,
    22000,
    66000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-25T20:18:20'
);


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
    '688c8460-2d35-4b3d-8d6d-fa2dbe98de27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-25T13:26:22'
);


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
    '6973cdbd-ff07-4e79-acb8-96f15fd96e1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-25T19:04:55'
);


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
    '72e7eff6-d67e-4efa-9bd1-2bd6b20d3799',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    1,
    22000,
    22000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-25T13:02:29'
);


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
    'b1709ea4-8c8d-4b11-ba2b-91327da27350',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-25T13:24:36'
);


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
    '7c228879-0ed9-45b0-94e9-bfab7c15db4c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T19:43:13'
);


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
    '7d6df0d3-3821-46bd-93ac-13de6505425f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-25T17:19:23'
);


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
    '21d2f7a8-8508-4604-ad89-7a0fd3e745f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-25T11:18:16'
);


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
    'e83e4b10-949b-4f1d-9516-e1b32ed1cb8a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-25T19:54:37'
);


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
    'd183ce55-3490-411a-a0d3-cab516e0741b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T14:13:22'
);


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
    '4d051ec8-b908-47c0-8ecd-a517e4b3c7f0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T14:42:34'
);


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
    '749b1688-590b-4de2-87a7-c9bad7acf22c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-25T16:29:42'
);


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
    '8e5ad619-85d0-4ab9-b2e6-0df73130f699',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T17:31:13'
);


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
    '88bce4df-5d6e-49f3-9d01-beeaf7389032',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-25T21:49:58'
);


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
    '065d4f57-2d1e-44a6-8807-ead151bf31db',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-25T10:15:09'
);


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
    'b46f9029-74b2-4b56-8cb0-1932ac4c9921',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-25T21:26:17'
);


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
    '7e6ff011-d50c-4353-a5b3-225cdc2cc6f5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-25T14:15:07'
);


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
    'bd660910-96b3-46f8-9702-7546a2f6f097',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    25200,
    25200,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-25T16:27:27'
);


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
    '0f3bcb63-6b29-4579-8a9d-5ce1d954e37e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-25T12:50:51'
);


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
    '2b29f5dc-40b5-4ac1-88d8-779b8d587625',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-24T20:01:03'
);


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
    'c3dbef9c-a34f-4824-9d32-ac4956e1877a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-24T13:42:42'
);


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
    '36b002af-fa41-44b3-9d80-58537270aa83',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-24T12:31:56'
);


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
    '929e1cc6-cfd0-447b-94ce-ef8acfed576f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-24T20:47:47'
);


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
    '7aec0d43-8ba1-4e9d-a8d6-ff8cba6518f0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    4,
    38000,
    152000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-24T11:17:28'
);


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
    '5bf7b966-1598-4af5-b49c-82a49c0661ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6f0f6e7-3e16-402c-9850-2b39fa395034',
    'Latte 37',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-24T16:27:30'
);


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
    '61ba535e-645e-45c6-bd16-14327c173833',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-24T15:45:23'
);


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
    '9b6b3c73-686b-444c-ae4f-ca653c84572c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-24T21:47:42'
);


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
    '147be3c3-0f1c-49c2-b38c-c7d0139b60b9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-23T20:43:07'
);


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
    '32733855-c40e-4e21-b799-9a0053f87c81',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    28800,
    57600,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-23T09:59:52'
);


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
    '76c7e6ce-0c37-4f5b-b725-a10ddcf611e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    3,
    38000,
    114000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-23T18:20:56'
);


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
    '3e889877-4bb7-41d7-b9fe-511317be6abb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-23T15:47:26'
);


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
    '7b03ad53-dc60-42dc-a7ea-100db533e915',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-23T19:16:32'
);


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
    '81dd3830-28b6-46b0-8cfb-d1b84ca57dc7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-22T15:44:01'
);


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
    'd9a90526-ed87-4d17-a23a-0264bef5ba63',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    30400,
    30400,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-22T17:05:07'
);


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
    '4d76a8fe-40ef-4721-9fdf-7e58cebf8ea2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-04-22T18:26:50'
);


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
    '0caac0c3-5770-48e9-9a45-6ef038fbcd4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-22T10:43:37'
);


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
    '315c936f-8a67-44de-bfa4-86973c298c3a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-22T10:25:56'
);


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
    'b498b001-8490-4c95-bbe8-99b48775d507',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-21T12:44:54'
);


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
    'b57967de-5a33-4967-bf90-6f92040a4aad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-21T12:09:05'
);


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
    '4fb0361a-63a9-44d1-915d-48fa8d887f09',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-20T21:52:50'
);


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
    '95a65555-e636-4ebe-ba92-0b2709f5afcc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T14:54:13'
);


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
    'a47436a3-2d45-41cf-a209-2ae29248ad97',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-20T10:26:50'
);


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
    '77d3728c-386b-43e5-9ce9-499b51f927c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T17:28:58'
);


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
    '7dc5a8c1-635a-4785-a40f-130be7ee9f52',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-20T08:30:08'
);


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
    '42fb5a24-5588-47f9-ae0e-cb222d9aa239',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T19:38:16'
);


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
    'cbf2568a-f6f6-4556-90d3-b1abcf39566e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    4,
    38000,
    152000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-04-20T19:47:51'
);


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
    '91465709-015e-4292-a622-3e00e3d54ace',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T10:57:35'
);


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
    '6a275524-aee6-4fac-878d-ba63e99de185',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T10:05:20'
);


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
    'ffe59436-3496-4ddd-bd45-26106666c625',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-20T15:55:53'
);


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
    '367f3942-1e32-4fab-9d22-afc1179f88dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    2,
    18000,
    36000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-20T17:53:48'
);


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
    '2c17e42c-4180-40e0-8f92-279c5270f0b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-20T19:31:48'
);


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
    '23fe8a84-e6f4-4af9-8387-c2806c101441',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    26600,
    53200,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-20T10:02:30'
);


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
    'e260248d-0678-4350-a8d9-ce40b3be948d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-19T15:22:45'
);


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
    '9676965b-b0d2-49cc-9ba0-93efff4ee116',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-19T13:05:13'
);


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
    '72e3706a-06e8-458e-994d-7e40be838d8a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-19T17:57:42'
);


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
    '116880f4-4ea7-4ede-a1ee-3275cae17f58',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-19T14:58:04'
);


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
    'a8a17ad9-c0ba-439c-880c-9f536c072759',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-19T12:43:43'
);


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
    '2ca744e8-87dd-4732-8f37-feb5127bdaa0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-19T10:01:05'
);


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
    '271a5924-c8ac-4d9f-ac21-c9f6fad44324',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-19T18:00:21'
);


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
    'dabd71ca-7419-42cf-a85d-1cd6f31a1b04',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-19T13:51:03'
);


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
    '5100f1e0-0942-4fcd-bef2-5e3976699597',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-19T08:54:13'
);


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
    'b0f00670-ce83-487b-bb93-8d69925a67ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-19T09:19:31'
);


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
    'e1449f74-0be2-4987-bf2c-4418df2b729a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-19T13:42:06'
);


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
    'd542979d-a723-41ae-b021-ca5ab8abdf15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-19T17:38:27'
);


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
    '61bc1ddf-ccc5-4e99-9f89-c5351669f276',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    27200,
    54400,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-19T18:14:41'
);


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
    'ca4f4490-94e6-446f-98bf-9dbea3e9bb0c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-19T12:29:27'
);


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
    'a115097f-ad5a-400b-9cfb-5a7a9a507a5c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-19T21:15:33'
);


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
    '7fb073fb-7e3b-4ef2-be0b-eb8d186403aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-18T16:27:26'
);


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
    '5914de23-152f-44e1-b113-f8e638d805b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-18T20:32:01'
);


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
    'd0032203-1c05-478b-9976-e722ba436e9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-18T08:05:26'
);


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
    'c7861912-1478-4f2d-84b8-f2158c28be7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-18T17:51:16'
);


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
    'd081c251-cd03-4606-a0a1-3b29f1293220',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-04-18T12:55:43'
);


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
    'bd00a80c-3aca-4c43-ba64-49f869cd257d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-18T09:00:10'
);


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
    '25dc8211-fd38-4ad3-a94d-5236ac5c6fed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-18T12:39:52'
);


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
    'e3502b5e-9669-4467-8075-bcb1c3577e17',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    1,
    15000,
    15000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-17T21:01:44'
);


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
    'b656196a-959b-4faa-a112-b8f40d707fcd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Matcha Latte',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-17T14:53:40'
);


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
    '6e097289-62a3-494e-afb2-7a043ea73f2c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-17T14:01:07'
);


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
    'f5eddc2c-5d46-4caf-bb2f-440e9e097ca1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-17T15:01:55'
);


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
    '31d2d468-2dfa-4929-ac49-41abcef1fede',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-17T08:21:00'
);


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
    '45f174f4-deb9-462d-8dca-7918816bc781',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-17T17:46:35'
);


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
    '42797651-a1d9-4361-86e9-c92c012c7517',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Espresso 18',
    1,
    18000,
    18000,
    'transfer',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-17T17:46:39'
);


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
    '30d06531-49c2-4b2c-8bd0-af369b7e35af',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-17T14:36:20'
);


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
    '12318dbf-8305-498c-8df1-f511acf5fa4c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-17T17:41:22'
);


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
    '6e250e04-f292-495e-a502-03be072829c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    28800,
    57600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-17T13:28:14'
);


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
    '9d531159-1a77-4e3c-a519-569ecdc1d724',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-17T14:53:43'
);


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
    'cc8b4b26-7d72-4160-a657-dea55e1dece4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    1,
    30000,
    30000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-16T18:30:08'
);


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
    '1d8cbd3f-801e-4079-ae8b-7ed67035562a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    15000,
    15000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-16T20:26:31'
);


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
    'ce3a129a-227b-4264-b0f1-48f751b2c675',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-16T13:56:16'
);


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
    '0e95b57d-7c07-4b1a-a4fa-0b160eb04160',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-16T20:04:21'
);


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
    '4043a637-d20e-43f5-91d7-7587b996ef5d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-16T13:50:22'
);


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
    'c718ec54-9109-4402-8ae8-40434c807856',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-16T21:48:07'
);


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
    '46ef5686-071c-4522-8b4b-bbfc76dde217',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-16T09:10:40'
);


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
    '1ce11e84-3597-46cb-a779-084a8a15d5d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-16T19:28:48'
);


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
    'e6676d08-af09-40ee-9cf5-4bc35e50df6a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-16T21:51:30'
);


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
    'e569e791-6633-4627-81d9-282d41290ddd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-16T13:45:48'
);


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
    '06836c13-4ccf-40ec-a6d8-b154bba52639',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-15T14:58:26'
);


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
    'c756c979-3a5f-4eac-a468-bbca94247a40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-15T20:00:45'
);


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
    '1c67a299-a995-40c3-bbba-37fa5202eac0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-15T08:25:48'
);


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
    'ea0b184f-7cc8-4269-96a3-fd51945a972c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    1,
    32000,
    32000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-15T12:26:25'
);


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
    'bc28e361-f1a6-460e-8daf-bf9bdacf89dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    30600,
    61200,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-15T10:44:25'
);


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
    'e8299074-0509-4f6a-8ad7-192da7c3d005',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-04-15T18:28:44'
);


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
    'fe5101f9-65bc-4265-9906-cc51fb4e38fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-15T08:34:21'
);


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
    '7022b94f-29a8-4c98-97d8-2ab6b732f331',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-15T16:18:13'
);


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
    '8016f42e-6ab9-4276-abb2-df45a426939b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    23800,
    23800,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-15T11:53:49'
);


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
    'e913d200-d448-4115-8067-00a70f60a2ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-15T19:03:53'
);


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
    '84671151-b934-4a24-b497-2ac56abe95e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-15T12:36:47'
);


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
    '35111662-ab50-4127-9c22-4fdd7de2debc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-04-14T19:57:40'
);


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
    '122c1579-d3ec-485b-85d0-c3deb5199b1a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-14T19:24:33'
);


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
    '9d47c3f8-b345-42e0-956b-2ec14d3a371e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Chocolate',
    1,
    30000,
    30000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-14T21:49:23'
);


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
    '9687f23e-1e5f-4163-811e-370a7fa1af1a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    1,
    8000,
    8000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-14T09:05:03'
);


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
    '0f560cbe-34b5-456b-aa54-7e47d6799808',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-13T18:33:25'
);


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
    '1addce45-f5cf-4b50-9a5a-e01ac4b972c4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'Cappuccino 17',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T19:26:52'
);


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
    '4eb0b09a-39b5-4c74-9b79-a122d1a5d38a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T10:45:32'
);


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
    '794b7d8a-3308-42ab-9eff-a09cb53d4d55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-13T13:58:07'
);


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
    '7d74fffa-5370-4d47-b231-9bdd30daeac8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-13T10:07:23'
);


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
    '49eafa71-06de-4bcb-bc76-3e7539852be3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T20:09:09'
);


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
    '093d51f7-e6e2-43e1-8ba1-764dc0db8f1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    2,
    22000,
    44000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T09:35:22'
);


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
    '0528d3fa-f4bf-4ab8-90c7-1b42517256fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-13T15:53:46'
);


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
    '5c808157-cee2-4f41-a10d-7c78978e3c85',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Chocolate 35',
    2,
    30000,
    60000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T21:46:20'
);


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
    '31640e01-58ab-41ab-82e3-748eb18a0f9d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Donut',
    3,
    15000,
    45000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-13T11:57:25'
);


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
    'fc3e481c-3410-4b0b-96d8-70dda91052ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-13T18:05:55'
);


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
    'dfa07f13-ff1b-4e7e-9dcc-957088cbe11b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-12T09:12:39'
);


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
    '4bb81fd6-b063-4621-97e7-a1e85526472b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-12T09:42:59'
);


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
    'b73d70ce-3a46-4e61-91cd-cb7ef6fef9b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-12T09:51:34'
);


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
    'd1da2453-e0fd-471c-bc39-c7bdb028e408',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-12T13:27:11'
);


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
    '0da6011f-9e7d-4276-9d17-ac33cf82c17b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    3,
    36100,
    108300,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-12T12:09:11'
);


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
    'c93e46d2-8022-489d-b3a9-f527ad7b18fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-12T08:39:20'
);


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
    '238a4b82-d9ba-44a6-9d74-f95bb03ea565',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    1,
    15000,
    15000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-12T09:20:09'
);


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
    '60dab7b5-328a-4a3a-9df6-09c1325b7a03',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-12T11:15:48'
);


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
    '3a244c12-d99f-4da9-854d-493cef6a8384',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    4,
    38000,
    152000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-12T09:17:03'
);


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
    '4cc8c6a2-6822-4aa4-a522-51a455eadfcb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-12T08:26:40'
);


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
    'a3f60817-589d-41bc-9613-bfabe31cfc65',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    1,
    38000,
    38000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-12T11:48:35'
);


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
    '95342c97-30de-4c12-ab09-175607198f1d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-12T21:40:32'
);


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
    '4de12454-333a-48ee-b678-f6cc301cbe32',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-11T16:27:58'
);


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
    '8dbb88f5-4d75-4f4d-bf13-9b135d36ea24',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-11T08:59:58'
);


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
    'd60a6e4f-f428-4a0c-9ca2-d17cdf9e846f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-11T21:40:13'
);


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
    '70c46114-e7da-48e6-a536-b5e80b624386',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'French Fries 19',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-11T19:35:17'
);


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
    'c050f626-30f8-4fee-9480-b4e7852f35ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-11T18:16:48'
);


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
    '169344d1-71eb-4987-98e4-4016dc3ad176',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'Mineral Water',
    2,
    8000,
    16000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-11T11:29:38'
);


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
    '6144e429-6163-4ae0-b1b3-96c40d5ab17b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-11T17:30:00'
);


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
    '50245b13-ce39-43be-bee6-ef7ac2e565cb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    18700,
    56100,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-11T08:57:53'
);


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
    '2c5fecb9-f17a-4728-a55b-9b9ea12c816f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-11T13:24:11'
);


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
    '7dfca12f-8121-489d-bc4e-2a79fb88f3a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-10T18:58:45'
);


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
    '9a086028-4e4e-4957-8af2-da18528d5fce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    28050,
    28050,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-10T11:31:23'
);


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
    'c5c5c096-5a40-4031-9b4b-aff61311a25d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-10T08:12:52'
);


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
    '13686158-1b3e-4784-b895-f6a7b490df2b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    1,
    22000,
    22000,
    'credit_card',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-10T15:10:35'
);


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
    '62c53317-5b85-4224-b2aa-31ac65307aaf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    26600,
    26600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-10T12:59:36'
);


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
    'c32ef927-8373-4c1e-8cbb-330f49f0f3c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-10T17:16:43'
);


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
    'cbe961b1-268c-483d-bac8-389ee9e254b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-10T15:23:33'
);


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
    '7da96e26-957d-4461-b7c2-5ff5ae3acae8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    1,
    34000,
    34000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-10T17:51:01'
);


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
    'f6ad1458-a6f2-42af-a0d0-8d22428fd29e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-10T10:21:19'
);


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
    'd43c873b-f218-4f70-87e6-e44eb6539673',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-04-10T20:40:59'
);


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
    '6a5b0700-4c89-4714-8aa7-3d88b3b4910d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-10T13:53:03'
);


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
    '9d4701cb-8a0d-4d28-97c5-42cd19095155',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    26600,
    26600,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-09T13:56:54'
);


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
    'fe27377f-37a5-4488-b48f-af02e8095584',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-09T08:18:54'
);


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
    'e30009d0-a005-4890-aefc-bd508420de46',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    34200,
    136800,
    'cash',
    'refunded',
    'Refund processed.',
    '2026-04-09T20:42:39'
);


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
    '7df2ed76-c830-4137-805b-64c130c4d759',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Chicken Sandwich 26',
    4,
    38000,
    152000,
    'credit_card',
    'refunded',
    'Refund processed.',
    '2026-04-09T09:21:41'
);


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
    '696d2500-0008-48d2-8b98-8a213b6a3f8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'Cappuccino',
    2,
    32000,
    64000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-09T09:06:00'
);


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
    '280ec3d4-40b1-48cf-9a89-84f9066481bc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'Brownies 40',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-09T14:30:46'
);


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
    'e9ea0228-bbb0-4aa8-8b18-8eecd26aee08',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    1,
    32000,
    32000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-09T10:19:37'
);


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
    '72fe79e7-3d35-4af0-b513-3a5ac2b13eb6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'French Fries 20',
    3,
    22000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T15:19:38'
);


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
    '11c820eb-bd6c-4680-9910-d8dec61d36f1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'Mocha 23',
    2,
    34000,
    68000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-08T17:42:43'
);


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
    '47fca3c9-aa27-4677-a720-36133007ac99',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-08T14:22:12'
);


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
    'c1590cd0-8d4f-4571-850a-1e80442b5ce0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Brownies',
    1,
    28000,
    28000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-08T18:30:44'
);


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
    'a4f2be54-c027-4f1c-8ca5-1e1e0d2aadb9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8612e492-0639-48ce-8cb2-15f8d7b48d0b',
    'Latte 33',
    2,
    30000,
    60000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-08T17:19:26'
);


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
    'a83e0e61-a9b9-4863-aac3-8aa6ecc43e14',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T11:58:00'
);


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
    '434088a0-d980-49ca-87c1-5c771d1286c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T15:47:49'
);


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
    'cdb70016-3c2f-4c61-bff8-ab17c9148123',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Matcha Latte 22',
    2,
    33000,
    66000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T13:00:04'
);


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
    '106aa075-4646-41b0-9a3f-a18687cc8808',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T15:12:40'
);


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
    '8e1240da-2d1d-4b23-a76c-221a043de2ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Matcha Latte 24',
    1,
    33000,
    33000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T12:11:14'
);


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
    'd0b6a4cd-c4f9-4f7c-8902-8718fd8b5140',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Mocha',
    1,
    34000,
    34000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-08T10:12:01'
);


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
    '60083fed-244d-45ff-926a-2f77bfb8a99c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-08T14:41:50'
);


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
    'f03d4bb8-822c-463e-9e3b-941e58b83453',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'Es Kopi Susu',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-08T11:23:51'
);


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
    'a5d1a4c5-f64a-4876-824b-b5d589cbf78a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    1,
    28000,
    28000,
    'cash',
    'cancelled',
    'Cancelled by customer.',
    '2026-04-08T14:44:23'
);


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
    '6b7e0734-3b03-4d30-877f-8e023feb6c86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Es Kopi Susu 9',
    2,
    28000,
    56000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-07T21:32:37'
);


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
    'db20c823-6259-410c-a560-60813cd619e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'French Fries 34',
    1,
    22000,
    22000,
    'transfer',
    'refunded',
    'Refund processed.',
    '2026-04-07T09:10:32'
);


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
    '775dc279-3a4f-4210-a3c3-bc3a1d3b363c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'French Fries 27',
    3,
    22000,
    66000,
    'qris',
    'completed',
    'Completed successfully.',
    '2026-04-07T16:29:11'
);


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
    '69eaa350-8ec6-41d8-9411-ca45df7a49fc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Mocha 21',
    2,
    34000,
    68000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-07T15:17:37'
);


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
    '5b495498-f260-4173-8b48-09506bff19d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'Brownies 28',
    1,
    28000,
    28000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-07T21:15:25'
);


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
    '25c643eb-c101-47d1-97de-f47d264a01d5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Americano 13',
    2,
    22000,
    44000,
    'qris',
    'refunded',
    'Refund processed.',
    '2026-04-07T10:59:53'
);


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
    'fcf08720-6e37-4a3c-89b5-d3a9ef03a914',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'French Fries 38',
    1,
    22000,
    22000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-07T15:33:22'
);


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
    '5eac33ad-4539-4c93-8b93-ddb8ef1b87ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Chicken Sandwich',
    1,
    38000,
    38000,
    'credit_card',
    'completed',
    'Completed successfully.',
    '2026-04-07T14:28:29'
);


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
    '95d8b7eb-bfa0-4649-9a81-c9d90708fc09',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Cappuccino 31',
    2,
    32000,
    64000,
    'transfer',
    'completed',
    'Completed successfully.',
    '2026-04-07T12:24:01'
);


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
    '2a00fd07-74c5-4f8f-ab74-0c14174083b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'Donut 10',
    2,
    15000,
    30000,
    'cash',
    'completed',
    'Completed successfully.',
    '2026-04-07T09:18:53'
);


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
    '01ab1749-16be-4b5a-918a-42e89417d7da',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Facebook',
    'Create Instagram caption',
    'Nikmati Espresso 18 hanya Rp18,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-06-26T14:34:15.322157'
);


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
    'df4b8c81-aa35-41c5-87d4-182c76fba93e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '61952f31-782c-4720-a1c4-9a8cbcd5ddce',
    'Instagram',
    'Create product advertisement',
    'Nikmati Matcha Latte 24 hanya Rp33,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-24T14:34:15.322206'
);


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
    '4b6f5069-ac13-4b48-9adb-2d030b6a3c4c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'TikTok',
    'Create TikTok campaign',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-04-09T14:34:15.322238'
);


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
    'c101a192-068c-4268-83b1-c671469252f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Facebook',
    'Promote today''s best seller',
    'Nikmati Espresso 18 hanya Rp18,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-18T14:34:15.322263'
);


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
    '275e83ab-7ee7-4e8b-8ab7-777852e37e76',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'TikTok',
    'Create Instagram caption',
    'Nikmati Chocolate 35 hanya Rp30,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-30T14:34:15.322286'
);


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
    '6aaa734e-c336-41ea-a34a-c0713b7912e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8840a5a7-5fa7-4cee-aea1-bb5a5b2baef1',
    'WhatsApp',
    'Create WhatsApp broadcast',
    'Nikmati Mocha 23 hanya Rp34,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-13T14:34:15.322315'
);


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
    'fb919a10-a8e0-4152-b364-72d7f31aaaeb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d8a9bb3-d22c-4971-b808-7ff03c698ad8',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Latte hanya Rp30,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-16T14:34:15.322338'
);


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
    '6b7c6cb2-8816-4b03-9c71-ea0eea3ff939',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Facebook',
    'Create Facebook promotion',
    'Nikmati Chicken Sandwich 26 hanya Rp38,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-09T14:34:15.322358'
);


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
    'e929f311-1a1b-4f2a-9517-76cfbb621980',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Facebook',
    'Create product advertisement',
    'Nikmati Cappuccino 31 hanya Rp32,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-26T14:34:15.322378'
);


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
    'a6e55498-a925-4a6c-8790-5e99090f388c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'WhatsApp',
    'Create TikTok campaign',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-26T14:34:15.322402'
);


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
    'd06e35f2-c941-4672-84d9-959920259d0e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-06-09T14:34:15.322422'
);


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
    'b8809f45-7827-44c2-b5fd-909e6656af86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'WhatsApp',
    'Create product advertisement',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-19T14:34:15.322441'
);


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
    'aeed54d8-ab9c-4623-81da-791667b44bd4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Facebook',
    'Create TikTok campaign',
    'Nikmati Es Kopi Susu 9 hanya Rp28,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-07-04T14:34:15.322460'
);


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
    'b541524e-ea0c-4f4f-98b7-26e23a314dd4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'TikTok',
    'Create TikTok campaign',
    'Nikmati Mineral Water hanya Rp8,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-13T14:34:15.322478'
);


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
    '408a3554-ee83-448e-bdf7-a868606f5f0f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Brownies 28 hanya Rp28,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-05-28T14:34:15.322496'
);


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
    '98c98667-fc9b-41f1-b565-87e84ad36fd6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Instagram',
    'Create product advertisement',
    'Nikmati Mocha 21 hanya Rp34,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-06-18T14:34:15.322540'
);


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
    '3a689997-bc7b-4a04-ac04-458a848c9400',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '64fb833d-51a6-41ed-8aee-06c19059773c',
    'TikTok',
    'Create product advertisement',
    'Nikmati Donut 10 hanya Rp15,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-04-19T14:34:15.322568'
);


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
    '835bfe4e-481c-42fa-8294-3e9e912348de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d4e32cf-4c6b-46ca-9a8e-296a56e35ea6',
    'WhatsApp',
    'Create WhatsApp broadcast',
    'Nikmati Croissant 39 hanya Rp25,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-16T14:34:15.322589'
);


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
    '2fda290c-efcc-495a-8582-e85543da6607',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'WhatsApp',
    'Create Facebook promotion',
    'Nikmati Donut hanya Rp15,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-06-22T14:34:15.322610'
);


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
    '95acbae8-fe43-4631-be55-0e015b46f359',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Matcha Latte 22 hanya Rp33,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-06-24T14:34:15.322639'
);


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
    'dfc29c78-c842-4ddc-85b5-010b68677953',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Matcha Latte hanya Rp33,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-13T14:34:15.322664'
);


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
    '8c50289c-27c3-4cdb-b866-beacdb71e580',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Americano hanya Rp22,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-10T14:34:15.322688'
);


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
    '10b07629-a422-40d6-8b1f-fe9e131eaccc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'WhatsApp',
    'Create TikTok campaign',
    'Nikmati Donut hanya Rp15,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-06T14:34:15.322713'
);


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
    '430f7395-02e7-4768-b95b-319e3de3e13c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'Instagram',
    'Create WhatsApp broadcast',
    'Nikmati French Fries 19 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-19T14:34:15.322741'
);


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
    '912a51c2-5552-444b-a2f1-9b516e75069d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'Instagram',
    'Create Facebook promotion',
    'Nikmati French Fries 34 hanya Rp22,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-14T14:34:15.322775'
);


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
    'a8149a12-d97a-45fe-a31b-c66ac2df594e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Facebook',
    'Create Instagram caption',
    'Nikmati Chicken Sandwich 26 hanya Rp38,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-04-28T14:34:15.322797'
);


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
    '643814b6-6c67-4bdc-9ca7-f59d985a92f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati French Fries 27 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-17T14:34:15.322820'
);


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
    '82bd45e3-e693-4d73-a25e-14e33b0346f2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Facebook',
    'Create Facebook promotion',
    'Nikmati Chicken Sandwich hanya Rp38,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-11T14:34:15.322844'
);


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
    '4b2a83d7-e6ac-4941-9ee4-065292fba55e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Facebook',
    'Create product advertisement',
    'Nikmati Cappuccino 31 hanya Rp32,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-05-27T14:34:15.322862'
);


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
    'e4553141-894e-474e-b7a0-092395135cc8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'Facebook',
    'Create product advertisement',
    'Nikmati French Fries 38 hanya Rp22,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-04-09T14:34:15.322880'
);


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
    '34e1f423-d054-4066-a663-bf1f5cddb2ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-06-17T14:34:15.322899'
);


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
    '961b300f-c319-4189-a4c7-72b9cbf0be7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Instagram',
    'Create WhatsApp broadcast',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-04T14:34:15.322917'
);


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
    '32fa68bb-62fc-4e22-be18-10f0120ad64a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bb20563-4bf5-4b07-be57-3269dac031aa',
    'TikTok',
    'Create product advertisement',
    'Nikmati French Fries 34 hanya Rp22,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-05-08T14:34:15.322945'
);


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
    '8b0e5028-6bf6-4e29-8165-fd0806f5c403',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-30T14:34:15.322965'
);


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
    'd99c497c-654e-4f98-994c-f37e40ac01fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'TikTok',
    'Promote today''s best seller',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-28T14:34:15.322984'
);


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
    '94de193e-d004-49ed-9b68-3506b0dd98f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'Facebook',
    'Create WhatsApp broadcast',
    'Nikmati Chicken Sandwich 26 hanya Rp38,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-13T14:34:15.323004'
);


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
    'a2fe3b54-ea99-4541-a5be-2b6b5c9a9f9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'WhatsApp',
    'Create WhatsApp broadcast',
    'Nikmati Brownies 40 hanya Rp28,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-04-12T14:34:15.323022'
);


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
    'ed2ec005-4e8a-46e3-b85c-7c8dabe65779',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'Instagram',
    'Create WhatsApp broadcast',
    'Nikmati Brownies hanya Rp28,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-30T14:34:15.323041'
);


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
    '11b26ce6-4973-4f1d-8deb-2abf9fd4404a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Facebook',
    'Create TikTok campaign',
    'Nikmati Mocha hanya Rp34,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-04-28T14:34:15.323060'
);


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
    'e3712425-6e34-47bb-ac23-13db19a980cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati French Fries 19 hanya Rp22,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-08T14:34:15.323078'
);


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
    'fd7aff99-940c-405f-9d02-cedc3dfcaf38',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'WhatsApp',
    'Create product advertisement',
    'Nikmati Mineral Water hanya Rp8,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-19T14:34:15.323097'
);


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
    '073874bc-99a2-4b1f-8156-aa4fc2f6d209',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'Instagram',
    'Create product advertisement',
    'Nikmati Donut hanya Rp15,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-14T14:34:15.323116'
);


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
    '0331f4f3-8f21-4a32-8c91-ceb79fa0ac1e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Facebook',
    'Create TikTok campaign',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-02T14:34:15.323136'
);


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
    '56404513-8d41-4a96-adf2-a2280500608e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Americano hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-15T14:34:15.323155'
);


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
    'de9d419c-bbc8-4463-abc9-327fc2f1cd1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'WhatsApp',
    'Create TikTok campaign',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-15T14:34:15.323179'
);


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
    '95c1bdd7-c2b2-488e-946e-5f5a7d2a79c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-06-03T14:34:15.323199'
);


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
    '366883d6-db5e-499a-b472-62b2005c52dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    'Facebook',
    'Create TikTok campaign',
    'Nikmati French Fries hanya Rp22,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-07T14:34:15.323217'
);


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
    '34eef284-efe1-43a5-b158-20fa550306bb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Mineral Water hanya Rp8,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-26T14:34:15.323236'
);


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
    'f7fe61fa-190c-4097-83e0-c3844c17b3c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'WhatsApp',
    'Create Facebook promotion',
    'Nikmati Mocha hanya Rp34,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-05-31T14:34:15.323256'
);


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
    'cf070b06-d22f-4ee5-bf5c-e0bf9fb5b62a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Facebook',
    'Create Instagram caption',
    'Nikmati Matcha Latte hanya Rp33,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-23T14:34:15.323274'
);


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
    'ce527c49-5beb-4bdf-bc2e-c0f1a7e7f3ad',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '829eec5a-dbfb-4b8c-aee6-6dbe922935e7',
    'TikTok',
    'Create Instagram caption',
    'Nikmati Brownies hanya Rp28,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-05-16T14:34:15.323293'
);


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
    'ef6a4161-3e23-4653-bc86-c88480456ffa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Matcha Latte hanya Rp33,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-10T14:34:15.323312'
);


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
    '16c11d6b-03f4-4260-829e-889951fd866f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '05857a1f-39ad-4970-95a7-8fb01d91e657',
    'Facebook',
    'Create WhatsApp broadcast',
    'Nikmati Espresso 18 hanya Rp18,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-06-13T14:34:15.323330'
);


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
    '5eba1cff-dc30-4d26-98d7-8e19e93d5982',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Chicken Sandwich hanya Rp38,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-08T14:34:15.323357'
);


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
    '987568b8-9f11-4ff1-9587-4ba67fb97f45',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-14T14:34:15.323377'
);


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
    '21d1ede9-cbb6-4fcc-9cc3-be2142799de5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Es Kopi Susu hanya Rp28,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-10T14:34:15.323396'
);


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
    '7d4335e0-e9b4-46f4-b3ab-9428e60c126e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fea6fd6-3435-42f6-ba06-673656ec8f32',
    'Instagram',
    'Create Instagram caption',
    'Nikmati Croissant hanya Rp25,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-06-10T14:34:15.323415'
);


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
    'bb3986ab-69ab-4d43-ab5a-36f696361ea3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Mocha hanya Rp34,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-24T14:34:15.323433'
);


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
    '5ba514a3-50d3-462d-8725-689006e280b5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3bec6f69-ff71-4604-ae52-e69ac39537a6',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Cappuccino hanya Rp32,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-23T14:34:15.323453'
);


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
    '83161f46-0e53-4b95-b0f1-93c7d2f3f252',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Instagram',
    'Create Facebook promotion',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-11T14:34:15.323472'
);


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
    '05ddf8a8-b7e0-454b-b846-58232add0389',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '38efc317-230b-4476-b375-582f84f58917',
    'Facebook',
    'Create Instagram caption',
    'Nikmati Matcha Latte hanya Rp33,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-05-01T14:34:15.323491'
);


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
    '134a05c8-60fd-4d77-a0be-7d346c14195e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c2e8dba2-2351-48f9-bb87-624cf7443217',
    'TikTok',
    'Create TikTok campaign',
    'Nikmati Es Kopi Susu hanya Rp28,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-16T14:34:15.323510'
);


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
    'be180c05-79a3-4b90-a059-b10b12c7065b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Facebook',
    'Create product advertisement',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-05-12T14:34:15.323559'
);


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
    '1b8847d8-c75c-494d-aa78-7b26979a7512',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    'Facebook',
    'Create Facebook promotion',
    'Nikmati French Fries hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-21T14:34:15.323583'
);


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
    'fb692c01-5a12-478e-bcd5-a3b50d21d4c6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Facebook',
    'Create Instagram caption',
    'Nikmati Mocha 21 hanya Rp34,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-04-13T14:34:15.323603'
);


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
    '9e0c738b-7fec-41cf-8bc3-f97b6e87681f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'Instagram',
    'Create WhatsApp broadcast',
    'Nikmati Mocha 21 hanya Rp34,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-08T14:34:15.323627'
);


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
    '169e1393-eca5-4097-8d97-1517a09c3372',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Chocolate hanya Rp30,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-04-13T14:34:15.323648'
);


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
    'c6ed59f0-6a01-4105-a808-d812984efae5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2223afb1-c356-4d2d-9707-2e4fd9311543',
    'TikTok',
    'Create Instagram caption',
    'Nikmati Brownies 40 hanya Rp28,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-06-08T14:34:15.323667'
);


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
    '75aec757-0324-4975-bc6a-9171fe3433de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7449abfe-0874-44f6-ab13-0cbb797d7283',
    'TikTok',
    'Create product advertisement',
    'Nikmati French Fries 27 hanya Rp22,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-06-22T14:34:15.323687'
);


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
    '38f90b15-5ee6-4a21-921b-428c04bbfd33',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Facebook',
    'Create TikTok campaign',
    'Nikmati Chocolate 35 hanya Rp30,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-20T14:34:15.323706'
);


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
    'b7c3fa45-1e28-4de2-b785-3ec4b837e5c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fc566e4a-a501-4319-8a03-cc5865564a9b',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Mocha 21 hanya Rp34,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-18T14:34:15.323726'
);


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
    '2e736988-8cd9-43fa-838f-b3669a2aa3ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '587183bc-3c09-4049-88f6-1441c4b8926b',
    'Facebook',
    'Promote today''s best seller',
    'Nikmati Matcha Latte 22 hanya Rp33,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-26T14:34:15.323745'
);


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
    '798544b7-1350-4400-a91c-19144c7142bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aaa6985a-f982-45f9-b46f-0bc35f3d3e50',
    'Instagram',
    'Create TikTok campaign',
    'Nikmati Cappuccino 31 hanya Rp32,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-19T14:34:15.323764'
);


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
    'b8bd9b67-4495-40ed-bb06-1a72215da642',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48d50229-811a-454e-86ae-68a1e87ab30d',
    'WhatsApp',
    'Create WhatsApp broadcast',
    'Nikmati French Fries 38 hanya Rp22,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-15T14:34:15.323783'
);


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
    '11967015-ba52-4e8b-b119-1a150b44104f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'Instagram',
    'Create Facebook promotion',
    'Nikmati Chocolate hanya Rp30,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-04-18T14:34:15.323806'
);


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
    'f3c6ac20-31d8-45ca-8e05-07dd23832e4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8656c02c-32c7-4f95-b6cc-67508ccfae44',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati French Fries hanya Rp22,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-12T14:34:15.323826'
);


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
    'c6e1dd3e-dee2-422f-a67c-7d8373dca235',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'Instagram',
    'Create Instagram caption',
    'Nikmati Mocha hanya Rp34,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-19T14:34:15.323846'
);


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
    '56d881f5-d9a8-4de0-9b31-7270dcb40082',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f0f5ba1-27a2-4acc-b8ae-159edf8422dd',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Mineral Water hanya Rp8,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-05-18T14:34:15.323866'
);


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
    '7a25debc-3bf1-4774-a747-1ae6704bf2a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Instagram',
    'Create Facebook promotion',
    'Nikmati Chicken Sandwich hanya Rp38,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-04-20T14:34:15.323885'
);


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
    'afd28e4e-abf1-4599-8ace-6b1b4940836d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-26T14:34:15.323904'
);


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
    '7cb9bfe6-0788-46fd-ab36-a2f5358f7cc4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b497dc68-e8aa-4065-957e-dfb7afab6820',
    'WhatsApp',
    'Promote today''s best seller',
    'Nikmati Americano hanya Rp22,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-07-02T14:34:15.323924'
);


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
    'f3964e12-dc83-4942-a743-5744e8923d0c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'TikTok',
    'Create TikTok campaign',
    'Nikmati Chocolate hanya Rp30,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-09T14:34:15.323947'
);


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
    '58b80974-cf88-4eca-b518-29c267459577',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Chocolate 35 hanya Rp30,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-04-09T14:34:15.323967'
);


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
    '9b331a71-8d85-4c5c-bec7-eb2431431b99',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '58ff245d-1656-4f16-b086-dd2abda56bbc',
    'WhatsApp',
    'Create product advertisement',
    'Nikmati Chocolate hanya Rp30,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-06-12T14:34:15.323987'
);


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
    '3567487c-e2c3-4446-a55f-98ddb2bc254a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '972f5405-721f-487d-ab7d-578d96b2671e',
    'Instagram',
    'Create Instagram caption',
    'Nikmati Chicken Sandwich 29 hanya Rp38,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-06-27T14:34:15.324006'
);


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
    '14064217-f2b5-4957-9ee6-92e66ab51864',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Instagram',
    'Promote today''s best seller',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#coffeeshop #bandung',
    '2026-06-09T14:34:15.324025'
);


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
    '9bcd9c86-ce27-427c-86bf-9e1a2560a50c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0f10076f-20a5-4fb1-b241-bde8aa84feed',
    'Instagram',
    'Create Facebook promotion',
    'Nikmati Es Kopi Susu 9 hanya Rp28,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-04-26T14:34:15.324044'
);


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
    '63e97fd3-190b-45b9-89a3-da581415df67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4a676045-ee7c-48ed-bec0-7b6a39b02a87',
    'Facebook',
    'Create product advertisement',
    'Nikmati Chicken Sandwich hanya Rp38,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-12T14:34:15.324063'
);


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
    'f4a1fc16-ba8c-4709-91e3-f30b81921b40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c544d6dc-d8ae-4233-a343-bd723dba5946',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Croissant 30 hanya Rp25,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-10T14:34:15.324086'
);


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
    'be8cd7e7-1e86-43db-b0af-1b110a267b43',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '228f49dd-72de-4132-96ea-c421fe6bfd03',
    'WhatsApp',
    'Create Facebook promotion',
    'Nikmati Mocha hanya Rp34,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-06-04T14:34:15.324106'
);


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
    '1626a0d2-7ede-4299-a6a9-2d838646ac92',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a822945-f5ac-4db7-915f-b8a01e0228e9',
    'TikTok',
    'Create product advertisement',
    'Nikmati French Fries 20 hanya Rp22,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-04-15T14:34:15.324125'
);


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
    '3f85b665-f297-4c59-9442-62b83d5b5ca0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'TikTok',
    'Create WhatsApp broadcast',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-05-20T14:34:15.324144'
);


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
    'c275f72f-ea0c-4269-af16-200e9caee8b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b24e757-6b47-4ac3-b396-e4731aba823d',
    'WhatsApp',
    'Create Facebook promotion',
    'Nikmati Chicken Sandwich 26 hanya Rp38,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-05-10T14:34:15.324163'
);


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
    '3543ec71-c841-42f2-b973-08b575333e27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6401ec8f-42be-4c6f-b61c-87efa8d1b11b',
    'WhatsApp',
    'Create Facebook promotion',
    'Nikmati Brownies 28 hanya Rp28,000. Tersedia hari ini!',
    '#localbusiness',
    '2026-07-03T14:34:15.324182'
);


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
    'd8840ec5-32a3-4593-a9c9-fa3cbb99c84c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3fa5a1f-ace5-40d4-ab57-eea46d289ab9',
    'WhatsApp',
    'Create Instagram caption',
    'Nikmati Cappuccino 25 hanya Rp32,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-04-20T14:34:15.324201'
);


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
    '27bbb124-ab06-46b5-9dcf-55201872b33a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14b6c975-d05a-4a02-bd6a-2f10b14164fe',
    'Facebook',
    'Create product advertisement',
    'Nikmati Chocolate 35 hanya Rp30,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-06-13T14:34:15.324220'
);


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
    'd77b1ca8-589b-4d8d-824d-449ee965feca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06be25cd-93c3-4805-9119-86738ea795fb',
    'WhatsApp',
    'Create WhatsApp broadcast',
    'Nikmati Cappuccino 17 hanya Rp32,000. Tersedia hari ini!',
    '#kuliner #kopi',
    '2026-05-08T14:34:15.324240'
);


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
    'b3c209bf-eb8a-489b-9efa-ab7a2a9adbab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71422b10-f290-4615-9db0-cbe34c1cd545',
    'WhatsApp',
    'Create product advertisement',
    'Nikmati French Fries 19 hanya Rp22,000. Tersedia hari ini!',
    '#freshcoffee',
    '2026-05-05T14:34:15.324259'
);


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
    '5f2473d8-1b2d-4757-9a62-db07cfe2bb43',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8130dd08-67aa-4475-8695-9fd1a5856e7d',
    'TikTok',
    'Create Facebook promotion',
    'Nikmati Donut hanya Rp15,000. Tersedia hari ini!',
    '#viralcoffee',
    '2026-05-06T14:34:15.324278'
);


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
    '126fa14d-6a2a-4d5c-a392-db73783d8a6e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b232c4ea-7f11-45a7-9e3a-ce465d7ecfc0',
    'Facebook',
    'Create Facebook promotion',
    'Nikmati Americano 13 hanya Rp22,000. Tersedia hari ini!',
    '#coffee #umkm',
    '2026-07-04T14:34:15.324303'
);


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
    'd35cd4e5-d5c4-46ab-8c5a-c64a5e32e099',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '047be399-673d-4920-81fc-4c39be309f7e',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '48fedff2-0260-455d-b59d-720f8796380a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '047be399-673d-4920-81fc-4c39be309f7e',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '823e065a-8f8c-4b68-a9a1-dace8f82673e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4cda8938-9735-439b-9bec-8a85fe8bf60a',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'c5b79bb3-6155-4ff5-9ab4-7f10010e4aa3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4cda8938-9735-439b-9bec-8a85fe8bf60a',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '1fe76d21-d9a8-4115-9ff5-25cf574c9f59',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f65c1a43-bad0-42ae-abed-d1ca54f1377b',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'bd53bb95-8e16-403a-8461-6dcabf480b20',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f65c1a43-bad0-42ae-abed-d1ca54f1377b',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '9fb7b4ca-5f56-4bb3-bda7-dd96e25ea67c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af7b73a8-88af-424e-9ee5-14c3d55c1b63',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '496d1d03-15e0-4a35-a433-8130f1ea6b8d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af7b73a8-88af-424e-9ee5-14c3d55c1b63',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '25f3a8c0-017b-4caf-b1d7-1e0dbfee1418',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85a1608e-8067-4e78-b6ec-535e85f63c83',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'e8cdf45a-6edf-4424-9780-77a941f941c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85a1608e-8067-4e78-b6ec-535e85f63c83',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'e4b316e3-fbc4-4f1a-9aa4-c33e22ab435c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '313f25fc-03ed-47de-b058-f70f3f4e4026',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'a916358f-7eb4-4bfa-90d4-fec6a91493ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '313f25fc-03ed-47de-b058-f70f3f4e4026',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'f60072c7-4e96-44de-a15c-7030b7961e48',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '73ce4f11-676b-424c-a96b-c4e7baa2212b',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'c3307b51-7621-4182-ade8-3b99d2fd9b32',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '73ce4f11-676b-424c-a96b-c4e7baa2212b',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'f6992f62-98cb-4ec7-a574-fcb68c327efe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '183ee0a8-0075-45d6-b276-c256d4c10f88',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '274e6db5-11dc-4d42-9a72-2a75f1394336',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '183ee0a8-0075-45d6-b276-c256d4c10f88',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'b8cc07ff-fd7a-448a-8964-aecd75fb4af0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40ca29ec-0916-4a3b-a2e8-624e4ded3a0e',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '90e7eda5-04df-45d8-822c-4bfc8dd95c35',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40ca29ec-0916-4a3b-a2e8-624e4ded3a0e',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '958521f8-f098-47a7-bb4d-bb0e25b2c860',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2eba9cbb-3bcd-4108-b746-5c4bee485762',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'ece1c783-1ad6-4774-bb94-5df8b8ca8e70',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2eba9cbb-3bcd-4108-b746-5c4bee485762',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c5cef69a-29c2-46ee-8e5c-e48e8df232fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5f5590e4-921e-49b2-bc61-3166d46e200d',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'bdf24be2-2300-4e9b-a678-d4c4fe04204e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5f5590e4-921e-49b2-bc61-3166d46e200d',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '92dffde5-fb7c-462f-ac6a-13d1fdff37c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '16f628be-bf56-4c52-863c-3819c6af410f',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'b745c1b1-62d4-475c-91b8-1c2e6fa774f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '16f628be-bf56-4c52-863c-3819c6af410f',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '7ee9c19b-36c5-4773-a073-0941f6850b5a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1fbcd3bb-44ac-4c79-b2c0-9e31f01fee86',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'ac55199b-b250-47a0-85b6-be1bad9be669',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1fbcd3bb-44ac-4c79-b2c0-9e31f01fee86',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '45e27ef0-29a9-4a7f-9267-92440536ab67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '01e7f0e3-1887-4612-8877-54382a134519',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '0f51d477-8894-4a2e-8068-236da440310e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '01e7f0e3-1887-4612-8877-54382a134519',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '45961176-ce63-4b9c-8cf0-c2a1231fd3ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9a1f2ddc-f3b5-492d-b07c-0d8c51a78ff2',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '6a9e9be1-ca19-4e35-9f1a-b56cae1a1ac9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9a1f2ddc-f3b5-492d-b07c-0d8c51a78ff2',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '2dcbe609-f74e-40c3-92e2-5d2b645c593a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5e88e903-1fbe-4f04-8aa3-1611f8c38b63',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '0f667316-e51b-456a-85e7-ba306b5ad489',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5e88e903-1fbe-4f04-8aa3-1611f8c38b63',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'fc1af8be-3d10-4fbd-ba1c-249aadcb534e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6800bfad-110a-4ad3-9a66-54fb732f8d09',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'd2823e02-c5fb-439f-9f07-e6989af1dd20',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6800bfad-110a-4ad3-9a66-54fb732f8d09',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'eade4509-1cce-4da8-b94a-a32092b6780a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b363c0f7-3586-40d2-9c94-e1a062b8aa9c',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'c60859f7-bf0e-4d5c-bf3b-db73b48a08f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b363c0f7-3586-40d2-9c94-e1a062b8aa9c',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '3aee92db-4307-4257-8903-f11fc49c8315',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '24c6c625-8909-4914-a921-201bc31fbbb7',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '4cfaf35f-6217-43c6-80ee-0f36179a890b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '24c6c625-8909-4914-a921-201bc31fbbb7',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '9b532ec3-7558-4284-81ed-3752a7b16503',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eedcb703-cb29-4a75-8111-9751cb9ab602',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'b4759910-e74a-4285-907d-4f79f4f47d02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eedcb703-cb29-4a75-8111-9751cb9ab602',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '8553b1c6-703d-46ff-9ccb-bd3afb2c91ed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '36634aae-76db-4903-96f1-d4539d80e1cc',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '0c65719e-5297-425a-b814-42050b7b6996',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '36634aae-76db-4903-96f1-d4539d80e1cc',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '52c44db3-71a3-4f2d-8036-0750c549e302',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd18df0df-afd6-4d29-bb92-e9a7265b6df6',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '2e7fbd1a-8e25-46fa-8fc0-df69cb7fe4a4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd18df0df-afd6-4d29-bb92-e9a7265b6df6',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c5d0934e-bba5-4c61-8180-2d9a8ec0d0da',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab12dd26-69b0-4638-94fb-eefeaee5fade',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '745f4073-91dd-4971-bda9-62e9f74bb139',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab12dd26-69b0-4638-94fb-eefeaee5fade',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'bca056d6-5b17-4c4b-bc49-8f46d68fa192',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '72d0812e-74c7-4ca9-b2fb-271abbf0c47d',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'adb9166e-0108-475b-8249-a1d887ac99e0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '72d0812e-74c7-4ca9-b2fb-271abbf0c47d',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'a79fb896-5bf2-4c66-9c3b-a984acb4c706',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b94bca23-783d-43db-bf4a-7b449675ce88',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '5fae00d8-cec1-4c04-b565-e8bfb2e87cbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b94bca23-783d-43db-bf4a-7b449675ce88',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '16d250df-dcac-4b3c-ae50-bc3363ec56cd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20a7b570-519a-4745-b365-45ab08e6b21d',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'c22c211f-6de5-480f-840d-4c6ca2e2793a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20a7b570-519a-4745-b365-45ab08e6b21d',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'b554eae4-badb-4343-bfe6-a72912a79c61',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d45f10c-976e-41b0-942c-421e534f6cc2',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '3406b91d-933d-4d58-906d-08a94ce31f01',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d45f10c-976e-41b0-942c-421e534f6cc2',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'aec68990-f833-48ca-9be8-a4c6e6bdf190',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '96e9cd52-ef14-498f-ba72-a28caea469be',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '7e3a743e-0402-47a4-8b54-bb1d93703e36',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '96e9cd52-ef14-498f-ba72-a28caea469be',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'f0e5198c-a113-495d-8499-fa937ad1f631',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f291e0d7-d739-495d-a6dd-fbdad408c205',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '7af1a6d0-2c7e-4162-bea4-64d5a98b1cca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f291e0d7-d739-495d-a6dd-fbdad408c205',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'aeb09804-5062-4106-a97e-c44a1997786a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf57d9d7-a8b3-413a-9fb1-6475f34e52ae',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '9c03f97d-baa6-4e8e-96e7-b7a63f4bb4fd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf57d9d7-a8b3-413a-9fb1-6475f34e52ae',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '72e74cb5-f506-4cec-a12e-b348a8cac396',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f22d46e-912a-482e-a897-a17ecb7e04f8',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'f1be28b3-f7fb-4951-a073-169d530aacb0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f22d46e-912a-482e-a897-a17ecb7e04f8',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'c117c424-5dc5-41eb-ae41-044ac42f98e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '00ef6176-bf3a-48dd-9c42-52832f370a70',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '18891703-bf8b-47d0-beb6-10d9cc5edc60',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '00ef6176-bf3a-48dd-9c42-52832f370a70',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'fb2d1866-9750-4b85-a417-b8f0e6cb0099',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b062aa56-cb8d-4dc9-ab27-9038c487cdbb',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'e5cc8bfc-88d6-4b88-9d5d-77959e1e129f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b062aa56-cb8d-4dc9-ab27-9038c487cdbb',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7d6fe990-3719-4e36-9d37-2562f1bc64b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40c5fa08-5b85-4f76-a8dd-f8a777a83dee',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'ec484ec4-c10d-4b2c-9534-d3ddb233e707',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40c5fa08-5b85-4f76-a8dd-f8a777a83dee',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '8e8d9e2f-a92e-4446-a06d-eaa3b0d932b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9bd88439-c609-47a8-bdd7-48cfa16f9a28',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '9b1beef6-45dc-4b30-83a4-1554c0326585',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9bd88439-c609-47a8-bdd7-48cfa16f9a28',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '187a7c5c-2e6f-45e3-b52d-c1307e6c6b8d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cd9ed29-522a-4dc1-8692-ce91be20ad1c',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'd6573f01-620b-437a-b609-e8c67b1256f2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cd9ed29-522a-4dc1-8692-ce91be20ad1c',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '51a7983e-0e1f-4f4b-b5a4-0c5cb9235725',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '784fc5f3-8b48-4f7e-9962-f77d629027c7',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '5d6ebe99-dfd4-41cb-a737-878d52c1d4a2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '784fc5f3-8b48-4f7e-9962-f77d629027c7',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '01004c72-a771-42df-91b8-d873ea097218',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a064cc52-61fa-455d-a5ed-51f4575d8edc',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '444a0baa-c1a3-4fb7-8ffd-43ad020192ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a064cc52-61fa-455d-a5ed-51f4575d8edc',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'c8b4541e-25bd-402c-9dd8-2e501ad68566',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd923bce8-fc31-4615-84a9-314bf4f8b6b9',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'a56f47e5-a451-4f44-ab9b-25a033210440',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd923bce8-fc31-4615-84a9-314bf4f8b6b9',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '168b3552-7806-448b-ad4e-0c0bcf019935',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '875a1258-a46c-480e-9616-f3237fdf5a1a',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'cd4b0754-85d9-40f6-ad4b-1ec855117a38',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '875a1258-a46c-480e-9616-f3237fdf5a1a',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'e611bc6f-5af0-4275-93b2-dfec5d67dc02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0a51d0ca-d709-4c07-9f96-c677e9ee87f3',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '1a36db95-58d5-4a08-9385-8a98fa8ffd27',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0a51d0ca-d709-4c07-9f96-c677e9ee87f3',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'c87cc0d1-4637-4d9e-951c-1c85b81c7b2e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '012cb8e6-da22-4019-8b88-99c577062f8a',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b13acd77-3fc1-4068-ad0c-21c5f68017c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '012cb8e6-da22-4019-8b88-99c577062f8a',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '4bd656c7-9169-4073-850a-88b6cbe0c759',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4b0b2bdc-3432-4b6a-8a7d-33fd711656ee',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '621b1c7e-0c6f-4c4e-a5e5-9bcd65b79c3a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4b0b2bdc-3432-4b6a-8a7d-33fd711656ee',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'd4431717-1571-4a9b-b13d-df9128d29498',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5b6dc47-3a84-4e17-a8ce-47e12f575f17',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '464111c5-7de4-4c23-bc16-ae685fa9b6a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5b6dc47-3a84-4e17-a8ce-47e12f575f17',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'd5058c85-3ddd-485f-ac5e-5303696beb8b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c9f64395-f024-4228-be0d-e9b51ab1062a',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'be684ce5-c847-4827-9527-88cc92dafafb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c9f64395-f024-4228-be0d-e9b51ab1062a',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '8231e75f-0c42-4292-8668-f2c4955490cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '611e7c93-81af-43be-b928-08ae86e67c17',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '99021daa-44a0-49cf-a4a8-fa2d6c54947c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '611e7c93-81af-43be-b928-08ae86e67c17',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '32f2801f-e4d0-42cc-9c24-f320d45fca64',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80f945d3-8c91-44e5-9ba8-b073cee159c9',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '41cae079-1fc3-400d-872d-00cc778f585a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80f945d3-8c91-44e5-9ba8-b073cee159c9',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '76559f7f-38a3-4c8e-9a38-3f5cfa21eced',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee3ee089-2180-45e5-8e82-a1f4b86e56e9',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '369adbe8-8a19-4689-9298-f3bd9bd85523',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee3ee089-2180-45e5-8e82-a1f4b86e56e9',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '3c76aa12-8099-4fc2-b501-b379450f79d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aa193fc0-76e1-4eb5-95b4-832cea6e65df',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '6f383e51-11b8-4113-94d5-0fe7eba531fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aa193fc0-76e1-4eb5-95b4-832cea6e65df',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'b7c83f58-0571-4829-928a-ba9eb0187d49',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bf011c9-3032-4271-b904-6a56c4b8079f',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '75a4e1fd-f9e3-441d-8b1b-41238f4b269f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8bf011c9-3032-4271-b904-6a56c4b8079f',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'e210f8bf-c46d-44d6-a229-05d6a1a1f32a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bab89d96-d9cd-47ca-83bb-e8254ba98e5d',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'd0b8614f-d4b2-40fa-a13e-3b9d84f97f46',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bab89d96-d9cd-47ca-83bb-e8254ba98e5d',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7fa99468-b11e-4afc-92b0-a93de72b4018',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '72fb8f54-530f-4174-b3f0-7ec3f32fe03d',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '4a95c36e-7565-4d87-93b9-cded5986425c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '72fb8f54-530f-4174-b3f0-7ec3f32fe03d',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c519f3cc-19aa-4da5-bd99-b9d51c099a90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a8e868e-ee73-45c5-892f-dda6f807ebee',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'b0d58db1-5a51-4435-954b-d5c13ee6edd5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a8e868e-ee73-45c5-892f-dda6f807ebee',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'e0abb6ce-a9df-4a26-807e-41cfb198b346',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2cd6a93b-7f71-4a00-9f32-24e363513519',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '61ac8f5d-6d14-402f-b242-7bd54fde98fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2cd6a93b-7f71-4a00-9f32-24e363513519',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'f4706775-4742-4546-95d9-464ca47d922a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bd04b663-1885-4c30-9d1c-0d65c16681cf',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8747cb7c-049a-4c5d-a018-88124df4ca67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bd04b663-1885-4c30-9d1c-0d65c16681cf',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '9ed3f35b-172f-4a43-9171-0276ce93f7a6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d05d304-a73f-44e5-b35c-95e624bd02b8',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '6d6661b9-4755-4e72-a072-c10ed85f693b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1d05d304-a73f-44e5-b35c-95e624bd02b8',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3750e13f-bbd7-4e68-a467-eb5cd2435027',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4e27e6c2-4f89-4da8-b091-5451eba71608',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '262d2a26-aceb-457d-a610-ea037096a473',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4e27e6c2-4f89-4da8-b091-5451eba71608',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'c3ff4e65-b466-432a-9d9e-ac2df943eaea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '79942f46-1d59-40ff-b4b0-3df1b7ace76a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '8b56d036-acfd-43df-acb6-c2174a510f40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '79942f46-1d59-40ff-b4b0-3df1b7ace76a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'b7d83afa-1d17-440a-96d4-fe7b923d2b8f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c9d45dea-2ea4-448d-ae48-6dd251a7d7df',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '9dc65c5e-c865-449e-85d2-e7db548bceaa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c9d45dea-2ea4-448d-ae48-6dd251a7d7df',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6531e762-e947-4edb-821b-4e4e9622a662',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '318216cf-6db0-43a0-9690-777edb30cdcd',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '3d3ce12a-fce2-44d6-b672-a209102fafc8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '318216cf-6db0-43a0-9690-777edb30cdcd',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '2d907d7c-59ee-4711-be27-0da6d257d19e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e710f4e8-071e-4593-9f0f-7d2394d42fb0',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '8a86f1ed-b845-406a-9f12-118c78e2c184',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e710f4e8-071e-4593-9f0f-7d2394d42fb0',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '495c94b5-c09d-4206-b4f3-2ec6e6da1d11',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '56cc1c6e-7cb7-45a9-8aa5-2a4b4c239f85',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '64c30e1b-23fd-4266-b029-e29e0061e4bb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '56cc1c6e-7cb7-45a9-8aa5-2a4b4c239f85',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'cc63d7f9-8179-4627-9a9e-d50e95a32dd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f51364b3-af39-4088-b408-7f1812869e6b',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'a966d87e-a125-422e-85ee-81c418391c9f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f51364b3-af39-4088-b408-7f1812869e6b',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '4bc7d10f-a570-4c5a-846a-2032e68f14e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1aad44f-9e2f-4653-ac4d-66219ae4429c',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a2a8decc-84b4-42b5-9c25-cdd161479844',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1aad44f-9e2f-4653-ac4d-66219ae4429c',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'a8e65733-7d6c-4395-8c38-6093227f49e7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1c85170-4fae-4bc3-b2e2-2fdb7e4c1c85',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '623439cb-53b4-4158-9e5b-359dfcbba692',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1c85170-4fae-4bc3-b2e2-2fdb7e4c1c85',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'de529266-5df7-4106-aed0-d09187a5c04e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3646efae-61e0-4977-8213-ccc27c5380c8',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'a2078b0e-4959-4b3d-9e42-e77d8c93d11f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3646efae-61e0-4977-8213-ccc27c5380c8',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'be331f23-fb7f-43b5-9cd6-2b3b61b3b1f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abc84c3c-4e62-452e-8c16-a9e535588e60',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'e18e351b-63cf-48f5-877f-16bf46c09017',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abc84c3c-4e62-452e-8c16-a9e535588e60',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '6aa9a30a-e81f-49e8-92ac-5ad08eacb0e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06d33c78-c342-4389-8587-a80087ff982e',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '7ef15065-dcc0-43e3-bc93-b02669cb833c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06d33c78-c342-4389-8587-a80087ff982e',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'e084ab0c-31b9-4283-a4bb-531365ce4ea8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '50f52147-c162-484e-929d-3fadff8f036b',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '72826101-4ea9-4f7e-bbc6-f01df4041a13',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '50f52147-c162-484e-929d-3fadff8f036b',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '106f0938-129c-4531-973a-f3c4922993ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4ccd0def-1881-42ce-88e6-c080a93bda10',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '7f9e9a76-0670-4ace-95d4-812beae703b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4ccd0def-1881-42ce-88e6-c080a93bda10',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e2f31a94-7de3-435f-aa29-0e6c2919da9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2e7c1112-d603-4007-9c87-757b810d6dd8',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'b7ee1b78-af89-4ad0-90d4-ca9aa8e75ddc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2e7c1112-d603-4007-9c87-757b810d6dd8',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '59c601f4-e1b9-4625-93a2-e86142dd7769',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '431d1e02-f9d6-46dd-a595-d414b726b5e7',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '4c7a33c7-24c7-4fbc-bca0-1cc640cab77e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '431d1e02-f9d6-46dd-a595-d414b726b5e7',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'f8444e40-e755-42bf-949e-c1271befac4b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '042bd117-20fd-45cb-a1ea-6cdd5f4ff3f6',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '4c2a7817-e1ee-42c5-8d89-f743fb2d5c3b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '042bd117-20fd-45cb-a1ea-6cdd5f4ff3f6',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '6b314a55-53df-42a1-b24b-224f383d1009',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9bf82398-981b-4e40-a77f-5a042594375a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'b2a02ac0-c3db-428b-b61c-c38587df13c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9bf82398-981b-4e40-a77f-5a042594375a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '046abc19-19f1-4537-9660-b5bf287e8455',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1720e426-73a6-46f0-b337-7afe7d0b4917',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '55f6c50c-349b-498d-9900-ebbed5594c74',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1720e426-73a6-46f0-b337-7afe7d0b4917',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'db618efd-9ece-4ad6-ba90-27fdfe11a98c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90d38e86-6551-47b4-bf13-df42cb60724e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '83a440e6-d281-41d1-ab81-afa2f57830a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90d38e86-6551-47b4-bf13-df42cb60724e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'e2ca7ede-99dd-4265-9f54-7f291d744a3c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2d64cf70-3f36-4cd6-9c98-edbe81760cda',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '4579775c-7dd3-42cd-a501-6f2b8a98d5e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2d64cf70-3f36-4cd6-9c98-edbe81760cda',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '6e4c8f9e-9e05-41ae-a86a-e32cdabe6552',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ec8aa97-0efd-4ac7-9a3d-7b33cb3e205a',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '6b5d6a33-f3fa-4d1b-a10f-d7b1a998bda0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ec8aa97-0efd-4ac7-9a3d-7b33cb3e205a',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '6c17bc8b-36d3-4b93-bee7-903d92fbe686',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '526d13ba-7f30-4a0c-821a-178e10dad383',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '35975b81-73c4-472e-ab6f-1c809dfe9793',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '526d13ba-7f30-4a0c-821a-178e10dad383',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'ec8679c3-53f3-4138-a4d9-a856c57753fd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c90fb01-5d8a-4628-9511-522ac012304c',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '85065a90-4734-40a5-8360-21f50c4c7d89',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c90fb01-5d8a-4628-9511-522ac012304c',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '7d699b43-61e7-4217-acdb-14f812cfd750',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb2c1c4a-e4f5-4e1c-adc6-a3957f6d941b',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '73a2521d-5718-451d-a7ef-d593ef690911',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb2c1c4a-e4f5-4e1c-adc6-a3957f6d941b',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '5eba0368-fee6-4d70-8ffc-962de0acee14',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '01fb5f91-c632-441e-9b18-3738dfed1ae6',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '29f1cc18-6b23-403d-96ba-4f87baf80c1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '01fb5f91-c632-441e-9b18-3738dfed1ae6',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'dbffc1cc-464d-49ae-8acc-be4efef787fe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b60e890b-834b-4847-9ab4-8fe7fa1196da',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'e130a6ef-9868-43d7-81fa-046181649aab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b60e890b-834b-4847-9ab4-8fe7fa1196da',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '86349656-12d8-4fe9-bcba-7ebd4c030b0d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20c14dad-f9dd-4a44-a60d-fe6505fd34c6',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'dd4eb762-a6c8-43ca-ba53-e65ba9b35250',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20c14dad-f9dd-4a44-a60d-fe6505fd34c6',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '23bf84b2-2f74-406e-b367-83ed621c2dd1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2bfd1df8-fe85-41d9-9f72-241aaa374fc0',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'cb51679f-6632-4f32-b3eb-dabc7be8dc91',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2bfd1df8-fe85-41d9-9f72-241aaa374fc0',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '8d9dd7f9-33dd-47f0-b59f-bcc469e00129',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '369a70b5-3b39-49a5-ac6f-ff5e3f0b4e1e',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '5245c391-bfad-4b00-846f-8ab2158bfcf6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '369a70b5-3b39-49a5-ac6f-ff5e3f0b4e1e',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '028ea4eb-e152-4106-821a-873b25798480',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '119662be-654a-4fde-9aa9-979dd4f90701',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '2625865f-b8b4-429f-9ea1-61510f937374',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '119662be-654a-4fde-9aa9-979dd4f90701',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '59eb4383-4fb2-46ed-a634-0735e844f568',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1ad7455-463a-45e4-95ab-c39155c1ca46',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'b37b9687-b4eb-4647-acf0-7e6e1da29d08',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1ad7455-463a-45e4-95ab-c39155c1ca46',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '17e2b6c7-cfab-4a53-9a10-b0ff2f511d41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b717b973-ae06-495b-a14e-8e630e17e414',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '09394c92-0dc1-49f9-8a9a-9bb32f6b6eaa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b717b973-ae06-495b-a14e-8e630e17e414',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '2ba78273-3954-43ce-8096-fcc329d80537',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b055ce7a-d723-46e1-b996-509b29f90674',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '114dd042-8ece-425e-a982-c40be5a860b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b055ce7a-d723-46e1-b996-509b29f90674',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '016007b9-cf17-485f-a49b-e4edf50f6d68',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ef13cacd-ee55-4d2b-8531-8a2eca78ece2',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '162271ba-ca79-41af-89cf-9930f744d7bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ef13cacd-ee55-4d2b-8531-8a2eca78ece2',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c37e05e6-23ac-4333-8435-2839fab1dc69',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44f59ade-a1ce-4b39-8c24-9726f55202ae',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'e36dd966-485c-4461-b4aa-d3ad2afbb95a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44f59ade-a1ce-4b39-8c24-9726f55202ae',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'dc7162fc-4f0e-4735-a840-57f1b8604499',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9556b0da-c424-440d-8175-9ef75c584c44',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '465e8b44-4ee9-4f1d-b7e7-f344a139e370',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9556b0da-c424-440d-8175-9ef75c584c44',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'bcf2a78b-ec36-4362-a84c-7420de554e19',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94b7b3b7-98f4-40e0-88f1-33ffa2cc7824',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '06a64edb-47ee-4ee3-9260-37589d0a2a7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94b7b3b7-98f4-40e0-88f1-33ffa2cc7824',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '27cf7c57-d4a4-4bf8-a489-26fd1b98810a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '781df1d1-c4de-47f8-9b18-e5ded10be71b',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '8011ca50-bc15-4df4-b4e4-bb7434ff3f90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '781df1d1-c4de-47f8-9b18-e5ded10be71b',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '45ea8339-70c6-4ff8-bcac-ec5f26f846cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cde64f6c-41fb-41c1-8ce8-f1936c96962d',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '6028c161-3476-4593-826f-c0b35dae5734',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cde64f6c-41fb-41c1-8ce8-f1936c96962d',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '633203cb-492c-4a82-ad26-0f68efa6f226',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c612690a-7572-422a-80a9-0c8b51495137',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '1e0d7535-7fc6-42a6-87f9-2b72e9073149',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c612690a-7572-422a-80a9-0c8b51495137',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '4881abd4-6ee0-4e1f-98bd-a2261cf85d48',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30ca9037-d038-4d22-bd5d-37cebca8bceb',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '3ecef03b-7c1e-477e-8df6-ad1c6cf8feb7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30ca9037-d038-4d22-bd5d-37cebca8bceb',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '0067d18b-fc34-4747-af78-cab9f66a6042',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af85fc5b-44cc-4a07-8c06-f1929ff369c4',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '919fe82c-d1c5-49ef-8a49-1fc87e69615c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af85fc5b-44cc-4a07-8c06-f1929ff369c4',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'a4449c0e-afa3-44e2-820f-74617b384447',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ea6ae6f-b323-4e17-8d7f-1ff52ed6433f',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '3a178381-aca9-45c4-a9d3-3dcfa253da81',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ea6ae6f-b323-4e17-8d7f-1ff52ed6433f',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'bef2eb98-22d9-4711-8157-a34791c294e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dd31390a-624d-4825-a515-4d863834e860',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'b07525a1-6ef8-49c5-975c-e3abc660ef75',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dd31390a-624d-4825-a515-4d863834e860',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '7d97bb5e-4527-4e1b-b5b2-804293577755',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ab2d399-3696-47de-a90a-18857cd8b1b7',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'e690e819-b411-488a-bc20-c23ec3612829',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ab2d399-3696-47de-a90a-18857cd8b1b7',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '9292b5ef-db55-48fd-b1c0-76f982894c1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9f76a0b5-5fa0-4f13-9815-442216d1f741',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'b5055a35-b4d2-4bf0-9693-a1191752fc40',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9f76a0b5-5fa0-4f13-9815-442216d1f741',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'a17497aa-3e01-46ed-8ab1-18b38b108616',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e919b291-ddee-4e4b-ae37-972c62a8a0c0',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '23dae269-09ba-4eb5-8991-a24d3db03361',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e919b291-ddee-4e4b-ae37-972c62a8a0c0',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'b5b3afa3-9022-4b0c-b0cb-998c3355d6eb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a6c5f2ab-8766-4d37-8ae7-b7258a2285e1',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '9ad2fb50-19fe-4043-9179-0ba7fca9e3c7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a6c5f2ab-8766-4d37-8ae7-b7258a2285e1',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'ff48658a-c608-4324-aae4-e8f16ddd2c43',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af0e06ae-1a46-41c8-baea-d950635beb2c',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'c2d93f84-b7f1-4d5c-97a8-04767b713a42',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af0e06ae-1a46-41c8-baea-d950635beb2c',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3962bd05-c7f1-4a75-bddb-626c2d838d53',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '19f99f4b-3d89-4985-a31b-4dcedc31b727',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'd238e7a6-e3ce-464d-be0a-d7fa34ab7bca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '19f99f4b-3d89-4985-a31b-4dcedc31b727',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'bd54673c-cea4-47ff-85e1-8949bb9cb196',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '12149e98-7272-43c7-b593-d326e7cde576',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'cd918535-c08f-4952-904a-0fa8cb75a03b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '12149e98-7272-43c7-b593-d326e7cde576',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'cdb5a88c-3bb6-4653-9fa6-923028f94249',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '63c98b10-6cab-44cd-ac7b-f0ae692c24c6',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b6da22ba-8c79-45aa-b61b-d5ed92a18061',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '63c98b10-6cab-44cd-ac7b-f0ae692c24c6',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '088201ed-83fb-48fe-84bc-22ee086ff235',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8639d95d-14a0-4198-8580-52684a768f30',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '4aa01a8e-8e1c-4079-8a94-25543024ea5a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8639d95d-14a0-4198-8580-52684a768f30',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'f794ee56-b475-4e04-b5cc-2bad34cbac41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a96d46d-6145-43e5-a1f4-fd204347b5fd',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '050c4bf4-b50c-480c-9cbe-1730b51a4c7a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a96d46d-6145-43e5-a1f4-fd204347b5fd',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'a7e1b2be-1417-48ba-80a1-db05be35b4c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd089246a-11e5-4c20-b40d-35682a8159fc',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '09a1732b-de08-4f8b-86ba-d02f737857d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd089246a-11e5-4c20-b40d-35682a8159fc',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '975fa560-d509-44e2-a186-9226858676c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '52c3dd93-3611-4782-b70c-f2e192bee77c',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '90ad6489-67e3-4afa-aa79-b9691920d3d4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '52c3dd93-3611-4782-b70c-f2e192bee77c',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'f004cbed-552c-4c8c-92f7-aebcfb0f7936',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '91e8da6b-0762-4cec-b3db-d151acfd1d90',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'd854e690-1d91-422c-ab83-93e8fae46081',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '91e8da6b-0762-4cec-b3db-d151acfd1d90',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '17e6d92d-09c0-4789-8207-773f77c767c0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd49b7529-0556-4d2c-aa10-1a268e87445b',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '6ef63c18-2167-447e-b1f9-1c32011cc069',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd49b7529-0556-4d2c-aa10-1a268e87445b',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '6c9ddfe3-2df3-4468-9990-06016932c721',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '32712fb2-026d-4810-8463-60907f73a146',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '9274e890-b2f7-44ae-937a-07403def91c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '32712fb2-026d-4810-8463-60907f73a146',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7bdf98c0-e90d-4c6f-8a4d-6851f208e35e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '265b91b4-0dd0-425c-92cc-224f2de964f0',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'ac377c13-effb-43ad-943c-25c3b97a9954',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '265b91b4-0dd0-425c-92cc-224f2de964f0',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'fb41806b-cf7d-41a0-b1bd-405a5936e174',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90d913c5-9779-42e4-a28a-81dd3b28a0f4',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '45116a29-1c54-4c28-96a7-9e638e3ec07f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90d913c5-9779-42e4-a28a-81dd3b28a0f4',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '01b4a00e-5c75-4f7f-ab39-309f45d56b5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4ee96255-8305-4981-9972-181dfc6fd8de',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '62f69774-68b5-43a9-962e-66741b786bc3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4ee96255-8305-4981-9972-181dfc6fd8de',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '4b3482a6-85d3-4e4a-9dfb-ae8361fe29c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '52264c0b-ae8b-46f4-a95c-d3cd01d35176',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '72488a71-f37a-44f9-87d8-e687e60ac3fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '52264c0b-ae8b-46f4-a95c-d3cd01d35176',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '75386ac7-d1f8-48ec-9396-8afbb9f71b55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b90f3dba-16b7-4c2c-9891-10877dbf30b5',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'bc3eefd2-df8e-4884-845f-6f8156757476',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b90f3dba-16b7-4c2c-9891-10877dbf30b5',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '61f0c898-08d0-48d4-96d6-a7b51a5e91bf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '398c86e5-a969-4a08-8a8d-c417c53b0886',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'fe8bc40f-250e-4923-a142-201c96adf52d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '398c86e5-a969-4a08-8a8d-c417c53b0886',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '290e1e3b-6e62-47cc-8780-a86af6f5fd9d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fa056ad4-5dbc-40d2-8a08-645fc589931b',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '5472e87c-76ed-46f3-8ada-c49a3559eebb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fa056ad4-5dbc-40d2-8a08-645fc589931b',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '818529bd-ee9f-424c-878f-5bed12e13df4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1778824f-556d-45a6-afae-87c41488292e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '417d3f30-430b-403f-93af-e3465447ea2e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1778824f-556d-45a6-afae-87c41488292e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '227a588e-1884-425d-96af-10095354d41d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '906fc618-153c-485b-abd7-8eab4ae5384a',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '91f471cb-9b8d-41e0-808d-88344d4e3fd6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '906fc618-153c-485b-abd7-8eab4ae5384a',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e8457842-7245-4e9a-86b4-9c5da2ab7fcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e9226ea8-73ee-4371-9ed2-1b85efc27bc7',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '8260bf1a-9afe-4b08-8377-52ca653eca5e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e9226ea8-73ee-4371-9ed2-1b85efc27bc7',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'ecbb7575-22f4-4c56-86b2-957cf7f5e7e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0edf9113-7db0-4784-babe-72d2e8207dec',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '792c7fdc-fa01-4d53-a52b-43cd3769db0e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0edf9113-7db0-4784-babe-72d2e8207dec',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'b6f9b8ab-1b4e-42e7-a809-27d73cc5d5ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06ebab48-3a9f-492a-9383-1d7049b1c331',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '2c8831d6-ef1a-4f54-8092-cf977d542ccb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '06ebab48-3a9f-492a-9383-1d7049b1c331',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '8467af29-f143-406a-9aca-1038b8206951',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '57cff572-9fdc-40ad-8b99-bcaefee73de2',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'be0248fe-4c4c-42d5-b746-c66aa0be4f32',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '57cff572-9fdc-40ad-8b99-bcaefee73de2',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '695e7953-a254-401d-8036-4ccf2ed03114',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '554cdb43-fd9f-4138-bea2-d5e336151a1e',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '31ec342f-1ae3-452b-b512-56a25ef32154',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '554cdb43-fd9f-4138-bea2-d5e336151a1e',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '656e724a-5b62-47ae-a588-18d47f5970cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '97f79482-ff11-40fd-80fb-9da180ba67f7',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '835b710f-346d-4dd9-81e8-cfb009a8d15a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '97f79482-ff11-40fd-80fb-9da180ba67f7',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'fa0b33a5-65db-4e5e-9735-20bf19c24b10',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c020449-f249-4a62-8da2-67e948442765',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '1ce81c12-b917-4fd4-a6b9-12074f12a7c9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c020449-f249-4a62-8da2-67e948442765',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'affcdf7c-1dc8-4311-a221-f85d61e7c658',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '817e4a18-18a7-4dc7-8a00-8fc2d331d5e4',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '7bc94105-77ef-4bbb-9544-aa64f2ed5a60',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '817e4a18-18a7-4dc7-8a00-8fc2d331d5e4',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'febf8f09-f0df-4baa-be24-c5b854afaf8e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7015cb7e-df5b-48fc-82ed-9d001ad54871',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '5d24e42a-7ac1-4069-99e4-3efa53557bf9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7015cb7e-df5b-48fc-82ed-9d001ad54871',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '2d57958f-c551-4e41-9bfd-0ef236245919',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '443323fc-ba4e-4afe-84e9-ebadbd8f9e63',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '9daf0c7c-2cb5-4e69-a696-ba2790c6c49a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '443323fc-ba4e-4afe-84e9-ebadbd8f9e63',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '592b5cfa-50dc-42ad-9202-83af92db02c4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eaf2baf3-7866-496d-b405-80d77e0b2463',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '328a9b8b-e79b-4c8b-9f0a-fd1facb08daa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eaf2baf3-7866-496d-b405-80d77e0b2463',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'eb6e2076-e3a9-479b-85cd-ff9144a90160',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0d2d0c1b-b423-4a0e-9447-dab5b9112056',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'ccfd8025-e031-472a-8150-a5eae9f3128c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0d2d0c1b-b423-4a0e-9447-dab5b9112056',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '6309a02e-9d2d-48ed-ac9e-f0fdd7c857e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cc043b29-1653-4a26-a0bb-d85982e45b8e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '5ab51770-a84e-420c-b55b-e91bdd1b2992',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cc043b29-1653-4a26-a0bb-d85982e45b8e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'ae01dff2-a91f-4b10-a455-f14c14246317',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2a73ea0e-92ed-454b-8250-cd3571f9a63d',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '77a287f0-fc3e-4fc4-8a36-4c667afbcc69',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2a73ea0e-92ed-454b-8250-cd3571f9a63d',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '9ae5f3e9-3609-4bba-94bd-349bc2027406',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b28daaf0-57e3-4442-a97c-20371a18eac5',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'c43ae8d8-c81a-4ea8-a5a0-966b9f02f442',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b28daaf0-57e3-4442-a97c-20371a18eac5',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '3cdf1238-d69e-4c16-b852-656768371854',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '332c0811-b930-4c35-86d8-e4ba74b85bb1',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'e6dbaed7-26ee-4849-845c-234c1586a9dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '332c0811-b930-4c35-86d8-e4ba74b85bb1',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'ac2a75f8-3a2a-4851-902e-51977f79e9bc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '08c7535b-5648-43ed-ab6c-4c1bb7770825',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '1e3bec80-0172-4c46-80e0-fa7a8b2d6150',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '08c7535b-5648-43ed-ab6c-4c1bb7770825',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '699fa535-e40a-4e08-a2a6-34d6deb0f524',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fa57984a-1567-4c29-91eb-8d9473f9c14a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '20a2fea5-5e43-4df6-8a52-9d999c2b05b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fa57984a-1567-4c29-91eb-8d9473f9c14a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'df33e781-50be-48fe-883c-dec0f48ceaf4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8d0db430-3046-4386-8c86-adccf76398a4',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '3c6a4e4c-1cae-4272-bfc0-71c0f562b256',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8d0db430-3046-4386-8c86-adccf76398a4',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'ee64b96a-6763-46b4-b98e-a313f6a30d2c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bd48a110-8a61-472a-8da8-b51dec85f22b',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'd1a933f5-86b2-4694-a9a3-821de0fbcb76',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bd48a110-8a61-472a-8da8-b51dec85f22b',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '51819987-621e-44d4-9f85-49a315319307',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ef27182-def7-4ebe-9b71-e325bf3e2c44',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'dd9d5feb-77fe-4d94-bbee-23da2231e799',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ef27182-def7-4ebe-9b71-e325bf3e2c44',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '255c62ad-4f14-4951-b7fe-549df9ea26c6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5fa12175-aea9-4e2b-9e53-89329d653f37',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '8ab4bdf9-9fd2-4992-9fa8-bd01af420fb5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5fa12175-aea9-4e2b-9e53-89329d653f37',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '73e60657-6d6c-4a2e-a6c0-8e8c4ee3333c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5d92d0ed-2c47-4a20-a362-43fe519da42c',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8f8696f4-6144-48ae-9660-2d986e4d3c99',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5d92d0ed-2c47-4a20-a362-43fe519da42c',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'e67ad3d8-438a-4f3c-b8c6-31d7ae654040',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0d55a752-c765-4f44-a7cd-7021036832c7',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '26ec8a6c-ecf5-45f2-8c75-395eccd7df84',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0d55a752-c765-4f44-a7cd-7021036832c7',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '01a6cf5d-7081-457c-a4a0-2236e07208d5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9366334e-6d78-4a51-a493-fcf3c8fba30f',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'b5abb617-bb25-4452-8474-da775c91b6b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9366334e-6d78-4a51-a493-fcf3c8fba30f',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '4f819f5e-9e98-4022-840b-ab5e2d9c792b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2991062e-d859-4358-950c-52c342661f44',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '99db30e2-767e-4860-9ae1-3a79ae705cd9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2991062e-d859-4358-950c-52c342661f44',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'd8a02447-fcfc-4e33-9ceb-91517aa2640f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'adfc5d24-7e38-4010-9a54-6ba88d569cb8',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'f21bdfca-fa3f-4d76-b69c-7cbfcfea8d1b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'adfc5d24-7e38-4010-9a54-6ba88d569cb8',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '6f6b2cd4-df8e-4dc2-9a7f-b3f8ff07a82c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '022f8eed-00f5-4c70-b074-6f82950ea02c',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '024233d1-648e-4aa8-b76c-79f87244c977',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '022f8eed-00f5-4c70-b074-6f82950ea02c',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '2e6e876c-118b-40eb-9518-90c201298fd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5e2b041a-64db-4bf7-ab4b-1f6890df0206',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'df3a1da2-a05d-417f-8edc-0e96e345dca1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5e2b041a-64db-4bf7-ab4b-1f6890df0206',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '990fe5bf-aa62-4f72-a44f-6852fa957b0d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af316544-8874-449a-bdd8-870d44be4f9f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '7add5d6b-e78b-40da-9bff-9e65fb021fcb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'af316544-8874-449a-bdd8-870d44be4f9f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'f0b42c53-165c-4f98-aeaf-0b8d86c8add1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b74b3478-7da0-4b2a-826a-2341f4275543',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '66d3f3b9-a698-4c5f-94d7-e78d59a9154c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b74b3478-7da0-4b2a-826a-2341f4275543',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'cfc980e0-83d0-4307-a5b2-92bee6d5eafd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ca3bb0f5-ca28-4d35-b3a6-9f3cfd4ae8ab',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'bf1f6c92-f4ed-4e19-9372-6c11059d02c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ca3bb0f5-ca28-4d35-b3a6-9f3cfd4ae8ab',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '9fcc51e9-7511-424b-ac12-22ec2b2401de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '68c9e7b2-6911-44df-a27c-49de2a2b7142',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '9c1e314e-b24f-42bb-b788-c541d4ca1ed3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '68c9e7b2-6911-44df-a27c-49de2a2b7142',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'ba6fbb9d-7ae8-4889-9b76-9a001bb5f99e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30950f8b-9107-4c31-92c0-ff50b810c1e1',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '290aff17-b36c-4618-a3dd-5144519ebac4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30950f8b-9107-4c31-92c0-ff50b810c1e1',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '3e296a5a-047a-456f-8856-b13aaabaed0b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8e8871a9-6d80-4ff0-b8a9-9635bcb97e27',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '94a94f53-4af4-4089-aff4-27ff468bf3b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8e8871a9-6d80-4ff0-b8a9-9635bcb97e27',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '563ab3e3-9f7a-4661-9dd4-9d0fe8a64d3a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f725991-684f-41c4-af83-f3946631ab74',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '6c1701dc-3e9b-4a7a-bc7b-c4f452e2f86f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f725991-684f-41c4-af83-f3946631ab74',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'eb7456ce-5e0d-4b01-842b-a41267722b8d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5d3a5791-4fce-43b8-8473-925027d2f76b',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '2e13fc30-9fee-4091-ac2e-4de74d5a4fc9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5d3a5791-4fce-43b8-8473-925027d2f76b',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'b5b20bf8-7b27-4c6e-ad8e-ecb1d33b0c49',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b51924a7-f14e-495e-b32d-ff7605e9d5bf',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '41eb6bdf-f464-41ae-9427-b933ecec8963',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b51924a7-f14e-495e-b32d-ff7605e9d5bf',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '53bb0164-adf1-42ea-8360-1c1946d18296',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c70b95fd-8b63-4860-8df0-67042b36f822',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '4083e9c0-afc4-4ee8-bfa8-d859a84b30a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c70b95fd-8b63-4860-8df0-67042b36f822',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'd81fb8d0-bac4-4054-8848-183c62031a9a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a73013ae-d90a-45c0-bf71-dc8db61dca1d',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '4ee44f8e-c011-427d-acb1-9efcb266c855',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a73013ae-d90a-45c0-bf71-dc8db61dca1d',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'cb2b5c2f-ebc0-4ac3-b822-60ee2873a304',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1e55395-7e69-42cf-931e-b5514baa33dc',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '72308cdb-82db-4df9-9f01-76d583519080',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1e55395-7e69-42cf-931e-b5514baa33dc',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'c8652928-6f49-4f19-a77f-1734008ee20b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '95fd7b34-0807-448f-b934-5cb6c740df9a',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '8d7d3849-0f82-4e36-a601-ca8f679eb04d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '95fd7b34-0807-448f-b934-5cb6c740df9a',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '16d8163d-46da-43a1-810a-4b76a664cdb9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90c7be1f-7c4f-4391-bc3a-7e0308ec5473',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '96947a91-9852-4a56-827b-593827e48bf9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '90c7be1f-7c4f-4391-bc3a-7e0308ec5473',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '375f8210-0343-4fc4-9609-e1300be1fb19',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ea98bc3f-2257-4969-bf73-2a04ced42148',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '833d19ed-5687-4023-82d8-afbc4e8ad685',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ea98bc3f-2257-4969-bf73-2a04ced42148',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '77a6c556-9f78-4272-82e1-028a6a6aa757',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '56a14de0-e8f0-46a0-935a-7611f36eff6c',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'dab9b423-7e2e-4bca-943d-c6af495a43d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '56a14de0-e8f0-46a0-935a-7611f36eff6c',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e4f5b256-b94b-4f14-a4d2-8da9cf6e1b67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d20688b-69ca-40db-9c56-3c8b7e85b4dc',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '349e9b54-c041-4e60-ac51-212e1458952b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4d20688b-69ca-40db-9c56-3c8b7e85b4dc',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '06d8e123-7447-454f-a985-6cec02b84685',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26e77a1c-27e6-4390-a41c-eaca755edb2e',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '989ac7d8-9ab3-4e2d-9f32-0403022642e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26e77a1c-27e6-4390-a41c-eaca755edb2e',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '212bc5af-1b49-4dab-8ae9-e47d05278df0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62a9b2f4-4c96-4721-a8c4-9cee5b80561f',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '69d07c0f-31cd-4f82-8dd6-a1713ffa1aa5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62a9b2f4-4c96-4721-a8c4-9cee5b80561f',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'e12e6dfe-f35f-4bdd-9076-f56e47c4195b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1e8346e-9167-4da3-93ed-6de527b174bb',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '5a76986f-3189-4efe-8053-ec5fc2340806',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1e8346e-9167-4da3-93ed-6de527b174bb',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '9484c51b-9f50-4fd9-8c56-0218ea352bc2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '60e28ea5-c514-4d49-9165-d921c7e75ee7',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'f2e497e2-5f62-449f-8581-fc97da7cb1ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '60e28ea5-c514-4d49-9165-d921c7e75ee7',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '2a77b4e6-0e1a-4158-8518-e1be068d3e64',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0cfcec99-6d5c-42ed-934f-183c523145c3',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'dd8a54ba-f945-4357-a912-8571abe4ab7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0cfcec99-6d5c-42ed-934f-183c523145c3',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '77f0512d-c08b-4d35-9cb3-ed315ad59801',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c6723490-ba68-44f7-923e-01c85a25fe59',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '37182468-6c65-48b4-a876-440a6119c159',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c6723490-ba68-44f7-923e-01c85a25fe59',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'cb92d04f-9070-4a7f-b4ac-ecb677a4f52a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '908b1768-5f53-4e52-b5cc-7145af345551',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '867d4339-f53b-43d7-b137-0d681e884fcc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '908b1768-5f53-4e52-b5cc-7145af345551',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'c22447fa-8484-4743-bb6a-40171cd8e93d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dcf73587-61ea-4ac7-8e59-08d15cfebb62',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8843d19e-1182-48e6-84e1-e0ae3cdc392a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dcf73587-61ea-4ac7-8e59-08d15cfebb62',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'fa51dcfd-bbbd-4984-8930-bef86fddde3c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27950f3d-b030-408f-956c-01d3a9f46973',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '49273092-f349-4ee3-aff9-6377815bae68',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '27950f3d-b030-408f-956c-01d3a9f46973',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '791e68bc-c35f-4a17-bc7f-10b5d30bc07b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c97a2664-026e-4806-bc8c-32f5a3e329e9',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'eb9800c7-809a-4f25-9b6a-a9d638aa790e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c97a2664-026e-4806-bc8c-32f5a3e329e9',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'ec62eecd-69bf-4cc2-92d8-ef4165d87e82',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7c9293ae-e597-4a8f-86b4-afb0835a6bd7',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'bc1bddb3-6be8-421a-9021-00124b900e56',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7c9293ae-e597-4a8f-86b4-afb0835a6bd7',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '73d2b7f6-e4ac-4462-bfce-8a23eb1e1952',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dc7ed348-06b1-4864-8071-8ffd92158429',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '77168cde-6d64-475b-a284-964d77b9b493',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dc7ed348-06b1-4864-8071-8ffd92158429',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '95f0c200-8194-4d2b-89d3-ba7a486a3b55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '386af79d-8bc5-4c63-bb3a-11b303fe0208',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '7e27e913-9117-4b6e-84ad-bfc7342a328d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '386af79d-8bc5-4c63-bb3a-11b303fe0208',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'c3df2a04-1ab9-4fd9-88ca-d7ec6c204a1f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a929e0c6-341a-4e0c-bd07-c2c65153a28e',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '985cfc37-b54b-4c7c-97e6-6a609e9a610e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a929e0c6-341a-4e0c-bd07-c2c65153a28e',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'a665afca-2204-4515-b47f-8457c5228af5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ffdb8f00-26e5-472f-ab5b-213b4e2478f4',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'f95cc0ed-df4f-4122-9094-6acbfc83d52b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ffdb8f00-26e5-472f-ab5b-213b4e2478f4',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'bfc9115a-4946-4dac-a068-8fd7da980461',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e7170a09-10d4-43e5-a0ef-f2ea30039f69',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '74796bda-8be4-4839-90bd-56b2cb7a449f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e7170a09-10d4-43e5-a0ef-f2ea30039f69',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'c7a9fad1-7308-4c82-9b9d-06e2b6d1ecd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20051709-f642-4762-9923-e948c30e6a04',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '3be154f1-4d5d-49eb-9f85-30ff39095cab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '20051709-f642-4762-9923-e948c30e6a04',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'f77188ec-2f5c-4e19-b822-3efef6f7282c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5a82dba7-9ff9-4f30-ae6a-91a5054f79a6',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'c16914b7-6b9c-4645-b577-444a948e862b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5a82dba7-9ff9-4f30-ae6a-91a5054f79a6',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '6af03382-590c-40f5-85ff-44ed9dcb1523',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '162567fa-7744-42c8-850b-a024cce5e94d',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '8399489e-cc00-4e02-9af8-2ac670facf2f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '162567fa-7744-42c8-850b-a024cce5e94d',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '045cf657-aefd-4ba4-98b4-645ff3077b91',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e45263e8-f059-44a6-ad8f-97de5bcc86da',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '0aa39ad2-de0d-4d75-84a3-c18168f6ecd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e45263e8-f059-44a6-ad8f-97de5bcc86da',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '18c54368-25b0-404a-8830-054953b9187a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f83d481a-b446-4fe2-8910-f9adaaf24777',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '64b04d66-03ec-4015-9355-bace317624ab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f83d481a-b446-4fe2-8910-f9adaaf24777',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '508f6af2-9373-477e-8c77-79590f7934b9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ffadd5e3-7e0e-462d-8c7b-8d133b0e4238',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '3e210470-29f9-4434-9fbe-7f75c6cff2d3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ffadd5e3-7e0e-462d-8c7b-8d133b0e4238',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'c3eb6934-7a83-4404-9d9d-6dc047e1b836',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '36faca20-e2bb-4494-9302-6891bf9936ad',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'c42881b4-d18d-4082-8f0c-d20fc55f58ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '36faca20-e2bb-4494-9302-6891bf9936ad',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '975f6000-0444-4f99-98fa-24cf2d1b8d12',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df3c8e31-27ec-4ab6-84e5-31d77df18320',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'efe77f28-ce1b-4dd7-a969-8ec12e9b2fbe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df3c8e31-27ec-4ab6-84e5-31d77df18320',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'f0444a24-26da-4faa-962c-36fa9ade04a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '70203e6e-dc94-4cff-8acd-b20d34f02b05',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '17dac48c-0219-48d0-803b-f150dde4daa1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '70203e6e-dc94-4cff-8acd-b20d34f02b05',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '80885317-42ed-47c7-8d78-6103665ae93e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '86ab76f5-cc50-40ae-bcb6-30b379c0a909',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a061a911-87fc-455a-8612-e78d72c0fbfd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '86ab76f5-cc50-40ae-bcb6-30b379c0a909',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '79ed9258-cb09-4c05-a6ce-0949bc33ea0d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '03bd3da4-9e6b-4452-a8dc-ffd359060d9c',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '66d99ca8-368d-4060-9d37-5e56eb600970',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '03bd3da4-9e6b-4452-a8dc-ffd359060d9c',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '6822de90-1921-497d-80ad-4edfe615a941',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '517c3923-c15f-4624-b351-9c40cf58d156',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '990504ba-577c-4e83-9582-bceadfbfb059',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '517c3923-c15f-4624-b351-9c40cf58d156',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'b5796d47-8b04-40c2-947a-9e2153b3d217',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71c326ea-42ec-4b3d-8c6e-2ed5be710938',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'efbc821c-5818-4feb-932c-3d00549c1dea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '71c326ea-42ec-4b3d-8c6e-2ed5be710938',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3abd693f-d8e5-4f01-bed1-9045ed5ad753',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4f6a02f-87e1-4135-8320-9e45797fa7c6',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '56b35d37-008d-4e68-aa6a-19036aca3cd8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4f6a02f-87e1-4135-8320-9e45797fa7c6',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '66c6e57f-e343-4881-932f-0efdfd282699',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fdb1277f-4f72-40c4-b9e8-641bd2dc105b',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8be0e355-baad-4414-a9d3-5263080f674c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fdb1277f-4f72-40c4-b9e8-641bd2dc105b',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '9ff9b077-7b44-4efc-95d9-7e5f0f2336fd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8928b849-3ff9-4992-8575-0f8f6ec05b26',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '6b6e75c7-75b4-47af-b555-931711252406',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8928b849-3ff9-4992-8575-0f8f6ec05b26',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f1661d55-fd9a-4b8a-9990-67666c090ab3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '755dbeb6-2313-4a18-8148-b6656282ba25',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '52e078f7-203f-4832-946a-d68f29911258',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '755dbeb6-2313-4a18-8148-b6656282ba25',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '6feea719-347d-4d00-94a9-80c75a9beb28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f32feff0-86f5-4d4b-827f-85f5d8a9242a',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'e2bc7ca1-c732-4d4c-94dd-a0f3216cf4e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f32feff0-86f5-4d4b-827f-85f5d8a9242a',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '96e06eb2-27f0-4ef9-8cff-c78edc21118d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1ff932b9-d4c1-4bfc-92d0-d3a143301743',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'c5938959-84bd-4f74-861c-25a387cfa293',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1ff932b9-d4c1-4bfc-92d0-d3a143301743',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '52b98c30-8e1e-40ef-a94b-d1f0dd064994',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8ae76f07-7f8d-4ddc-9820-71d53dff6bca',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '79045866-b679-42cd-be13-2aee2c032cca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8ae76f07-7f8d-4ddc-9820-71d53dff6bca',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '3058650c-ba20-489a-a959-bf4f26c8df39',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f178069b-82db-4a01-9f75-eb951feef7cb',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '64ddf9ba-f86c-4c2c-8e76-acdf76c9523d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f178069b-82db-4a01-9f75-eb951feef7cb',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '4204d595-92fe-4d2d-a16a-f791c4bf33ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1159914-cda5-4832-871f-d70ae62b45d7',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a070bfca-62dc-4c2b-93e2-a35448688c05',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1159914-cda5-4832-871f-d70ae62b45d7',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '04fc1759-ef32-43dd-9112-d255bf59b630',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '93ea4bc9-0647-432e-ac72-58c44e1bb594',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '85ea4dd2-afca-4948-9e11-927b8931f3ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '93ea4bc9-0647-432e-ac72-58c44e1bb594',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '0d95ff64-8508-4c83-9ef8-8f0950da6407',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9839cb2c-8ae9-474d-b6cd-592d8f5d1349',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'ce865a68-7169-41b4-b5e5-5b45940ad2e8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9839cb2c-8ae9-474d-b6cd-592d8f5d1349',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'd072687d-c24c-4cc9-be85-d3cd1d45b8ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a1eec449-7d8a-432b-8af7-85f0760a141d',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'a67bec14-1b94-47d3-9ccd-c202f047c747',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a1eec449-7d8a-432b-8af7-85f0760a141d',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '40d152f0-07a5-4bf0-8590-0ef89a50ba8e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b7a7d12-c8f0-48f5-a6db-81a9ce084044',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '8c989e28-2c2e-4f10-9cea-90e41527fbd5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5b7a7d12-c8f0-48f5-a6db-81a9ce084044',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '67d4d82d-5a77-4508-aaa9-dcc6ca504515',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '63f10e6c-25d6-40a7-a4e8-2a6ee2799c6f',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '6a8056b3-655c-4d1f-bd13-7c486425ebd1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '63f10e6c-25d6-40a7-a4e8-2a6ee2799c6f',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '050a54f3-50cc-4200-ae3a-68db1965d88e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '751a9936-33f4-4bbb-a5e8-5d3ae7041662',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '13af23c6-f5f8-4812-b8c3-79242a2b06ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '751a9936-33f4-4bbb-a5e8-5d3ae7041662',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'ff0b3bf7-0240-48ad-ac94-a7d30cb86ded',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '37f6aff1-214f-4040-a926-3659105d68ef',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'd0076286-eb3f-4930-957b-7a755a7b26ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '37f6aff1-214f-4040-a926-3659105d68ef',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6cfd5e38-ade1-4c84-bdb3-3ef1617a55c8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62a9d73b-787d-465a-9b3b-65edb566c979',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '8246fb03-1e21-44cf-b287-087ee33897cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62a9d73b-787d-465a-9b3b-65edb566c979',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'b1a99966-dce4-47be-8e42-fa9c9855b1bb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ca8c7013-353d-449b-93a6-e9535d203a99',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b3f853c9-bcd6-4ff1-8901-26cf4d698fd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ca8c7013-353d-449b-93a6-e9535d203a99',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3b3ebfc3-1b59-458d-9107-463792d93e45',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5631d9f9-4c9a-4519-9f29-6d7eac08932e',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '7f45ae82-17ac-4f74-bf7f-70a798fa43db',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5631d9f9-4c9a-4519-9f29-6d7eac08932e',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'e040c139-f4f6-4b9e-a7a2-e3d13ce3db8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb2f4992-6f21-40c7-acc5-e7a3aa08d557',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'e46c972a-8fe2-4fc1-88ce-72ee2cc71a26',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb2f4992-6f21-40c7-acc5-e7a3aa08d557',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '82993ed5-bad2-4ba9-9504-39cb2b9cf95d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0a3932db-4299-40e8-84e4-23c9bb80eee3',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '97eb51e4-3b26-416b-84a3-369f11a1655b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0a3932db-4299-40e8-84e4-23c9bb80eee3',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '573a7648-bd15-48e0-add4-4fd339c6c4bc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2c3d218b-60c9-41e3-82df-228dddddb810',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '22887c9c-ec25-4de5-b8c1-8a332cb94ff9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2c3d218b-60c9-41e3-82df-228dddddb810',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '39fab9b3-c76b-4397-8ad5-927ede23fd42',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7d8ee9df-f8fb-402f-bb9a-aed3919bfd4f',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '6e91bf0d-02dd-4c63-8fa3-43ed4d830c09',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7d8ee9df-f8fb-402f-bb9a-aed3919bfd4f',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '0f6b33c7-3704-43d9-8e81-5fb8ca27f74d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac1c26cc-7a7a-4946-b7d3-4d60cdacfdac',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '083b51ae-357e-483a-b7cd-ce8c17115fb9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ac1c26cc-7a7a-4946-b7d3-4d60cdacfdac',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'ad26b6b3-d8fc-47f0-b551-3b3bc6a58c55',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09e3885b-d975-4bc4-9698-5ba49b273aca',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'cddc05dc-7dd2-4ba7-b1e4-282396874677',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09e3885b-d975-4bc4-9698-5ba49b273aca',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '3d0ad2e6-316f-47dd-98b9-21503d1529d0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '57071e40-a77c-46cc-931a-77882f05421a',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'b6922f29-cf1b-4745-908c-96963afb5860',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '57071e40-a77c-46cc-931a-77882f05421a',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '125881a5-2b35-4535-96d4-2594b6e0525d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5559021a-8332-4f29-aa91-b4cc4b740121',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '25dc33bd-8c08-49db-905b-667529cdac7c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5559021a-8332-4f29-aa91-b4cc4b740121',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f921620a-7853-4101-9602-093fe03a0299',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a5fcd17d-cbe0-41de-a4cc-6d9b9f1fe032',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '52c75abb-6b92-47f1-b81c-367d934a0e32',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a5fcd17d-cbe0-41de-a4cc-6d9b9f1fe032',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7328f6cf-2e30-44ec-9940-0b989cfba1ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c84fc511-5608-45c0-b695-960369a64c0c',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '0b74ad2c-c1df-492e-a2dd-728fcf7203ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c84fc511-5608-45c0-b695-960369a64c0c',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '05534127-ab7c-409f-ab68-595ed01e8854',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '863d2028-806e-49e5-8055-3171ab39d9f8',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '7ba1c3eb-d33c-4ab8-b3c1-f176c6e581f7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '863d2028-806e-49e5-8055-3171ab39d9f8',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '4a11070a-83d6-4819-b452-1b282abf7707',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1cb7a74-d7eb-4b06-b562-014f15bec6c7',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '05f59c7f-0cec-4c3c-ba01-4cf010e31396',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd1cb7a74-d7eb-4b06-b562-014f15bec6c7',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'b636a68d-1877-443d-9b42-411f62e29ed6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '233447ea-f96d-47a9-9037-192d292f534e',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'c723393e-968f-462d-a22e-e088cb781de7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '233447ea-f96d-47a9-9037-192d292f534e',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '4ff96c26-9ea7-48bb-ab31-1f48b10256fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8d7b37c7-d071-4074-96d0-445f09b397f0',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'f4c8950d-b4e1-4bae-abc7-b1aa8f87379e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8d7b37c7-d071-4074-96d0-445f09b397f0',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '0f862764-57f2-4b30-bcf7-7957cbcc26b3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0fcd9898-e7af-4121-90fc-5a374f4ddda3',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '536fb6af-4833-4421-9077-5b55dedc5b93',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0fcd9898-e7af-4121-90fc-5a374f4ddda3',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '8e07eba6-1be5-43b4-9a96-2e8438f425ae',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2bccf87c-89a4-4931-9dcc-0a7d1d4b3d38',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'd722ad8b-bee1-43d6-8ab6-96aa736df9aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2bccf87c-89a4-4931-9dcc-0a7d1d4b3d38',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '17a12b8b-225d-43c0-8f58-c86cf999c010',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4fb7e92a-7d84-492b-b9f9-b49a05d4312d',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '2d3a3335-cd05-4a49-bfb2-6198ba240838',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4fb7e92a-7d84-492b-b9f9-b49a05d4312d',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '7c9da177-92ed-44e9-a8de-03ddabe662cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5ebcd1eb-c5a3-4a4e-a506-38b695e7bb0b',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'd0bbdc1f-742a-4e8b-b3b4-47c2d10dc359',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5ebcd1eb-c5a3-4a4e-a506-38b695e7bb0b',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '849393cd-f4c4-41dc-a155-3c723dcf9063',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14ae6ebb-ad3c-467d-9f7f-a438a0fd1414',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'c33594d1-ccb4-4225-aa30-9327355ac797',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14ae6ebb-ad3c-467d-9f7f-a438a0fd1414',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'd6cf6772-cf81-4420-8cd6-06c1837bc25b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8171aea3-627f-4d73-b7e2-2f6eaa2799f1',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'db420036-9366-4487-af76-bd5c74fc6793',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8171aea3-627f-4d73-b7e2-2f6eaa2799f1',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '60c635a7-71c2-479e-8f1b-39c3457dc032',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee1db988-cea5-428f-9806-5a29b813c2b1',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '045f9649-7a6a-4523-a4ce-e578aed53472',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee1db988-cea5-428f-9806-5a29b813c2b1',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'f2e56b0a-93f6-4c35-b9e4-3e04bf2dd9d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3c3e341a-e556-4401-8d30-2ee71f19a268',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'a839946e-d2df-4911-9b6c-90c144d7f742',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3c3e341a-e556-4401-8d30-2ee71f19a268',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'bfd805d4-811b-4d85-b840-a1981dc279d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b8a75d7d-549c-4eba-89a2-5727947758e2',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'ba68c729-05e3-4b94-acd6-a90fc4b61ca3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b8a75d7d-549c-4eba-89a2-5727947758e2',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '9bbef925-be94-478b-b3d7-ae2865cb04a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3eab79a8-d6e3-4e71-a24a-105cad5c1919',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'd981724c-3b89-40fe-890d-72ab6c5856fb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3eab79a8-d6e3-4e71-a24a-105cad5c1919',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'ccdb5511-5359-4c50-9a8d-c093120a6636',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7211b789-6e3d-4574-942e-6584dd7d8c97',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '8bc97508-79ca-4a00-b63c-e27b6193694d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7211b789-6e3d-4574-942e-6584dd7d8c97',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '07cf9ea7-27b0-4d1d-804b-e49a439e85b8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd2f23b00-3051-4804-bb54-e1d11abde92a',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '6666d9cf-e444-40c6-817e-3cb9cb0d7e0f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd2f23b00-3051-4804-bb54-e1d11abde92a',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'd0dbb13e-94be-4c7c-b705-c9f57cba1628',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bed4784b-9a63-4e06-8338-658d6028e142',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '3f48fe23-c344-4aa1-9c43-74461361fa7d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bed4784b-9a63-4e06-8338-658d6028e142',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '8b79050c-3408-4256-b443-01b44e3873b6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '12bf11c1-78e9-4ffd-8f0d-b3eab3e0b33e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '4b6c4cfd-9cf1-4a00-a8b1-28964cb0bb9d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '12bf11c1-78e9-4ffd-8f0d-b3eab3e0b33e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3f98ed79-5e46-4f6b-9a20-267091276f10',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9e765415-fc15-4872-80ff-6a1346bb739a',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '0552d013-c35e-4365-b6fd-df517c510962',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9e765415-fc15-4872-80ff-6a1346bb739a',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3b40325d-1338-4a08-b276-f7484f72e453',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f06f44b7-da59-4654-b19b-ff4cbc7cc8e8',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '5e04327d-c812-4971-89dc-991404179c95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f06f44b7-da59-4654-b19b-ff4cbc7cc8e8',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '1870287c-e2b8-466d-97c5-ea832555c7fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6579027f-8b21-4a6a-86c9-b01acdff1636',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'ccc71eb0-9600-47cd-b06d-e9a15895e515',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6579027f-8b21-4a6a-86c9-b01acdff1636',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'ab5ba02b-04d7-4ac7-88b4-fc83f2f402da',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9e0742b5-3bbf-44ef-8f8e-f4bc5b0539ba',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'aceeff98-01fd-4de1-9d5d-ccce6df0fdbd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9e0742b5-3bbf-44ef-8f8e-f4bc5b0539ba',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '8825a7f8-f5d4-43f9-8a84-d274ee21bccc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a421073-ad81-477a-94a9-d516e0ea497b',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '8bd3dfef-d567-43cf-ad0b-3632c0f3a4a2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8a421073-ad81-477a-94a9-d516e0ea497b',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'bcfe3779-bcae-4cbe-b1d7-7846964bd4b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '894a2d1f-d1c0-46c6-aae7-0512bfd4a4ac',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '093a9f63-f9d8-42c5-809c-42d58eaeee8e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '894a2d1f-d1c0-46c6-aae7-0512bfd4a4ac',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '7a3b672b-cc21-424e-96e3-fde956076634',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '16fab9a9-6c64-43a7-b803-25b8faab8a4e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'cc88e0a0-9c57-4fdb-a4aa-37cdb51d7e73',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '16fab9a9-6c64-43a7-b803-25b8faab8a4e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3767df5a-cdcf-4977-8b36-fa37e46d607a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f991b50e-c8f1-4e44-81f8-5c4827ca08de',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'b522c213-0fc1-4e93-92ad-29cce3610006',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f991b50e-c8f1-4e44-81f8-5c4827ca08de',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '0b2ffdb5-4507-4745-9dc7-2c4b7e3eba3b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85e3f79b-e94e-4c34-a61d-c5d8bdbe243f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '7d517c1b-c2a9-47aa-afa5-708f8653a997',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85e3f79b-e94e-4c34-a61d-c5d8bdbe243f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '365881ab-43cb-415a-bc0f-c775bbe00c26',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2c859910-37df-4313-b4fc-24ec134ec9b9',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '6ff9c562-fe5a-49f8-ac44-2c158697f4e6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2c859910-37df-4313-b4fc-24ec134ec9b9',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '8e1cd84a-e968-4676-8e3a-7a340298c5e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb6e8344-7a2a-4f6b-9f6d-3bc15edd413d',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '01dca16f-61ed-4539-8f34-6574b569820b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'eb6e8344-7a2a-4f6b-9f6d-3bc15edd413d',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'e8ef0e93-5025-4833-8e27-2da06fcf0148',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3924c0d-961f-4775-83a6-2e0e4673dcc4',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '33dbfef6-2c2b-4c03-b74a-a5fb27c856d9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3924c0d-961f-4775-83a6-2e0e4673dcc4',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '6d15758f-d02c-48ac-a640-0d1f0d73fe36',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '22efb88e-05ec-4de8-8ecb-11a902892a27',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '2fbd8d06-b29b-44e7-a641-f2882a024bde',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '22efb88e-05ec-4de8-8ecb-11a902892a27',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'dd72e956-04fc-4136-b146-5bc1657ef920',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '524d38c9-f8e8-476c-90d0-f461939890b7',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '7e1648ca-2ad9-40ca-b46f-8689273da410',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '524d38c9-f8e8-476c-90d0-f461939890b7',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '50f68e79-f79a-4848-b0ac-b3f14e4d94ca',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'afe3d1ec-e498-41d9-bbd3-0718aa3cfd87',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '0ca23faf-cb66-4914-99e0-a5a69bb3555f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'afe3d1ec-e498-41d9-bbd3-0718aa3cfd87',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '4c6602a2-4684-4f7a-bdb9-70c6ac6fa00b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b53fc22d-a83a-4644-b9a5-4e2f731e2501',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '43c3b1d0-2143-4577-b5b0-3fd6f202cae9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b53fc22d-a83a-4644-b9a5-4e2f731e2501',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '600e56c7-76d5-494e-ba2e-543b55253c9d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4e1736f8-092c-487c-8360-36002e0e04fe',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '1932aff8-f2e2-40b8-bd6d-72317acaafcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4e1736f8-092c-487c-8360-36002e0e04fe',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '25e07451-9d56-452b-b7aa-4613fa9570ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd3fe5689-68f1-4114-8313-bea2d2421b02',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '67becb2c-1bd4-4925-b098-ff39b3a7cf9c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd3fe5689-68f1-4114-8313-bea2d2421b02',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '3bcd7378-228c-4a20-97af-0e93728af236',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '10510d99-61bf-4715-9fd7-868e39a8589e',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'a195f53a-ca97-41c1-b087-7501ac2dabdc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '10510d99-61bf-4715-9fd7-868e39a8589e',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'da5ab4d7-a502-4ef1-a55e-d87748411c8b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf9c2bd2-5445-4e95-93da-6b4065bb75df',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'fc9088f4-d4fe-4168-9150-d9ff5704ea0e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf9c2bd2-5445-4e95-93da-6b4065bb75df',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3c055c9d-ef16-40bd-b567-36be31c7f6e0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1506cb49-e4e4-4a3f-9750-d387f0359922',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '9dbf91eb-e178-4aa6-829e-c8cb7315eccb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1506cb49-e4e4-4a3f-9750-d387f0359922',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '66b87695-7fd5-4005-b3af-75e5c750a76f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cbc8363-be76-4db0-98b0-79fd559655c4',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'e390e8ef-0094-46e3-aec1-4a19db28e63a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cbc8363-be76-4db0-98b0-79fd559655c4',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '589bb39c-2897-4878-af88-81cf93ab1ef0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db2b94e3-e6a2-42ca-bfe1-d4fa23cb3c88',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'a2cf6f25-19bc-4f81-bb65-d370c310407c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db2b94e3-e6a2-42ca-bfe1-d4fa23cb3c88',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'e03bf3ae-737d-4d23-8b2d-25c39d94e154',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5588621a-2e5c-47d0-bc18-37f2887865df',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'cb51c43b-373c-4adf-b835-c222490e4060',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5588621a-2e5c-47d0-bc18-37f2887865df',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'bb790988-6e50-40b4-b2fd-116142875f45',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80ef86e7-5780-49fe-a88f-1bc2f5c03471',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'b5fda2f0-b861-404a-821f-bf6c59b8141f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80ef86e7-5780-49fe-a88f-1bc2f5c03471',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '0faa498c-ce19-438a-8bb1-8257db834aaa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db2b506b-7eef-4e67-b7ce-61780cab33e9',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'e9bcfdd4-0e56-4148-bada-89af5c0396ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db2b506b-7eef-4e67-b7ce-61780cab33e9',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'd30c8ff8-b7fc-4bda-83b6-0999842d9f74',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5969a71-7f31-4562-ad8d-b8123822396c',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'b8fbe066-4728-4081-87e1-612d52ec1ffb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5969a71-7f31-4562-ad8d-b8123822396c',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '6d30f451-8930-4d6c-990d-d273d0f15377',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e303af9d-1b06-4d6e-a377-31b9e68d4827',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '2fb369f9-7b5e-432a-9d14-d12bdf5f77cd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e303af9d-1b06-4d6e-a377-31b9e68d4827',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '28c0ebcd-8317-49ff-a31b-dd394c42e651',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '13e750f9-b8aa-4b69-9dbe-5cf677ed8e92',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '423b37fe-715b-4380-af44-e017ede8554a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '13e750f9-b8aa-4b69-9dbe-5cf677ed8e92',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6e1a38f9-0cee-489f-8348-ce933f99fed6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7fd76b6b-9077-47c9-84cb-adaa1474c4a5',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'b0a09cfc-da83-44b1-a722-1c31951c9a92',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7fd76b6b-9077-47c9-84cb-adaa1474c4a5',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '58b9368a-31aa-4b24-9090-c929aa154b95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4ecb959-6622-4133-83bd-d6f0a63e0318',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '5aa8251a-55fc-43df-9a87-f9353808f56f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4ecb959-6622-4133-83bd-d6f0a63e0318',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'e4630db0-ef08-4ded-b5ea-98e3c3614667',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '642f122f-3e5b-4643-8e86-5e1911ab1cde',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '9070d9fc-c58b-4154-a1c8-5be4069568ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '642f122f-3e5b-4643-8e86-5e1911ab1cde',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'c6b5f3a6-e639-4a6b-9d51-6b522048b200',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '514be9cd-ff50-4ef9-b30e-47e0ba103d4c',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '1748b4b5-7841-49f3-92e8-dee251944adc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '514be9cd-ff50-4ef9-b30e-47e0ba103d4c',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '8e3c1e2a-6241-43bb-96b6-3f9cf0b5ab0f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1a7fb8cf-8715-4e37-8239-ff9f96250bcb',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '490e6c10-9af9-4f0a-95fa-01f7064cf270',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1a7fb8cf-8715-4e37-8239-ff9f96250bcb',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'e5e40744-cc74-43f4-9501-38779c54731c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f12291c3-029b-4d25-9967-a9d18a158bfd',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'b4fc66e9-36f0-4a4e-8870-9b548f5d9f59',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f12291c3-029b-4d25-9967-a9d18a158bfd',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '8fbbe6f7-ca0a-4ddd-95d5-56684e7a54ba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '500276d8-6a95-47d0-9acf-66962bd839c6',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'd2a5170a-f9ef-47ec-8b68-b18c57bcaed6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '500276d8-6a95-47d0-9acf-66962bd839c6',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'a06d9e64-8b43-43e4-a5dc-3b40dc46007f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '612ae013-0037-41ca-abad-518133953116',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'e3dcda0a-ee5e-456f-b619-f31a668fbaab',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '612ae013-0037-41ca-abad-518133953116',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'eea9d89d-a382-4cd5-8ebf-2c21acaee101',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1114eeac-a56e-45d4-b582-2beba037f986',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '23406cb3-a214-4dba-a627-f54db748c1f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1114eeac-a56e-45d4-b582-2beba037f986',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '23ab79b9-e0ae-47e8-abbc-da153762369a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6deb63bd-ddd8-40dc-9d64-cfc1fb7fc14e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '2a517930-6a34-4875-96cc-1e8a131707fd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6deb63bd-ddd8-40dc-9d64-cfc1fb7fc14e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'aacebca2-451e-4e5e-901c-ad7af3b0108b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f93dcb88-fd33-4a7e-ad4f-1282e2c5836a',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '9e178829-cb9d-41ae-853a-dd15ff226394',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f93dcb88-fd33-4a7e-ad4f-1282e2c5836a',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '7b598754-9c17-41e0-be78-1d006e3331e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cc0d0596-5722-44c4-839d-11df211cd3dd',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '1a0e5372-0221-40d3-bdc8-416132aba240',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cc0d0596-5722-44c4-839d-11df211cd3dd',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'fb153735-cd7e-4a07-9c39-807c40fb8ed1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd92499d6-3977-4492-bb4e-654c63f4b38d',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '81ceaba1-e2e1-4af9-bfaa-46aa50e03c6c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd92499d6-3977-4492-bb4e-654c63f4b38d',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'cb6f29cb-0f4d-41c2-b426-a42442ed5f1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26cf0f5d-312f-4c1b-b34e-be3c69818486',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '022f14bc-6892-426d-a265-d9da829d1cba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26cf0f5d-312f-4c1b-b34e-be3c69818486',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '179043f7-dae6-4244-a07f-32aae7a373a8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f5a2238-1597-42a4-b6e7-582e92389d17',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'f69ac436-a8c2-439c-a36e-e3dca540bb3c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3f5a2238-1597-42a4-b6e7-582e92389d17',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'e17a6a4a-3996-45ee-9627-484c78567855',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ce23c8d-afb9-49d0-b9e9-0c15d426fba9',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'd88b3b11-28bc-4ecc-abdb-3fbd30cfb7f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3ce23c8d-afb9-49d0-b9e9-0c15d426fba9',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '045cf66a-2667-4b02-a961-befbd8807fc4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6af5703d-9815-4b3d-971c-1e88474c54dd',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '7e975394-62db-4f90-9795-b254831ea74e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6af5703d-9815-4b3d-971c-1e88474c54dd',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '48bc18a9-a7f9-4af1-a790-5f55ed38d2ee',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b5c180a0-2d82-4be7-b336-78da22166871',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '9dca5e1b-3dac-4e7c-8ee6-9a28c093922c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b5c180a0-2d82-4be7-b336-78da22166871',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'fde26e57-38c5-458a-9c88-3d02a7112d88',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48c58630-f31c-478a-9922-7227b8b15641',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'c9a37e93-4330-4c33-875c-163137e6d3e7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '48c58630-f31c-478a-9922-7227b8b15641',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '98398570-6adc-43cf-bc96-4dd640f68bfd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bfc53ca2-9808-4716-83ea-da7aaa9eac16',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'd790407a-cac8-4c0a-a68b-bcb351771456',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bfc53ca2-9808-4716-83ea-da7aaa9eac16',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'e7f42e1d-edfb-4035-86d4-3714c864c26f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8089df1c-d867-4c4b-a7db-b7dd3b441774',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '37e557cc-d6e1-445f-b880-3d72afbf92e3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8089df1c-d867-4c4b-a7db-b7dd3b441774',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '055619dc-4890-461f-9f8e-062995e4b437',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '47f359f3-183e-4a96-ac1d-da47920739d1',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'bc0262ec-a81e-4832-991a-85bb85b25ee9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '47f359f3-183e-4a96-ac1d-da47920739d1',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '31069d8e-7457-42be-bea0-11c8a176314e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '91429234-52fd-46ec-a4cf-34595e7d3495',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '84cc0be6-f2e4-4e4b-be41-313758361d02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '91429234-52fd-46ec-a4cf-34595e7d3495',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f0663b14-f4c7-4ba6-af7e-2447fcd03a3b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab5d0deb-229c-48db-954a-361661deb26e',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '8a14003a-2107-45cb-9330-bb2cb6f36a23',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab5d0deb-229c-48db-954a-361661deb26e',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '1edbfe6c-36bf-4a5e-b76f-7d3752649dff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3e7715fc-52c0-44d1-86aa-ce996a4d3db6',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '94257b9b-2f25-43b1-bab9-495c40885874',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3e7715fc-52c0-44d1-86aa-ce996a4d3db6',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'ca86b280-84a7-41c2-9d46-8223e615d419',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cace9310-0e40-4b6b-80d9-38e4ec4b71d9',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '71d5ac19-333c-4bac-9846-9d59df18fdf2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cace9310-0e40-4b6b-80d9-38e4ec4b71d9',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '153cd5cc-dda4-478e-ac97-adebbf2c2265',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fbc2604-3b20-4fd5-bfdf-1c043bf42d0a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '9243ee93-ad9b-472c-9631-42be5a2496c0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9fbc2604-3b20-4fd5-bfdf-1c043bf42d0a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '18b6a2b2-2fe6-4acf-a7f7-bc2acf530288',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '677bc4d1-2d17-4676-8dc6-f830c6a85236',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'd9544548-0340-41f9-bf6e-fe11fb6101a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '677bc4d1-2d17-4676-8dc6-f830c6a85236',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '2dc69b24-3fb3-410b-bbd4-c4578fa9835d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '73831335-c47b-4b58-9fa8-ea23a02dcc7f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '2e3f3157-9423-4cba-a71a-db3a08cb839c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '73831335-c47b-4b58-9fa8-ea23a02dcc7f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '1f268b7c-9167-4712-bfee-1fef3a1e21b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '042bf074-a7b7-48b6-a540-62657fe7078e',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '88ffebd8-f862-425d-b52e-ad3fe20b5da2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '042bf074-a7b7-48b6-a540-62657fe7078e',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '7bc8daba-c8ee-4875-8762-291d849e9108',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80c99383-c0e6-4ad0-a6a0-0df8a8d6ecdd',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'a835ee0e-6780-45e1-a47f-223c833f7ac3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80c99383-c0e6-4ad0-a6a0-0df8a8d6ecdd',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '823f2a05-b794-4243-82b2-65fc2befe601',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1cfb7357-8884-45a7-b99a-1940608ef105',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'fba277ba-345d-449e-b760-e7e0c497d2b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1cfb7357-8884-45a7-b99a-1940608ef105',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '8aa94fca-6c9c-494c-bd8d-f77395342563',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'baecd063-2eac-4c96-9823-5c2d0d60f1f4',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'fa624653-f67b-4dba-b4fb-53fd1a7d3a34',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'baecd063-2eac-4c96-9823-5c2d0d60f1f4',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'eed8dd91-0319-4fa4-a01a-c1225f90b9e2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fd3e39e6-3024-4142-9ad6-a58a64edb655',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '28b25f0b-11dd-4293-bbc4-8b449eea1097',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fd3e39e6-3024-4142-9ad6-a58a64edb655',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'c90f3a31-5e97-401d-aa41-3c361fd9d2fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9dc29b09-8e71-4105-bee9-dc91765d21c4',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '50605d88-4490-4a23-a062-4006f7c3902b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9dc29b09-8e71-4105-bee9-dc91765d21c4',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e43be9a0-f564-4178-abcc-019b6298f097',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '00d91c9b-b586-4ead-8706-1ccd9e891a25',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'fadb3e6d-1262-4398-9d6b-ec3bf67e6e8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '00d91c9b-b586-4ead-8706-1ccd9e891a25',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'e237dc06-d1bd-4067-96e4-d7db9af7edf8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abf88335-88f3-46ea-b5b4-a54cafc31595',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '5bbfeaae-0ea7-49d1-aba1-a70c72644c77',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abf88335-88f3-46ea-b5b4-a54cafc31595',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '0d65a93e-cc00-4d4d-9186-b046f1afeeb4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '18236f26-11aa-4bde-adb7-a4b3f299e282',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '48d4dd67-3e7c-4185-a3d3-610d2630603b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '18236f26-11aa-4bde-adb7-a4b3f299e282',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '12a7cac7-9992-4b03-a6e5-f23b9bac7246',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7e54a28b-86e7-4185-b27f-dfb84c5885c2',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'ade7548b-b5f4-46e8-86d0-6eb50d744ba9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7e54a28b-86e7-4185-b27f-dfb84c5885c2',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '85a9e4ab-c2af-4a85-a0f8-f472adf6f4ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '49b7f410-c850-43c8-9951-69d76527292b',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'aa4fbab3-8074-49f1-9960-6c97c2a10a49',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '49b7f410-c850-43c8-9951-69d76527292b',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '06eca1e7-8971-4002-b597-85111a79eea0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a92cd94-70ff-4beb-ab28-c185fb5b03cf',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '16299e1a-f5f3-425b-8231-8bed76cf0331',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3a92cd94-70ff-4beb-ab28-c185fb5b03cf',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '7cbf88e1-fce3-46b8-988e-85ec5a910b49',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bb5220b9-cb6f-4ebe-9087-eb1164f33257',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'dd0417ee-c213-47a9-9c73-e8085790a199',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bb5220b9-cb6f-4ebe-9087-eb1164f33257',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'c5132c3f-e2ff-4708-9055-d7efdcbda496',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '68c00d59-b786-4610-ae2d-ce1a1ff4daea',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '184c881e-ee80-433f-b306-5986e9c3eea5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '68c00d59-b786-4610-ae2d-ce1a1ff4daea',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'aea528de-62df-401b-926e-2ea60f65cbff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '163bc3ce-ebbd-49bd-aaa8-fcffc5ceb1b2',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'cca4b75c-ec94-4ba3-b973-b04a18004085',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '163bc3ce-ebbd-49bd-aaa8-fcffc5ceb1b2',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '4fd76ee9-b577-4d5d-ae68-6d3d440a4caa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5f83e3a4-7611-4f13-b5e0-4fc4709149aa',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'a74e99c6-4a27-4f7f-93b4-6d859fd7689b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5f83e3a4-7611-4f13-b5e0-4fc4709149aa',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3b34eef1-cae5-437c-b83f-9d62b360f47c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e31c30d7-4d99-4c9c-8353-9144d3c11d34',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'e5125ff9-1b2c-4542-b836-a8977ff32fa8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e31c30d7-4d99-4c9c-8353-9144d3c11d34',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '65a92114-f476-401a-b809-f36d42cf57e9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94adab5b-5354-4fae-bb66-09f9582e95e8',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '1936dccc-51c5-497c-afae-88122c26b0cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94adab5b-5354-4fae-bb66-09f9582e95e8',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '8b4ad1b4-356d-4c6d-b766-e6e1fa382cd1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '848068cb-acba-4779-9a73-e56eeb17cfa3',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '91df2ce0-10d5-4d15-ad78-086155bfd01f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '848068cb-acba-4779-9a73-e56eeb17cfa3',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '3a6eb783-e515-49f1-8960-6e1b29939231',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '59f7b07b-d2bd-42a9-a8b5-e338450a582a',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'eeb5cd4d-f5db-44e5-b852-29de44d9420a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '59f7b07b-d2bd-42a9-a8b5-e338450a582a',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3e2d7bd9-cf38-4bad-be29-18d25018a7be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a0eb797e-fc7a-40ef-b168-fbd2a0313f44',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '883a5b96-8b36-4350-ace2-cd0816079080',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a0eb797e-fc7a-40ef-b168-fbd2a0313f44',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '814da421-8e4c-469b-8511-025b043fa5f7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8aa4b1ea-fd49-442c-9ff3-2b6a019299e8',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '7908813c-5d03-45d5-b070-03019f8c7bcf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8aa4b1ea-fd49-442c-9ff3-2b6a019299e8',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c6d1d777-d111-4b10-a8b7-ed3fc9797dc3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b56a80c6-56c0-4654-86c1-8770559b67dd',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'd524dab5-50c3-4fc8-ab86-5777a1adfbe2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b56a80c6-56c0-4654-86c1-8770559b67dd',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e1e071aa-a7be-450d-87eb-f3afb9200822',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44f68a65-7028-470b-a355-00f6bfa76405',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'dd5c32b5-4bbe-4928-b849-ba6c0bac6e47',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44f68a65-7028-470b-a355-00f6bfa76405',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'ed225633-0063-4426-a6a6-7918f2623e86',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4fc5472c-d717-4534-bac9-eb0a13dde946',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '3145d20e-7d10-41fa-836b-f10549210f0e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4fc5472c-d717-4534-bac9-eb0a13dde946',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '7f48af29-6345-4884-a4ee-2be0990019d8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '23d7b105-f03f-417b-87a7-5612c93cecde',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'b168730d-81d7-48fe-a04a-3a7217c179f3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '23d7b105-f03f-417b-87a7-5612c93cecde',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '0c3e061e-fc39-48be-af78-5056d373b682',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db695cb2-77d7-49c6-8fba-20267d508eb2',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '23d2bdbe-dfe0-4fe9-af28-e9e83969d406',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'db695cb2-77d7-49c6-8fba-20267d508eb2',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '5a73a498-b4fc-477f-a9f7-a93174ae2c62',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a0e262b-bce8-4295-83a8-f79470c5acd8',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '6f324163-556d-42a9-8f02-d60baac9a7af',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a0e262b-bce8-4295-83a8-f79470c5acd8',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'eb49a8d9-19f6-484d-bc79-2409aa91b5b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80b3b9e6-3c27-416e-80a4-f99a5f47dd06',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '1b225e3d-a539-46e4-8950-2a1a0e586ffb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '80b3b9e6-3c27-416e-80a4-f99a5f47dd06',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3238916c-ed7e-426e-8c47-b1b32158dff3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c5ac7d8-298a-48b1-a9fc-c5738c1e675e',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '1fe9440c-e0a6-48ac-ae28-8f3ead4b1efd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c5ac7d8-298a-48b1-a9fc-c5738c1e675e',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '5f52b43c-7a6d-40b5-9f86-4187ce2c9d97',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'da31f7c2-792d-40da-b02b-9cf79aa3f41d',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'eafa56e2-33bc-4aa6-b726-1356ba2830de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'da31f7c2-792d-40da-b02b-9cf79aa3f41d',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '89ba293d-a1ea-4eca-8bfd-11bb92bf2cdb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e99fbcf8-f9b4-4ee4-becb-29c206746bb6',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '08577bd4-44fc-48b8-ba6b-a8d8f91feedd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e99fbcf8-f9b4-4ee4-becb-29c206746bb6',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '92254441-0f12-40c3-bb90-ca1064c79a9b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a571a805-3962-48cf-9b5f-73dce81ba3aa',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '7dbd6d1f-5661-4032-b048-d6edfebafa10',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a571a805-3962-48cf-9b5f-73dce81ba3aa',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '3877bb15-f531-4bf1-ad1d-9bece75a33a1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '894798d2-aafd-480b-bffe-807544eb5090',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '8601fd7c-3b41-4c3f-a5ec-d12e7d6facc9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '894798d2-aafd-480b-bffe-807544eb5090',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'b5255c4a-112c-43eb-ac61-3e7e7567b033',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5507ec37-47a9-4c88-bf37-a145ad87218f',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'f7c45f92-0ea9-4faf-9589-5f6a99680daa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5507ec37-47a9-4c88-bf37-a145ad87218f',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '7855d205-590a-40f1-926d-a308b2e7b0a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b60922f9-e895-4a85-8b7e-13a9f465b5f5',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '7cbae27c-d034-49a0-8695-0dd0eac4ba5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b60922f9-e895-4a85-8b7e-13a9f465b5f5',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '67db9a10-803e-44d7-b8d2-ea244eb42a2a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '295353a7-a6d4-4992-8e54-16822238cd08',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '5b355972-5963-49ce-b04f-fc5bf7d277be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '295353a7-a6d4-4992-8e54-16822238cd08',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '2ccd6b3d-5def-49a4-a706-f5435a0bd26a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bb2cc3bd-6118-44a8-bf0a-587e03e75110',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'a311fce8-4506-40e6-9d8f-d9a3a9fcdd7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bb2cc3bd-6118-44a8-bf0a-587e03e75110',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'efeabcb3-5777-4325-a171-a1bf4c07c3fa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '65aba059-569b-4a45-91e9-ac58b0f68bb5',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'd7e74d9d-3a7b-4eef-ba50-5ef973d0a42b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '65aba059-569b-4a45-91e9-ac58b0f68bb5',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '93ca9983-349d-4be2-94e8-4364b1acded1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '45415bf4-4eb8-4adf-910b-c0876cb980ff',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '7e305872-734b-4fb5-affd-6e0f45940edb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '45415bf4-4eb8-4adf-910b-c0876cb980ff',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'db66da12-ab1f-407e-8f5f-0976406ddd76',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6b364304-ff22-440e-860f-5eb1b7bdb353',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'eaf9d308-561c-4d4c-90ea-375e20301ae0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6b364304-ff22-440e-860f-5eb1b7bdb353',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'e15f60c4-a07c-4da7-a962-023516075af7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fe5aefc8-cadb-4af3-931e-9c3681057760',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'c85c6ed3-efbe-496e-bff9-d4a2c2bbb52d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fe5aefc8-cadb-4af3-931e-9c3681057760',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '8a50fbd3-332e-4e2f-8918-c57dff12b063',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '19cde22d-2b3a-438d-9a19-ecedb92d6232',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'b2541951-709d-4f0e-848d-6ba97933db9e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '19cde22d-2b3a-438d-9a19-ecedb92d6232',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '90f5fc64-f59b-48dc-a30f-8a34f23060cf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5989bd0a-c74c-4ca9-a715-1fcabb323024',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'e6c6de53-4dcf-4a84-93b1-c7a35979145a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5989bd0a-c74c-4ca9-a715-1fcabb323024',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6325a25f-24e7-460d-b395-161c2d088ad6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aef4d75c-031b-4ba8-8584-727932ea84be',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '9eca1f66-f90f-49eb-80d3-ef8064b7e3b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'aef4d75c-031b-4ba8-8584-727932ea84be',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '03b9c53d-1c95-4164-86a7-b785aebba3e8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd54835e9-3fb0-4b2f-9f8c-e51cc6692e13',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '83b61035-c8f7-4dce-b691-083ab374c4b5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd54835e9-3fb0-4b2f-9f8c-e51cc6692e13',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'f2398f68-36ca-49fb-91d5-71b62ac97c26',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94ad773d-4e6d-4059-a4aa-fd46a9b484c1',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'cbd22479-b861-48b2-8c02-495c425b7626',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '94ad773d-4e6d-4059-a4aa-fd46a9b484c1',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '3934dd5f-b8f6-44fe-b40c-a9d8615f028f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c8071aca-7ac2-42e1-93b8-7bd0c882ccae',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'bfb96e27-73d2-4115-8b7a-3bbd26c4fcd5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c8071aca-7ac2-42e1-93b8-7bd0c882ccae',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '9ee6802e-c77e-45c8-b2c5-05a26ccf41a4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '873275bf-7b12-4121-a467-27c8d9b27c96',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '8cc8aff9-83e4-4f21-b9b8-c706b87b2fd4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '873275bf-7b12-4121-a467-27c8d9b27c96',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '6194bfb7-d0e5-4fbd-bd33-321438e9b4bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b78ff244-45a4-49cd-be5c-5aff6d958d1d',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '3571324d-8379-4e42-870b-25115bb0df09',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b78ff244-45a4-49cd-be5c-5aff6d958d1d',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '1c3916b4-2dd4-415b-829f-2ace3092dbd6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0e170880-f1d6-4305-8b91-3edcabdf3261',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '71ec1408-2e50-4d73-bb00-07e5968f030a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0e170880-f1d6-4305-8b91-3edcabdf3261',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '8ab08303-26b2-4a7b-b9f0-ff5809297de4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09948eb4-bb4e-47fa-9b49-24df5de56e82',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '9f6bd9be-ee26-4d79-b441-2e3ae2d6f3f2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09948eb4-bb4e-47fa-9b49-24df5de56e82',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '1aba69a9-cb43-4dec-92c4-086334121037',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2963ef0c-3649-4425-b11f-27331b2033e5',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '93c7db54-770d-4b71-a9e5-ecb982084d64',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2963ef0c-3649-4425-b11f-27331b2033e5',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'df551a35-aa85-4f9e-957f-c116eb753ab9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a745e2a9-5a1d-442a-ae1b-68933bd37d8c',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'df9f2bb1-f802-4e80-8cf8-3d2b0d08ce15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a745e2a9-5a1d-442a-ae1b-68933bd37d8c',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '22c5d635-b461-4901-aa1c-14dbc3d2fdbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ec77487e-c107-49d2-bece-0453c82212af',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '5a2417ff-64bf-4a38-8860-1ab482c7742b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ec77487e-c107-49d2-bece-0453c82212af',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f428e45e-5c35-4274-bc56-f57ff60ad355',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3e69708-d951-4af9-8eea-9e36f321768f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a0905026-7ab4-4659-b92c-7c6079fb6e20',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3e69708-d951-4af9-8eea-9e36f321768f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '602e2e50-07aa-429a-89e5-265c4c3badb1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f9e8ccc3-7fe8-4c69-8a17-838b9c0240a9',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '5684ba5d-88b8-4485-a8b0-21c2fe5d2e66',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f9e8ccc3-7fe8-4c69-8a17-838b9c0240a9',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '956eca40-4d88-4974-b87f-9b8600b25fba',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '310342b0-3e5a-4d01-bc78-643288164c71',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '7474a1eb-c73a-454b-a071-3d12635d840e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '310342b0-3e5a-4d01-bc78-643288164c71',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'c7b514f2-dc13-4f7c-9c7d-0e4b34d56720',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a8ead168-878a-4983-9bf7-aa3dcb0bdfee',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a0bc9889-36a2-4705-9026-069019ac6f1c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a8ead168-878a-4983-9bf7-aa3dcb0bdfee',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'd31f4b26-74c7-4766-b2e9-09f567342158',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3536fdb-0ba3-477e-b3af-decd2db36ce8',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '63b72343-5768-45ee-9092-f4ce6a480ed0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3536fdb-0ba3-477e-b3af-decd2db36ce8',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '87f753dc-3d26-47d3-847f-c1b3d57f5c60',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4500c5a2-a017-46df-ab51-14993199d182',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '88c6cd90-784a-43e4-8ad4-8dca71b54f5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4500c5a2-a017-46df-ab51-14993199d182',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '4cd6d2af-bff5-4fda-9336-3e8d2c647978',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4cf24e54-adc8-4a1a-b1b1-3c1898289d07',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '2fef66a5-662f-4fd6-a718-232522d11e73',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4cf24e54-adc8-4a1a-b1b1-3c1898289d07',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'e84faa5e-c1f4-4907-983f-ed4186872a04',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '88154740-6bef-4a74-b1f3-9b8a4b3caeb9',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '321d543f-769c-48b5-b5b0-6954f8255b61',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '88154740-6bef-4a74-b1f3-9b8a4b3caeb9',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '05ab1c4c-2866-462a-ae98-c8e523d41f30',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '858ecbdd-8a5e-4abb-9ab5-113323667c4e',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '01e0ca79-1447-4b04-b572-0b890ab632b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '858ecbdd-8a5e-4abb-9ab5-113323667c4e',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '9dc7b18e-d261-4847-81f9-4b6907cfb28b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ec525d6-f61d-4026-a8ce-43bf32423e1f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'ead67ec9-d18f-434e-a2df-ea9c2e0313ed',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2ec525d6-f61d-4026-a8ce-43bf32423e1f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '4f3b754b-b116-4db9-bb9e-9ef7c878ed98',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2e56e871-31f5-4d5a-acda-3e13823c284a',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '9753ccad-84eb-4399-a12c-39c5adf6f3e1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2e56e871-31f5-4d5a-acda-3e13823c284a',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '020aff82-aab8-419c-b2f8-510fe0a7b1f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9391da0a-a0c2-414a-b042-58467bb51aad',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'd53f169e-743d-410b-9c02-d2497437447e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9391da0a-a0c2-414a-b042-58467bb51aad',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '694122ba-c6e1-4d2e-b477-6626dae51804',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '069aad64-e393-4383-8cd9-38294395d65a',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b0d63288-5f9d-4d58-ac3c-17c9b00f499f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '069aad64-e393-4383-8cd9-38294395d65a',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'c502eff1-b599-4127-9019-420af4b3859b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4735804-bdf8-4e5b-97d5-1f53946d10b7',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '235d8adc-8ffa-4b4f-bad0-cd2f3f808b45',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a4735804-bdf8-4e5b-97d5-1f53946d10b7',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '71f261a4-d8ae-4db9-bda5-2081896dff96',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1d7f06d-6a35-4710-bd16-7f743bc8e78b',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '7da17524-a67c-493b-9e4d-8e02a6637351',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c1d7f06d-6a35-4710-bd16-7f743bc8e78b',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '843030b5-a65a-4c8f-b2e8-43517785d679',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '088fba82-ce3c-4aba-8251-ee628eb7116d',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '4680c237-37b2-48c6-9456-184464eb4fd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '088fba82-ce3c-4aba-8251-ee628eb7116d',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '86ebf234-2e6f-4748-9a8f-c42590eb58f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '966cc475-1464-4828-8401-2c06eb28269b',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'ef115b63-1a3f-4284-a59e-f6dabd6bb3f4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '966cc475-1464-4828-8401-2c06eb28269b',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '262a61ef-0678-4a7f-bb09-b626a1d85b57',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cdb46234-c34c-4b1a-b84f-8e6121f7b522',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '731880cb-e77e-497f-857a-731fb57a993f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cdb46234-c34c-4b1a-b84f-8e6121f7b522',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'd4d842d8-d831-4c21-ab0c-9dace94a52a9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6bfd8cb-f722-469d-a207-9b5be5ee75aa',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '649ce333-e2a7-4e8c-8f73-1e8b3ee25bbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6bfd8cb-f722-469d-a207-9b5be5ee75aa',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '206fa699-6b3a-4703-b952-ae1dbe7441ec',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c008a485-982f-44e3-8317-a93e60032a18',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '598c383c-beb7-44d8-bca7-79346ac2c9df',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c008a485-982f-44e3-8317-a93e60032a18',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'b084a0de-2e09-4357-b572-c39758850a34',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '900461b0-a657-4a3b-94ac-de8cf5772ea2',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'f180caca-5ae0-4d65-943d-2481d510a48f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '900461b0-a657-4a3b-94ac-de8cf5772ea2',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '38824f42-d317-4ac6-bf96-2f6390e73224',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6340844e-9eb5-4a62-9a14-7628ef0104a5',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'f6e40f7e-df67-4dfc-8cdd-733f2aa9ef26',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6340844e-9eb5-4a62-9a14-7628ef0104a5',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'eb9936d0-75e5-4b2a-a7d5-850545e7c5aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30fbf78e-0016-486f-afdd-b35e6058b807',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '1fbc18f0-99eb-4da9-8948-95f5978b44de',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30fbf78e-0016-486f-afdd-b35e6058b807',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '464c1f84-f693-4011-ac5b-4b58a5cee179',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9b1d1a82-43fc-4f08-b35d-b8c6f0d95ff8',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '4d30dc15-babf-453a-afcd-cfe4c8c5aa4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9b1d1a82-43fc-4f08-b35d-b8c6f0d95ff8',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '1c867f7e-d15b-4476-97e9-f22dfdbd15b9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '79c0160a-4a43-4c23-89a2-047ea2973757',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '6a9eb77f-512e-4cff-aa63-4086bcabc598',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '79c0160a-4a43-4c23-89a2-047ea2973757',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'beb3202d-9365-4d39-830a-cf5a8cdd0500',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5988286-2bd6-46b3-af27-112ed76f9fa4',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '8ea5de36-a397-43c1-8ce1-bd852ca66462',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5988286-2bd6-46b3-af27-112ed76f9fa4',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '2b33fb3e-de09-42cf-8e7b-56c165f16a48',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5efc1dcb-cda2-4f63-a7a5-ccafc446a104',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '857c775f-13aa-4f43-b9cc-f66be85e6736',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5efc1dcb-cda2-4f63-a7a5-ccafc446a104',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'd13eee78-a04b-45c3-91c3-96e1e30a69a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5392ca1-fe6c-45c6-9557-c01ccae80ae8',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'db345f8b-a903-42b9-bf2c-b8fce5efc005',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e5392ca1-fe6c-45c6-9557-c01ccae80ae8',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'cf3e50d5-9882-423b-856b-9ce476782742',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6653550-6780-4922-bbbb-59158805fb11',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '95a80fe4-15c2-4e29-ba9e-ef58dbf697b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e6653550-6780-4922-bbbb-59158805fb11',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'eb46d752-90c9-4099-a23d-09b3bad70657',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab9b1084-a923-470a-a7df-25642f3c6c5c',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'ed9cf5c8-b6d4-490c-8911-9bb73d9951f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ab9b1084-a923-470a-a7df-25642f3c6c5c',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '47d66096-cf35-456e-9c22-f35e209f1a83',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '121f2133-48f1-47a7-921b-0018f1e70643',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'fd0c11f0-0b46-4712-9fab-4de9e9d5cff4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '121f2133-48f1-47a7-921b-0018f1e70643',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '548888d6-65ae-47f2-9e45-352ddd91e9a2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '15fefbb9-90ef-45f8-83b6-03ec3a3ab6ea',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '1c4cac54-b07a-41ee-b3bf-f98181023549',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '15fefbb9-90ef-45f8-83b6-03ec3a3ab6ea',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '6e9b3bf4-2af9-4f80-8f5e-64d9f9a35a5b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '74b77fc8-6d67-49e4-8fc4-8dbb8965bab5',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'be927c36-41b3-46b3-8366-08392d5ebab8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '74b77fc8-6d67-49e4-8fc4-8dbb8965bab5',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '46182635-92b5-4b4f-94c2-c89fcbb7b036',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7812a69e-4461-48ba-bd9a-67ff9119f331',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '286fe422-dc64-45b3-9c30-e0cab95a179c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7812a69e-4461-48ba-bd9a-67ff9119f331',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '5b2dfa53-aa38-4243-9cf7-32a78941658f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f31321d1-e2b6-43e4-8d41-3cf69acdb1ed',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '9bb1ec7f-5f0d-428c-9a53-8fa5949df267',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f31321d1-e2b6-43e4-8d41-3cf69acdb1ed',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '5e01676f-5ce0-4f38-b3d7-b08f1a9ac399',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '43673d31-6c0e-4e86-ad5a-7ff6357c8bd2',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '9fec24df-b123-46be-9ef2-12d0f4693ed9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '43673d31-6c0e-4e86-ad5a-7ff6357c8bd2',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'd7f9e5bf-3223-491b-8d24-c4dbfbfff159',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40a6cdb4-8e3f-4ff3-9910-a11c54bb8e06',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'd38d3511-94b8-406b-9b2f-236fc1c66bfa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '40a6cdb4-8e3f-4ff3-9910-a11c54bb8e06',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'eb8d186d-a904-4939-821d-028538f6b7bd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0df97aa6-b802-497a-bcbb-09bbac2170a4',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '12539bf9-28a7-4dbc-8645-e0737e40754c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0df97aa6-b802-497a-bcbb-09bbac2170a4',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'aca5e521-cc4c-4997-8dee-bc22842c3e24',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '906d2204-623f-4d8e-bbc0-5c1473ce233b',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '5b62d345-fb0d-4794-a3f3-083f3791f274',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '906d2204-623f-4d8e-bbc0-5c1473ce233b',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '9054addc-2ea7-4004-89c6-5aebfa80b104',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '92f45775-c557-48a7-b0b3-d6f72a821804',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'f1159b59-afdd-4dd8-b49f-e91f76559a72',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '92f45775-c557-48a7-b0b3-d6f72a821804',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '8c76667e-2503-4053-8ab4-ac594a611890',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a2b1ac83-f18a-4342-8b99-c1da5f19e75b',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '2157965b-337f-4532-ab92-5b946b8d120e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a2b1ac83-f18a-4342-8b99-c1da5f19e75b',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'ca6a0c89-d0ba-4383-adb3-5e4b584226a3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8dac84a8-3432-4643-9e9e-2950a0995408',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'a9b98512-73d7-4c21-8bd8-83ade012ad15',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8dac84a8-3432-4643-9e9e-2950a0995408',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '33163857-fa40-4db6-be9d-6ce72d79f15e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7953b6ef-0733-44c0-8a39-37a209fd364e',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '1ed13482-3076-4ac6-b313-a4122883efce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7953b6ef-0733-44c0-8a39-37a209fd364e',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'eb2fab6e-ce3b-451e-9cbd-17e2c72f45ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd4330ec4-80f0-4e6b-bbb5-4278ac2360dc',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8f3dfb96-3bc7-43b4-a232-8088eb0547be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd4330ec4-80f0-4e6b-bbb5-4278ac2360dc',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'fe0d9402-f500-4e12-8889-87b9c572b2aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c81c923-733a-4292-bef0-99083c404fae',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'e6ab23a9-5197-4738-8c16-89b9d4e58f48',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c81c923-733a-4292-bef0-99083c404fae',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '8cb98238-7ff0-4827-960f-fd239572a61d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f850308a-ace7-414b-9663-ace7c4c94b53',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'b07871bd-af6e-46f8-be28-8b70e14caad4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f850308a-ace7-414b-9663-ace7c4c94b53',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'a7b67a5d-2a42-4439-9559-0457275f311c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a9bc972-0bc3-41c5-a8e4-ce82287bc6e0',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'a0fa8029-87b1-4e44-9ee4-1ffabab7c134',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a9bc972-0bc3-41c5-a8e4-ce82287bc6e0',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'ba58f4f4-26df-44bf-b0f8-3847389a2d67',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14527b10-b3a7-48d5-8429-4868abd55483',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '8a649baf-e011-4cec-aa8b-128fa6388731',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14527b10-b3a7-48d5-8429-4868abd55483',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'd9d563b7-671a-4b81-8a21-1a02bb556f7a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a7ba47d9-3ded-49e1-8d5c-a5488417ed87',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '39dd1030-48fd-4a9a-bd9e-3e58327ecff5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a7ba47d9-3ded-49e1-8d5c-a5488417ed87',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e8fae991-730c-4cb9-9738-7a3377dae45c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6f205cac-a096-4e21-ab4c-b57e58184973',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'fd9646ea-f9d2-49d9-9446-e69ec0bf8f35',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6f205cac-a096-4e21-ab4c-b57e58184973',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '39352b41-041a-445d-b6e6-6cec02437543',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7b704c14-58f1-4bf3-a324-724470055f4e',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    'cff97d38-eaaa-4558-95c5-7d1676c5769b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7b704c14-58f1-4bf3-a324-724470055f4e',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '00f44863-bb80-4b14-8fe5-15d63c8dd799',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8b309c11-fb18-432e-a7ee-921eac3a4e2b',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '907bbf87-7c94-4803-96f0-d5052c93bd18',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8b309c11-fb18-432e-a7ee-921eac3a4e2b',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '0b7f44fa-872f-46ae-bbb9-cf2895b722e5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abc943f3-de70-4ead-a442-b333d77ea29f',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '54f2dcb1-5bb4-40a5-9a89-2de9e2a8768f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'abc943f3-de70-4ead-a442-b333d77ea29f',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '5a361531-26bf-4f17-99aa-6f828de5906d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0e8770fc-ac0a-4cb3-b643-7b4d3b37a86d',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '539cacdd-5e4b-452d-8e00-66b3208f3c0a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '0e8770fc-ac0a-4cb3-b643-7b4d3b37a86d',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '83078e8b-f5e3-4f34-9ebb-88efc291eed4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3bce988-f221-4233-a211-309d49c44157',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '61fee931-ef1d-44f4-9e16-489b26b33652',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c3bce988-f221-4233-a211-309d49c44157',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '53182288-18d3-49e3-8d9d-51c7d621d363',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c3d3e46-5e99-429b-82f0-855a8bdd6166',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'de4fbd27-34da-4b5e-a00f-89fc8f718885',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6c3d3e46-5e99-429b-82f0-855a8bdd6166',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7ed2520c-19fe-431c-9600-4cadcc6ec4fc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '154a1545-a713-4e0c-bac2-3e19c61014c3',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '3b276bda-1c5c-4f58-8c41-082cc02389fc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '154a1545-a713-4e0c-bac2-3e19c61014c3',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'e3717827-b699-4006-802e-d41375295056',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dba4d194-fd55-49e4-84ed-b3a0df2f29a5',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'db6382ee-40c0-46d9-a4e1-7cae4fef1c5c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dba4d194-fd55-49e4-84ed-b3a0df2f29a5',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'ade18239-c335-447b-824a-bea8d848285a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c8d68823-a7e9-4231-9881-a3ed1b5bd656',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '9552bdcd-570f-4378-9881-f75b8118e768',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'c8d68823-a7e9-4231-9881-a3ed1b5bd656',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'fb02d46f-24ab-41f2-b1e3-1edc27b7f20f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e914b6c7-5c1e-410c-b91c-01c34bc10604',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '20e0e009-b223-454e-8998-ad4648d4017d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e914b6c7-5c1e-410c-b91c-01c34bc10604',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '2c8bcd29-7465-421f-8b92-55772f64e262',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4f74c18a-4bd7-41b9-ba7a-46ad0d151b03',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '7c68025c-1d99-4824-89ed-8aa14f646a58',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '4f74c18a-4bd7-41b9-ba7a-46ad0d151b03',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '7616f3cc-de59-4154-af6f-55bb3c490089',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bc9dae8d-0e6e-4447-8b4e-6b3b4b00d523',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'd6bd5e38-fdc4-49c5-acb6-04ec32f3647b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'bc9dae8d-0e6e-4447-8b4e-6b3b4b00d523',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '5514d529-7a72-4470-86a9-f792586e947f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9b59cd69-2dbb-40c5-a047-501a7bc2c693',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'f52cb701-3cd7-441f-a7bb-ead26715fa88',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9b59cd69-2dbb-40c5-a047-501a7bc2c693',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '4d989664-4a09-4dc7-8ead-43ff7c497478',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df2a943f-5fc5-46f0-af33-48566cef005a',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '1e033e29-8d42-4e2a-ab9b-2e0f59bc0931',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df2a943f-5fc5-46f0-af33-48566cef005a',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'e1cedf88-eb9f-4a0c-90ae-65c1287cd1f8',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b58a08a7-e8ca-4b4c-9482-9c9ef551419a',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '629650a3-ced2-4d6c-a5ed-b1da0e8dbdea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b58a08a7-e8ca-4b4c-9482-9c9ef551419a',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'e93aae58-92ea-4b31-8298-eb9038461bdc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ccaa693e-e719-44e1-bd37-d934f51f5c03',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '1c8c9e1a-cf0f-4950-bd9b-9cda8f05be8f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ccaa693e-e719-44e1-bd37-d934f51f5c03',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'dcbbaa2a-5cd4-46a6-964d-6f9eb2fef62d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09f02bff-e797-451e-a791-cdc7054b4feb',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '458f983c-a533-402a-9ed5-5756e7d07988',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '09f02bff-e797-451e-a791-cdc7054b4feb',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '0fa22176-30f4-472a-ad3a-44abfc4dad91',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14e5d1b5-95f5-4f13-ad80-5063c3195e3f',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'c6188372-f036-459e-b0c5-64af9ae1eadb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '14e5d1b5-95f5-4f13-ad80-5063c3195e3f',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'e18169fa-780f-4252-8a80-9e750b23a41a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '953c2ae3-ad25-4a18-be41-7adcabba3ed6',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'c05d48ef-7064-4f8b-a090-08877588b186',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '953c2ae3-ad25-4a18-be41-7adcabba3ed6',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '2ca485f2-617e-4d9d-81d3-f55099c5fe19',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df284e1e-55db-4aaa-a91b-b3a0cc8394fd',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'bd709425-3977-4c54-9e3e-4472bacdc1fc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'df284e1e-55db-4aaa-a91b-b3a0cc8394fd',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'f8ccc68b-5761-427a-bd9e-02637e2e796a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2b445dd2-05da-44fd-aa5a-d8078e02eb5d',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '24cfeee2-6c82-4eae-9d51-ff85fc1bf4a9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '2b445dd2-05da-44fd-aa5a-d8078e02eb5d',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'c246d28a-82cd-405b-81a7-e6fa19f8e6ff',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3795ee76-23f8-430c-ae10-d7ca9385e84f',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '9d20a5ea-50b0-47f5-9b81-54e2cb354d43',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3795ee76-23f8-430c-ae10-d7ca9385e84f',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'a7b958a6-f9f9-43c4-8aec-79a77bc713dc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '29fc1096-2c58-45fe-bc16-f954dbbe0c2a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '2fe16352-0293-44b4-8f2b-84cb62b5c7dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '29fc1096-2c58-45fe-bc16-f954dbbe0c2a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '4f6d39c4-401f-425f-b7bb-358a57ec7ec3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd80302a6-db31-4808-a004-941bedd1eaf5',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '5f3f0034-8f75-4aac-8e45-38a97c380131',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd80302a6-db31-4808-a004-941bedd1eaf5',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '3b5d32da-98ae-4253-92a2-aac5d03be85f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9f5eaf60-210c-4f01-8024-00b6ee713278',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '9b45b606-9461-4491-b383-69d48e932eea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9f5eaf60-210c-4f01-8024-00b6ee713278',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '2643d3b2-1cea-4fe6-93a1-d6dfb9883dfc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9aac3713-5dd1-469c-a49f-088f0d490a3f',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '3a3fee24-31c8-41ad-9565-4c56de582147',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9aac3713-5dd1-469c-a49f-088f0d490a3f',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'b36687f5-bf0f-4825-922f-ca57bb59d304',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fe12bc8e-df0c-43f0-a63a-058f545e150f',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '7aac07bd-6d0a-4a09-8de6-03002852a3f9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fe12bc8e-df0c-43f0-a63a-058f545e150f',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '637cc1b5-550d-4cf2-ae0b-43d9b316c15d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '45e831af-243d-4a24-bf95-b40fe875dab5',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '058d1b6f-80fa-4820-83dc-cd64cdbc300c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '45e831af-243d-4a24-bf95-b40fe875dab5',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '3bb6ec18-e72c-4283-bc4a-79b817c37413',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'adbea53d-a735-45ae-ad46-6f029473d69d',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'a45dc58b-9148-4821-af5a-dea2e27d5f50',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'adbea53d-a735-45ae-ad46-6f029473d69d',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'c8b5b1c1-b65f-43d0-a431-d20fe4360072',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd6ab1b99-7092-43fc-9e37-b7b649ca2e83',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8a6e03a7-fcef-47e1-83b4-8db8b7678b58',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd6ab1b99-7092-43fc-9e37-b7b649ca2e83',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '39dc0439-c2fb-429d-9b33-1cb87de60b30',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd05cbf5e-8fa4-4973-a4f5-a0dbc99ea71a',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'd09b2053-b022-4f44-8198-e350138ed7be',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd05cbf5e-8fa4-4973-a4f5-a0dbc99ea71a',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '7ab3cb38-20e7-4a4c-9d1b-53d744803212',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f21b60a9-90d6-4643-b1b4-c672fe840ee5',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'fd71b4df-e8e1-4920-acc1-c95b2f0aee23',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f21b60a9-90d6-4643-b1b4-c672fe840ee5',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '74d820cb-7edb-40db-8435-66b17dc5f7a2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1df61cd8-905e-44b4-a191-57359a402e45',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'a1611896-079b-41d9-9864-43663457298e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1df61cd8-905e-44b4-a191-57359a402e45',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '183d40a5-b816-42a5-91bf-a20dff37d320',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd944a5d5-5564-488f-96f8-579e13cbe79c',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '1ff298cb-cd6b-49a8-86c5-c3d8e39820c7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd944a5d5-5564-488f-96f8-579e13cbe79c',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'fd3f13cc-aa0d-456f-8413-5c7bf35b0764',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd15ea5a0-fd39-4c3d-82ae-4adcc9b0577b',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '8cec6b50-9020-40b1-88eb-4915321a0e8c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd15ea5a0-fd39-4c3d-82ae-4adcc9b0577b',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'ba9e6e52-ce87-46f7-a5be-031660e39755',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e41a9cca-40e5-4a38-89b7-e034a64988c3',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '8f73b321-5f28-4fa4-9e68-351196edaa5e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e41a9cca-40e5-4a38-89b7-e034a64988c3',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '5491dcad-6e2f-4d2c-85b0-6e44520f8190',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30ede533-abf9-4ca2-bff8-b8b55136f293',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '05b686d2-0a03-4292-98bf-94c66085a05c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '30ede533-abf9-4ca2-bff8-b8b55136f293',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'e1f99ac2-fb27-4447-ad3a-5c91ffa562f6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '813b4150-264e-4983-bb75-cead3f63f83b',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'f34c289e-1719-4d58-81a1-4b79687545dd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '813b4150-264e-4983-bb75-cead3f63f83b',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '17ab63a4-7421-4acc-80b1-68e748dd4c42',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5def6f83-07a6-425e-bff8-3d1d2fa34220',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'bfd21377-2f81-49fa-a2d3-ffc41b1ea396',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5def6f83-07a6-425e-bff8-3d1d2fa34220',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'bfd1dcd8-a6be-44f7-88c0-6749bf8c3d12',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85ffe234-18ff-4330-a9e2-fd3c8a57cbce',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '1b5836d6-a771-4ba0-aaf8-1e142bccf6d1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '85ffe234-18ff-4330-a9e2-fd3c8a57cbce',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '362f1cfc-1a1b-4748-8ee0-45a613a9d16b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dd49c85a-af21-4a64-a272-908a35ffcf56',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'ac0392e5-560f-40f5-acd7-4ca594227143',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dd49c85a-af21-4a64-a272-908a35ffcf56',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '55b84e1d-a71a-4d44-90eb-f58c8371b857',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dee1dd30-1b62-4f02-b4c4-4d76a4feceab',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'd55cc05e-b7db-4f07-a822-8f7e079d1c4e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'dee1dd30-1b62-4f02-b4c4-4d76a4feceab',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6cce9f7d-f25d-4c7f-9d2f-c6f0fd6dc530',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '92c218a6-7cec-405e-806a-dd2ff63e731b',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '1990d614-3f7f-4bc5-a2d7-7dfa2254a4ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '92c218a6-7cec-405e-806a-dd2ff63e731b',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '8f2fc261-08b2-4442-bcce-146b28f3fed4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a453ac18-0702-441a-abfe-9c98ec7a1049',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    'ed33200a-3534-4807-8e9b-c5486236d7cd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a453ac18-0702-441a-abfe-9c98ec7a1049',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '8898a6ea-447a-40fc-9eaf-a7bf54404030',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee6176fe-4c37-4817-8850-6b3d055bd108',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '2cae259e-e624-4f2d-a8cc-d3d894d34404',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ee6176fe-4c37-4817-8850-6b3d055bd108',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '0e1ec28f-f0a2-45b6-8402-b8a6601fc86c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '67a3dac1-1698-4a06-9c35-f0bc051bd859',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '3ed113e3-7e58-488d-ad7a-c7d312d24050',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '67a3dac1-1698-4a06-9c35-f0bc051bd859',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '23c96a25-ad20-4372-a9b5-267aa156d04e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '051ed646-f892-408c-8b34-b0cad3495e04',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '5d7eba64-1495-435a-9eee-7f0ff008fd41',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '051ed646-f892-408c-8b34-b0cad3495e04',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '4efa8adb-88c7-4a09-966e-d8eb76fd904a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '850bff5d-986a-4ac3-b3f5-88f0be4ff916',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '773e0e0e-933c-4159-a176-f96cf26eca54',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '850bff5d-986a-4ac3-b3f5-88f0be4ff916',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'e236d75a-b60b-4734-87af-30007a69c962',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b7266d80-6b78-46ef-beca-e51b0e06054c',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'cafffb33-1dad-4424-bc36-53f81a622838',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b7266d80-6b78-46ef-beca-e51b0e06054c',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'a7746bf1-1f99-4162-be54-c85d471dbaf1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '108dcc3a-4046-4286-a07b-78e46735775b',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b0d7d14b-3a41-48b8-9d9e-eba17da2b8dc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '108dcc3a-4046-4286-a07b-78e46735775b',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '07970460-ff57-4742-8c26-92ff2f96d07f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62f880d7-305b-4f1a-8c2d-ce347c0eca8d',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'c2f6054e-cecb-4b0f-aefe-e5124b2cccbe',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '62f880d7-305b-4f1a-8c2d-ce347c0eca8d',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'a3550b78-de0d-4187-af0d-84f8d2be27a0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '39b2eb6a-6cd9-4e47-84ac-0ed99ffd5861',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '406e1cfc-70ee-483d-8994-d8e94afc0e56',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '39b2eb6a-6cd9-4e47-84ac-0ed99ffd5861',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'dce67d0c-19aa-446c-82cb-b465a134ed28',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '51575b3d-46c9-4d37-a09a-be42a56bda54',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '431cce04-d961-4d19-b316-2625361ae652',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '51575b3d-46c9-4d37-a09a-be42a56bda54',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    'd6003e78-7db9-49b6-8daf-32d052b04c2f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e8406cd8-39f9-4cc8-a3ae-48049340cc1f',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '89898cdf-5e27-40b4-a756-4fbbda7eb254',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e8406cd8-39f9-4cc8-a3ae-48049340cc1f',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'b8487448-12d8-4b50-9748-4c1da0daec6e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd2971700-3da7-4c8b-b618-81729d9ad2d8',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'bc2c75dc-45ea-4bc5-a444-a0671f565c70',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd2971700-3da7-4c8b-b618-81729d9ad2d8',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'cfb57cd8-2bc8-46ab-9bde-6cc805c499c5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3cf75d17-638a-429b-a3e3-a2d8c04cc692',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '31d5af12-8694-42ce-ad4f-1adcb9af5cbd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '3cf75d17-638a-429b-a3e3-a2d8c04cc692',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f9493c0e-9e95-4b28-b69b-38138975c04e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e0853c37-fdb2-49a0-a4bc-1123792695ff',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'c22d6740-8533-4785-be8f-fe5f127c028e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e0853c37-fdb2-49a0-a4bc-1123792695ff',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '64d04d14-b769-425d-bbe3-98711e684402',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '636e0e4c-4e50-4020-80b2-cd7b82ddbaf7',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'a5fd076d-97f4-4d34-93f6-17e02b94e1ce',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '636e0e4c-4e50-4020-80b2-cd7b82ddbaf7',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '6316ef9f-ae9f-4f1f-8bdc-56a7c7151780',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fb18feaa-2989-4490-8c47-746b86636661',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'd97290c4-bb06-40a9-ac25-d6911fdff375',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'fb18feaa-2989-4490-8c47-746b86636661',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '8530165a-fd87-400e-b6ac-0767bbeef416',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '93f503f6-17f0-42dc-bfd0-05e249ae3300',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'c4a782ba-6bda-4f7d-bc48-ef5b473e0c5a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '93f503f6-17f0-42dc-bfd0-05e249ae3300',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '7512971a-3a51-4e8f-b423-4b2c7101cacf',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '60e5ee39-f1a0-4e21-aa36-e92c525042d0',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'c6399e9d-46fd-466e-b095-8ec3c7e555b0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '60e5ee39-f1a0-4e21-aa36-e92c525042d0',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '520a18e3-91a8-4987-8dba-0512d71f114a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cd6532b-668e-46a4-bf9e-06bfb318680d',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'fcd6a37f-8fc3-4d13-93c5-9cc743e6256e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '7cd6532b-668e-46a4-bf9e-06bfb318680d',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '4d7776f3-30dc-4da4-9dcf-b1d0f4c45f02',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e4eaca1e-0463-476b-a0f1-a45cf32ae6b4',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '552e5459-0a79-419c-b08a-055f79cb5e4d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e4eaca1e-0463-476b-a0f1-a45cf32ae6b4',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    'fd459b10-4892-43ce-b869-eca6388c6fd9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5166ad7c-47a8-4703-b8dc-d86491c767e8',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '98b2b129-cf31-4f19-8438-e938dff580a5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5166ad7c-47a8-4703-b8dc-d86491c767e8',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '0d572cda-4e79-4ab6-bf65-1636266ea304',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5410bb18-e802-4aa0-bb83-4bc52379048e',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'fdd363b1-5ef1-4899-8b2a-751759fdfc98',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '5410bb18-e802-4aa0-bb83-4bc52379048e',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'ba5a21de-479e-48c1-8724-6761a020c994',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1b9406fd-9d33-4438-a321-5de58664ec9a',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'dadf8710-749a-482e-90fe-8b395d6b0525',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '1b9406fd-9d33-4438-a321-5de58664ec9a',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    '6643eb6e-2000-40ee-b9b2-b3ee7f2e0ec5',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ff885275-0c11-4bf7-a40b-0277bc3b7b02',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'be53c346-7d76-48a0-b534-00ed2a62bb60',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ff885275-0c11-4bf7-a40b-0277bc3b7b02',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'f6dfdd81-bfb2-4890-bbae-1fed362d5df4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '653b362d-fec9-4173-ac97-fff801a556d4',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'c456e4d9-f7ce-4b60-9995-406092867439',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '653b362d-fec9-4173-ac97-fff801a556d4',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    'dbc9ac9e-bec9-49d7-bdc0-9a7c0814a4c1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b4c26323-6594-4d3d-9477-098409ce8691',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    'ba4a6160-0d3c-40ac-a0aa-adf3c38e6d1f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b4c26323-6594-4d3d-9477-098409ce8691',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    'f875e11c-120a-4505-9f01-57a48c6016ea',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '815ecb1b-27f5-4444-9fb1-c3d3f79e639f',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '473add5b-b127-418f-b6af-e221f9b2dd07',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '815ecb1b-27f5-4444-9fb1-c3d3f79e639f',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '01e1e84f-00fb-4fb0-b08c-d4dbb1eb0a35',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26de55d4-8ed7-404c-bc68-04f7ccfeb225',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'c9528bc2-2e5e-48c4-848c-f3d569ccb0bb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26de55d4-8ed7-404c-bc68-04f7ccfeb225',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'ada350f1-4b63-4f30-ac99-72c357bd4612',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf21f96e-1486-46a1-b3bf-190160f08d56',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    'a2e0835c-17b0-4126-8fa5-2628c52a2a7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'cf21f96e-1486-46a1-b3bf-190160f08d56',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    'e2df6870-eaad-4c3d-8632-b8f42827489d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '993f8bb6-f65a-48f3-82ca-ef9e0e355f33',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    'd7d291fa-dc0e-414e-9c27-1ce7f54e51b4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '993f8bb6-f65a-48f3-82ca-ef9e0e355f33',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '102a1031-1585-49e5-b66b-db45915dee2b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '66571ba2-2dc6-4958-a914-4208696064d0',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '4b3a674d-6ca2-456f-a2bd-fd56524d1ac1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '66571ba2-2dc6-4958-a914-4208696064d0',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    '4f32abb5-b1c0-4903-a6e7-36f4f1cc6479',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '640182f4-a844-4d7a-9c68-b475a026eaad',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    'f09255f1-7b50-4e62-8e26-994d4b5a3d7e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '640182f4-a844-4d7a-9c68-b475a026eaad',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'cc9877be-19b7-4a16-b450-42d3437ab3e0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b46979b3-5abb-4627-93d4-e36dc20c49be',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '22cc20d5-2256-45a0-b04d-7981128f9b16',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'b46979b3-5abb-4627-93d4-e36dc20c49be',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'f6684f31-65b5-4baf-9308-7cce7bd28c2a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '334e5c79-e5a0-400b-9750-a3975c296d3c',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '468acf84-c116-4bbc-9c74-aaec196afc29',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '334e5c79-e5a0-400b-9750-a3975c296d3c',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '13586d06-74b7-4144-92db-0f4211331680',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ff03f3f5-86d8-480f-9538-a7dd352013ac',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '9b3cbf48-a6d4-4caf-8036-3d5982c2bba0',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'ff03f3f5-86d8-480f-9538-a7dd352013ac',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '190762b0-f7b4-43a7-bb82-0d3bd13d544e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e36f7468-7007-44b6-83d8-a2108f3415aa',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    '2dc1892c-da74-4a52-aea7-1423feca26c3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'e36f7468-7007-44b6-83d8-a2108f3415aa',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '348a45c3-a074-43ec-ae41-9184a47915b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a9fa62e9-be70-428d-b6db-c5f0a1df9a66',
    'user',
    'router',
    'Produk terlaris minggu ini?'
);


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
    'b4b3b2c4-06d5-4805-bab7-a4babb6ebab9',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'a9fa62e9-be70-428d-b6db-c5f0a1df9a66',
    'assistant',
    'copilot',
    'Latte merupakan produk terlaris minggu ini.'
);


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
    '74427588-124c-4046-b641-d691b156e825',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd004e50c-ba0e-42c0-b4c3-a1c010de323c',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '4f3e5d61-cef7-43e6-81f8-9980f7229077',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'd004e50c-ba0e-42c0-b4c3-a1c010de323c',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '9dc2a452-2bb3-47fa-8654-400aa907973f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '743dec34-900f-4ca4-b955-c7c625f4fa42',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'f61fb8bf-f8f5-4fc9-ac3c-3ad8d3770451',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '743dec34-900f-4ca4-b955-c7c625f4fa42',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'fe677fbc-742a-4732-be32-290262bf9a98',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f95f0480-6fa9-4563-9597-b3ff22140789',
    'user',
    'router',
    'Buat caption Instagram.'
);


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
    '3cb9a14e-549c-430b-8434-784dd314569f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'f95f0480-6fa9-4563-9597-b3ff22140789',
    'assistant',
    'copilot',
    'Caption Instagram berhasil dibuat.'
);


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
    '8bf55353-8ed8-4477-8b90-e208c6493fd3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a4c64b9-2c9a-445b-b88b-b3678c469198',
    'user',
    'router',
    'Tambah stok Croissant.'
);


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
    '5b57cb21-57d8-44d2-b8a5-85607c1e99b2',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '6a4c64b9-2c9a-445b-b88b-b3678c469198',
    'assistant',
    'copilot',
    'Stok Croissant berhasil ditambahkan.'
);


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
    '5005bc41-9c34-4fed-bf35-14af990aba52',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c810d86-5a58-4bd6-af5f-630750f6e498',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    'b8357297-9532-4737-a93d-9330d4746cc7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '8c810d86-5a58-4bd6-af5f-630750f6e498',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '9aaa5742-7368-4bb5-870a-175c66155fbc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44589d0a-b910-49c2-a65a-7f73b43d16d8',
    'user',
    'router',
    'Produk apa yang perlu dipromosikan?'
);


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
    '9609a090-2b2b-400f-b46e-615133817e51',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '44589d0a-b910-49c2-a65a-7f73b43d16d8',
    'assistant',
    'copilot',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '832ba60f-4a09-4df1-855f-4d4c46fed486',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '402eac62-6c37-4892-9982-96271392f29e',
    'user',
    'router',
    'Berapa transaksi bulan ini?'
);


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
    '221a47c5-b040-4670-81aa-1f99273db928',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '402eac62-6c37-4892-9982-96271392f29e',
    'assistant',
    'copilot',
    'Jumlah transaksi bulan ini meningkat dibanding bulan lalu.'
);


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
    '5c3ca032-1ab9-44de-8f33-91b11de60537',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '219ce42f-5933-41dc-aa03-462873695d50',
    'user',
    'router',
    'Berapa omzet hari ini?'
);


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
    '66f3937c-246d-4aa7-abb2-300412d5e939',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '219ce42f-5933-41dc-aa03-462873695d50',
    'assistant',
    'copilot',
    'Omzet hari ini mencapai Rp2.450.000.'
);


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
    'acee758f-9cf7-421d-b197-6f756692a8eb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9d055a4f-c902-436e-b1e1-8b958548ea56',
    'user',
    'router',
    'Bagaimana penjualan QRIS?'
);


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
    '601fa37c-5387-4ce1-89ea-caa43d794837',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '9d055a4f-c902-436e-b1e1-8b958548ea56',
    'assistant',
    'copilot',
    'Pembayaran QRIS menunjukkan tren meningkat.'
);


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
    'c3a018f3-6f8d-48aa-bbdb-e0344f5255a4',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26526bcc-88d7-4bbb-bb31-677102ad394c',
    'user',
    'router',
    'Bagaimana kondisi stok?'
);


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
    '14d354f6-865a-407a-a5ee-03c351b73b75',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    '26526bcc-88d7-4bbb-bb31-677102ad394c',
    'assistant',
    'copilot',
    'Beberapa produk berada di bawah minimum stock.'
);


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
    '721ef164-ae45-46e7-a210-7d82429bbab6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    'e1e3ae9b-3aea-4669-8db8-9e7b3af1c39a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '6cb6dfb9-0bc2-4b9c-8c06-99418c25c929',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    'e074526e-5341-4803-8268-79b694959dfa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '965e31be-72a7-4f1f-bdfa-740c5e2c949a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    'ae0f9ab3-6441-4bdd-a946-e9ab5bb92d5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '66c724ab-3ed3-4a17-92b6-765044ac76f3',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    'da0223b6-444f-42a4-8502-ef63e01be82f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '7dfa9680-35b8-4fd5-82a5-e1755a414ac1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    '3d998c2e-1f98-4780-bc5b-59c81eb1e743',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    'e0b61565-b717-4b53-a8dc-b50256b57c65',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    '811185d5-1d2b-45a0-afa9-e3a47341f36b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '1be15eba-1dc2-4e09-b7dc-a5bf1a9d2f61',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '7a56a0ee-2f3b-4609-960e-f9c49bbaf747',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    '38bb1667-97c4-4b04-a92f-ce15d24b4b4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '4543435c-d976-491c-bc1c-53239513813e',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '52d8db07-ed0e-4aa2-b770-044e66ed6f95',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    '6e79f4fe-0656-4067-927f-95576c692f5f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    'aa96e3be-d4a7-4792-b6ea-93c510002a1a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    'f66c8520-a624-419c-8043-ce56ef5b6d92',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    'd5e1a53e-acff-4573-a8b2-3b9b073e4cbd',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '458524f9-9d86-4fc9-8e39-df2ce5955a4f',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '99ca5cc7-f670-4ef7-a644-3a7902c99eb1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '5af1e5bb-0603-46e0-be93-0bb04b3e02d6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '35a08825-6157-4c62-a648-1e25bc299586',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '13751eb1-69d4-444e-8af2-f932dcd793cc',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '6bea7880-f703-4795-aef6-a276de5a0334',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    'b3eaae33-c41e-40ff-bb59-9776ed76f93c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '01f32a52-2588-481a-877a-65aab97b863c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '3384eb55-42b2-44fc-8ed0-5f726e8ec0aa',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '70f273b7-831e-4a72-b10d-b55fb0f47125',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    '466550b0-dc23-4980-a28e-1c9a0c7ff721',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '10a1241d-4dfb-44a7-acfd-572897ab5b13',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '60871f43-2436-4e6e-8db4-6943c2c81271',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '1c9f3029-5f08-4c04-a773-b1fb1558c6b1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    '2e5b3bff-e8ff-4f44-be44-dfdfcdc0a123',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    '5e86cdc4-77ea-43ec-9b5e-11a5aad8f30a',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    'a3d93ee4-2f22-4d53-af25-e8ab8c9c0097',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'Produk Kurang Laku',
    'Brownies memiliki penjualan rendah dan layak dipromosikan.'
);


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
    '9434df30-2c46-44b0-b952-58539671759d',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '88b04ca7-30f8-42d2-8a06-4d0c978b8c90',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    'f454fb71-ea1d-444d-94e0-415fd186da4b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    '67f64329-7345-4a9f-9f09-eed94cd11fdb',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    'e3e7e6e0-9d3e-4195-9896-81ec29da1dc1',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


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
    '4c72f1e7-e3c0-4f04-82ef-fdd0efc4723b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Omzet Mingguan',
    'Penjualan minggu ini meningkat dibanding minggu sebelumnya.'
);


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
    'b048bf5d-2167-4432-be71-7b31e1d207b6',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'sales',
    'Produk Terlaris',
    'Latte menjadi produk dengan penjualan tertinggi.'
);


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
    '607db43a-76f8-4e97-8e1a-157b20942f0b',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    'fee8d45d-0d04-49b7-a7a8-19bb11715508',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'general',
    'Ringkasan Bulanan',
    'Kinerja bisnis tetap stabil selama bulan ini.'
);


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
    '25d085c2-fe39-480d-bfd7-b70c5cc3e92c',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'customer',
    'Jam Ramai',
    'Transaksi paling tinggi terjadi pukul 17.00–20.00.'
);


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
    '78d89e83-f109-4bda-b09d-e4037aac01b7',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'inventory',
    'Stok Rendah',
    'Croissant hampir habis dan perlu segera di-restock.'
);


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
    '8d5bd8c1-467e-46f4-99dd-33c20ae2a967',
    '1ef22d6a-a839-438d-a791-b6bc8428a3bf',
    'marketing',
    'QRIS Meningkat',
    'Penggunaan QRIS meningkat dalam 30 hari terakhir.'
);


COMMIT;
