CREATE DATABASE cdc with owner cdc;

\c cdc;

CREATE TABLE IF NOT EXISTS borrowings (
    id BIGSERIAL PRIMARY KEY,
    book_id BIGINT NOT NULL,
    b_name VARCHAR(255) NOT NULL,
    b_address VARCHAR(255) NOT NULL,
    b_start_date TIMESTAMP NOT NULL,
    b_end_date TIMESTAMP NOT NULL
);
