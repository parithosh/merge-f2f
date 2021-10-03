## Milestone #2: Nethermind

References:
- Nethermind PR: https://github.com/NethermindEth/nethermind/pull/3453

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
