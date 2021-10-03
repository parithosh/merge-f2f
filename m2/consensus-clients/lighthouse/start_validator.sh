source ./vars.env

VALIDATOR_DIR=$VALIDATOR_DIR/node_1
rm -rf $VALIDATOR_DIR

echo "Generating $VALIDATOR_COUNT validator keypairs..."

$LCLI \
	insecure-validators \
	--count $VALIDATOR_COUNT \
	--base-dir $VALIDATOR_DIR \
	--node-count 1 \
	&&

echo "Staring a validator client..."

$LIGHTHOUSE \
	--debug-level $DEBUG_LEVEL \
	--datadir $VALIDATOR_DIR/node_1 \
	vc \
	--testnet-dir $TESTNET_DIR \
	--init-slashing-protection \
	--beacon-nodes http://localhost:5052 \
