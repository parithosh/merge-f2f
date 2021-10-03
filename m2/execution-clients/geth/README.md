## Milestone #2: Geth and Lighthouse

References:
- Geth instructions: https://notes.ethereum.org/@9AeMAlpyQYaAAyuj47BzRw/rkwW3ceVY
- Geth PR: https://github.com/ethereum/go-ethereum/pull/23607

## How To Run

This testnet requires 3 terminal processes, one for geth one for a beacon node
and one for a validator client. See the per-terminal commands below.

Genesis.json
```json
{
	"config": {
		"chainId":1,
		"homesteadBlock":0,
		"daoForkBlock":0,
		"daoForkSupport":true,
		"eip150Block":0,
		"eip155Block":0,
		"eip158Block":0,
		"byzantiumBlock":0,
		"constantinopleBlock":0,
		"petersburgBlock":0,
		"istanbulBlock":0,
		"muirGlacierBlock":0,
		"berlinBlock":0,
		"londonBlock":0,
		"clique": {
			"period": 5,
			"epoch": 30000
		},
		"terminalTotalDifficulty":0
	},
	"nonce":"0x42",
	"timestamp":"0x0",
	"extraData":"0x0000000000000000000000000000000000000000000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	"gasLimit":"0x1C9C380",
	"difficulty":"0x400000000",
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
```

### Terminal 1: Geth

```bash
git clone git@github.com:MariusVanDerWijden/go-ethereum.git
cd go-ethereum
git checkout merge-interop-spec
make
cd ..
./go-ethereum/build/bin/geth --catalyst --datadir "./datadir" init genesis.json
./go-ethereum/build/bin/geth --catalyst --http --ws -http.api "engine,eth" --datadir "./datadir"
```

### Terminal 2: Lighthouse Beacon Node

```bash
cd m2_lighthouse
./start_beacon_node.sh
```

*Note: it's important to start the beacon node before the validator client
since that script also generates the testnet configuration.*

### Terminal 3: Lighthouse Validator Client

```bash
cd m2_lighthouse
./start_validator_client.sh
```
