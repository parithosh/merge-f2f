source ./vars.env

rm -rf $TESTNET_DIR
rm -rf $BEACON_DIR

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

$LCLI \
	--spec $SPEC \
	new-testnet \
	--genesis-time $(date +%s) \
	--altair-fork-epoch 0 \
	--merge-fork-epoch 0 \
	--interop-genesis-state \
	--validator-count $VALIDATOR_COUNT \
	--min-genesis-active-validator-count $VALIDATOR_COUNT \
	--testnet-dir $TESTNET_DIR \
	--deposit-contract-address 0x0000000000000000000000000000000000000000 \
	--deposit-contract-deploy-block 0 \
	--eth1-block-hash $GENESIS_BLOCK_HASH \

echo "Staring a beacon node using an execution engine at $EE_ENDPOINT..."

$LIGHTHOUSE \
	--spec $SPEC \
	--testnet-dir $TESTNET_DIR \
	--debug-level $DEBUG_LEVEL \
	beacon_node \
	--datadir $BEACON_DIR \
	--dummy-eth1 \
	--http \
	--http-allow-sync-stalled \
	--metrics \
	--merge \
	--execution-endpoints $EE_ENDPOINT \
	--terminal-block-hash-override $GENESIS_BLOCK_HASH
