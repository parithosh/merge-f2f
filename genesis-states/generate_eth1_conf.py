from web3.auto import w3
import json
import ruamel.yaml as yaml
import sys

w3.eth.account.enable_unaudited_hdwallet_features()

mergenet_config_path = "mergenet.yaml"
if len(sys.argv) > 1:
    mergenet_config_path = sys.argv[1]

with open(mergenet_config_path) as stream:
    data = yaml.safe_load(stream)

out = {
    "config": {
        "chainId": int(data['chain_id']),
        "homesteadBlock":0,
        "eip150Block":0,
        "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
        "eip155Block":0,
        "eip158Block":0,
        "byzantiumBlock":0,
        "constantinopleBlock":0,
        "petersburgBlock":0,
        "istanbulBlock":0,
        "muirGlacierBlock":0,
        "berlinBlock":0,
        "londonBlock":0,
        "terminalTotalDifficulty":0
    },
    "nonce":"0x42",
    "timestamp":"0x0",
    "extraData":"0x0000",
    "gasLimit":"0x1C9C380",
    "difficulty":"0x0",
    "mixHash":"0x0000000000000000000000000000000000000000000000000000000000000000",
    "coinbase":"0x0000000000000000000000000000000000000000",
    "alloc":{
        "0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b":{"balance":"0x6d6172697573766477000000"}
    },
    "number":"0x0",
    "gasUsed":"0x0",
    "parentHash":"0x0000000000000000000000000000000000000000000000000000000000000000",
    "baseFeePerGas":"0x7"
}

# for key, value in data['eth1_premine'].items():
#     acct = w3.eth.account.from_mnemonic(data['mnemonic'], account_path=key, passphrase='')
#     weival = value.replace('ETH', '0' * 18)
#     out["alloc"][acct.address] = {"balance": weival}

print(json.dumps(out, indent='  '))
