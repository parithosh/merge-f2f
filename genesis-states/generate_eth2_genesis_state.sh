#!/bin/bash

source ./vars.env

EE_PORT=${1:-8545}
EE_ENDPOINT="http://localhost:${EE_PORT}"

echo "Retrieving genesis block from geth..."

GENESIS_BLOCK_HASH=$(curl \
	-X \
	POST \
	-H "Content-Type: application/json" \
	--data \
	'{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["earliest",false],"id":1}' \
	$EE_ENDPOINT \
	| jq '.result.hash' \
	| tr -d '"')

if [ -z ${GENESIS_BLOCK_HASH} ]; then exit; fi

echo "Genesis block hash is $GENESIS_BLOCK_HASH"

echo "Generating $SPEC specification and genesis state..."
NUMBER_OF_VALIDATING_HOSTS="$(grep "^number_of_validator_hosts" mergenet.yaml | awk -F":" '{ print $2 }')"

lcli \
	--spec $SPEC \
	new-testnet \
	--genesis-time $(date +%s) \
	--altair-fork-epoch 0 \
	--merge-fork-epoch 0 \
	--interop-genesis-state \
	--validator-count $(expr 64 '*' $NUMBER_OF_VALIDATING_HOSTS) \
	--min-genesis-active-validator-count $(expr 64 '*' $NUMBER_OF_VALIDATING_HOSTS) \
	--testnet-dir "$TESTNET_NAME/public/" \
	--deposit-contract-address "$(grep "^deposit_contract_address" mergenet.yaml | awk -F":" '{ print $2 }')" \
	--deposit-contract-deploy-block 0 \
	--eth1-block-hash $GENESIS_BLOCK_HASH \
