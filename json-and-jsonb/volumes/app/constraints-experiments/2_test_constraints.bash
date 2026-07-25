#!/bin/bash

echo "次に実行するコマンドが失敗することを期待しています。"
psql -U postgres -d test_db -f ./2_test_constraints.sql
