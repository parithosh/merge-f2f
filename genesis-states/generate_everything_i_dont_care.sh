#!/bin/sh

# python stuff
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt

TESTNET_NAME="$(grep "^testnet_name" mergenet.yaml | awk -F":" '{ print $2 }') | tr -d ' '"

mkdir -p "$TESTNET_NAME/public" "$TESTNET_NAME/private"
# Configure Eth1 chain
python generate_eth1_conf.py > "$TESTNET_NAME/public/eth1_config.json"
# Configure Eth2 chain
python generate_eth2_conf.py > "$TESTNET_NAME/public/eth2_config.yaml"

./generate_eth2_validator_data.sh

echo 0 > "$TESTNET_NAME/public/deploy_block.txt"
cp "$TESTNET_NAME/public/eth2_config.yaml" "$TESTNET_NAME/public/config.yaml"
