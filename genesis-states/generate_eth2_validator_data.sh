#!/bin/bash

TESTNET_NAME="$(grep "^testnet_name" mergenet.yaml | awk -F":" '{ print $2 }') | tr -d ' '"

ETH2_BASE_CONFIG="mainnet"
if grep -q "eth2_base_config: minimal" mergenet.yaml; then
    ETH2_BASE_CONFIG="minimal"
fi

# Inside your setupenv: Generate Genesis Beacon State
if [ "$ETH2_BASE_CONFIG" = "minimal" ]; then
    echo "[*] Using minimal config"
    eth2-testnet-genesis merge \
                         --preset-phase0 minimal --preset-altair minimal --preset-merge minimal \
                         --eth1-config "$TESTNET_NAME/public/eth1_config.json" \
                         --config "$TESTNET_NAME/public/eth2_config.yaml" \
                         --mnemonics genesis_validators.yaml \
                         --state-output "$TESTNET_NAME/public/genesis.ssz" \
                         --tranches-dir "$TESTNET_NAME/private/tranches"
else
    echo "[*] Using mainnet config"
    eth2-testnet-genesis merge \
                         --eth1-config "$TESTNET_NAME/public/eth1_config.json" \
                         --config "$TESTNET_NAME/public/eth2_config.yaml" \
                         --mnemonics genesis_validators.yaml \
                         --state-output "$TESTNET_NAME/public/genesis.ssz" \
                         --tranches-dir "$TESTNET_NAME/private/tranches"
fi


# Build validator keystore for nodes
#
# Prysm likes to consume bundled keystores. Use `--prysm-pass` to encrypt the bundled version.
# For the other eth2 clients, a different secret is generated per validator keystore.
#
# You can change the range of validator accounts, to split keys between nodes.
# The mnemonic and key-range should match that of a tranche of validators in the beacon-state genesis.
NUMBER_OF_VALIDATING_HOSTS="$(grep "^number_of_validator_hosts" mergenet.yaml | awk -F":" '{ print $2 }')"
echo "[*] Building validator keystores for $NUMBER_OF_VALIDATING_HOSTS hosts"

for (( i=0; i<$NUMBER_OF_VALIDATING_HOSTS; i++ ))
do
   echo "creating keys for host $i from key $(expr 64 '*' $i) to $(expr 64 '*' $i '+' 64)"

   eth2-val-tools keystores \
     --out-loc "$TESTNET_NAME/private/validator_$i" \
     --prysm-pass="foobar" \
     --source-min=$(expr 64 '*' $i) \
     --source-max=$(expr 64 '*' $i '+' 64) \
     --source-mnemonic="$(grep "^mnemonic" mergenet.yaml | awk -F":" '{ print $2 }' | tr -d '"' )"
done
