#!/bin/sh

. ./vars.env

./go-ethereum/build/bin/geth --catalyst --datadir "$DATA_DIR" init $GENESIS_JSON_LOCATION
#./go-ethereum/build/bin/geth --catalyst --http --ws -http.api "engine,eth" --datadir "$DATA_DIR"