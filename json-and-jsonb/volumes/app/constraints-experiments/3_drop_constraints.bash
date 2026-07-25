#!/bin/bash

psql -U postgres -d test_db -f ./3_drop_constraints.sql
