#!/bin/bash
# test_dbが持つpublicスキーマ（テーブルや制約含む）を全消去して空にして作り直す。

psql -U postgres -d test_db -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
