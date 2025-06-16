CREATE DATABASE cdc with owner cdc;

\c cdc;

CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL
);

INSERT INTO users (name, email, address) VALUES ('Alice', 'alice@exa.com', 'Kali asin');
INSERT INTO users (name, email, address) VALUES ('Bastion', 'bastion@exa.com', 'Wiyung');
INSERT INTO users (name, email, address) VALUES ('Charlie', 'charlie@exa.com', 'Sawahan');
INSERT INTO users (name, email, address) VALUES ('Kanaya', 'kanaya@exa.com', 'Mangkubumi');
INSERT INTO users (name, email, address) VALUES ('Alex', 'alex@exa.com', 'Mangkubumi');
INSERT INTO users (name, email, address) VALUES ('Rigen', 'rigen@exa.com', 'Condet');
INSERT INTO users (name, email, address) VALUES ('Tiara', 'Tiara@exa.com', 'Depok');
