#!/bin/bash

psql -U postgres -d test_db -c "SELECT count(*) FROM company_json; SELECT count(*) FROM company_jsonb; SELECT count(*) FROM company_jsonb_index;"
echo "[BEGIN] insert data. wait a while..."
python3 ./3_insert_data.py
echo "[  END] insert data"
psql -U postgres -d test_db -c "SELECT count(*) FROM company_json; SELECT count(*) FROM company_jsonb; SELECT count(*) FROM company_jsonb_index;"
