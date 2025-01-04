# Debezium Postgres Connector - CDC
This is a simple example of how to use the Debezium Postgres Connector to capture changes in a Postgres database and send them to a Kafka topic.

## Requirements
- Docker
- Docker Compose
- Postgres with wal_level set to logical

## How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/islamyakin/cdc-debezium.git
   cd cdc-debezium
   ```

2. Start the services using Docker Compose:
   ```bash
   docker-compose up -d
   ```

3. Register the Debezium connector by running the following command:
   ```bash
   curl -X POST http://localhost:8083/connectors \
   -H "Content-Type: application/json" \
   -d @connector.json
   ```

4. Check if the connector is registered and running using the Debezium UI:
   Open your browser and navigate to:
   ```
   http://localhost:8080
   ```

5. Insert some sample data into the database:
   Access the PostgreSQL instance running in the container:
   ```bash
   docker exec -it postgres psql -U postgres -d postgres
   ```
   Switch to the `cdc` database:
   ```sql
   \c cdc
   ```
   Insert sample data into the `users` table:
   ```sql
   INSERT INTO users (name, email, address) VALUES ('Robert', 'robert@exa.com', 'Tasikmalaya');
   ```

6. Verify that the data changes have been sent to the Kafka topic:
   Open the Kafka UI in your browser to monitor the topics:
   ```
   http://localhost:8082/ui/clusters/cdc/all-topics
   ```

---

### Notes:
- Make sure your `docker-compose.yml` is properly set up with Kafka, Debezium, PostgreSQL, and the Kafka UI configured.
- The `connector.json` file should include the correct configuration for your Debezium Postgres connector. Adjust the settings to match your requirements (e.g., database host, port, authentication details, and table/column settings).

---

Let me know if you have any issues or need additional clarifications!