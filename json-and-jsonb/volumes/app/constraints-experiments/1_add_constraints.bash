#!/bin/bash

psql -U postgres -d test_db -f ./1_add_constraints.sql
