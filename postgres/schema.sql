-- Banking OLTP initial schema (simplified)


CREATE TABLE IF NOT EXISTS customers (
id SERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);


CREATE TABLE IF NOT EXISTS accounts (
id SERIAL PRIMARY KEY,
customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
account_type VARCHAR(50) NOT NULL,
balance NUMERIC(18,2) NOT NULL DEFAULT 0 CHECK (balance >= 0),
currency CHAR(3) NOT NULL DEFAULT 'USD',
created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);


CREATE TABLE IF NOT EXISTS transactions (
id BIGSERIAL PRIMARY KEY,
account_id INT NOT NULL REFERENCES accounts(id) ON DELETE CASCADE,
txn_type VARCHAR(50) NOT NULL, -- DEPOSIT | WITHDRAWAL | TRANSFER
amount NUMERIC(18,2) NOT NULL CHECK (amount > 0),
related_account_id INT NULL, -- for transfers
status VARCHAR(20) NOT NULL DEFAULT 'COMPLETED',
created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);


-- Simple indexed columns for performance in queries
CREATE INDEX IF NOT EXISTS idx_transactions_account_created ON transactions(account_id, created_at);