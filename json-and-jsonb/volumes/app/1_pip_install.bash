#!/bin/bash
# Please set your current directory here before running it.

python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

echo "以降のスクリプトは、'. .venv/bin/activate'を実行して、ターミナル左端に(.env)をキープしたまま実行してください。" 