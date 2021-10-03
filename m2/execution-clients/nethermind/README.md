## Milestone #2: Lighthouse and Nethermind

References:
- Nethermind PR: https://github.com/NethermindEth/nethermind/pull/3453

## How To Run

This testnet requires 3 terminal processes, one for Nethermind one for a beacon node
and one for a validator client. See the per-terminal commands below.

### Terminal 1: Nethermind

*Arch Linux users will need `pacman -S dotnet-sdk aspnet-runtime`.*

```bash
git clone https://github.com/NethermindEth/nethermind --recursive
git checkout themerge
cd nethermind/src/Nethermind
dotnet build Nethermind.sln -c Release
cd Nethermind.Runner
# Here you need to change the `gasLimit` to 0x1C9C380.
vim bin/Release/net5.0/chainspec/themerge_devnet.json
dotnet run -c Release --no-build -- --config themerge_devnet
```

### Terminal 2: Lighthouse Beacon Node

```bash
cd m2_lighthouse
./start_beacon_node.sh 8550
```

*Note: it's important to start the beacon node before the validator client
since that script also generates the testnet configuration.*

### Terminal 3: Lighthouse Validator Client

```bash
cd m2_lighthouse
./start_validator_client.sh
```