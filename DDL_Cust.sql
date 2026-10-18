CREATE TABLE IF NOT EXISTS customers (
    customer_id     INTEGER NOT NULL,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    email           VARCHAR(255),
    phone           VARCHAR(30),
    address         VARCHAR(255),
    city            VARCHAR(100),
    country         VARCHAR(100),
    postal_code     VARCHAR(20),
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);