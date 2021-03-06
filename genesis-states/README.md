## Genesis state creation

### Quick setup
- Modify `mergenet.yaml` with the required config variables
- Run `./generate_everything_i_dont_care.sh` to generate all the states you would need for interop
- Done! Move on to the client configuration README's!

### Generate consensus and execution configs separately
- Set eth1_genesis_timestamp inside `mergenet.yaml` to the current timestamp or a timestamp in the future.
  To use the current timestamp run: `sed -i -e s/GENESIS_TIMESTAMP/$(date +%s)/ mergenet.yaml`
- Generate the folders and create the configs:
```bash
# Create, start and install python venv
python -m venv venv 
. venv/bin/activate
pip install -r requirements.txt
# Inside your setupenv: Generate ETH1/ETH2 configs
export TESTNET_NAME="mergenet"
mkdir -p "$TESTNET_NAME/public" "$TESTNET_NAME/private"
# Configure Eth1 chain
python generate_eth1_conf.py > "$TESTNET_NAME/public/eth1_config.json"
# Configure Eth2 chain
python generate_eth2_conf.py > "$TESTNET_NAME/public/eth2_config.yaml"
```
- Generate the validator keys
```bash
export VALIDATOR_NODE_NAME="valclient0"
bash ./generate_eth2_validator_data.sh
```
- generate files needed by clients specific 
```bash
echo 0 > "$TESTNET_NAME/public/deploy_block.txt"
cp "$TESTNET_NAME/public/eth2_config.yaml" "$TESTNET_NAME/public/config.yaml"
```