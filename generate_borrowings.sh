#!/bin/bash

NUM_RECORDS=100

generate_random_date() {
    start="2024-01-01"
    end="2025-01-01"
    date -d "$start + $((RANDOM % 365)) days" +"%Y-%m-%d"
}

NAMES=("Alice" "Bob" "Charlie" "Diana" "Eve" "Frank" "Grace")
ADDRESSES=("Jakarta" "Bandung" "Surabaya" "Medan" "Yogyakarta" "Bali")

echo "Generating $NUM_RECORDS records for borrowings..."

for ((i=1; i<=NUM_RECORDS; i++))
do
    # Random data
    book_id=$((RANDOM % 10 + 1))
    b_name=${NAMES[$RANDOM % ${#NAMES[@]}]}
    b_address=${ADDRESSES[$RANDOM % ${#ADDRESSES[@]}]}
    start_date=$(generate_random_date)
    end_date=$(date -d "$start_date + $((RANDOM % 15 + 1)) days" +"%Y-%m-%d")

    # Insert into database
    docker exec -it postgres psql -U cdc -d cdc -c \
    "INSERT INTO borrowings (book_id, b_name, b_address, b_start_date, b_end_date) VALUES ($book_id, '$b_name', '$b_address', '$start_date', '$end_date');"
done

echo "Done."
