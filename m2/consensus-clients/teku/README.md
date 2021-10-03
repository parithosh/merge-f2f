```bash
> teku genesis mock \
  --eth1-block-hash 0x3b8fb240d288781d4aac94d3fd16809ee413bc99294a085798a589dae51ddd4a \
  --output-file ./local-genesis.ssz \ 
  --network=minimal \
  --Xnetwork-altair-fork-epoch=0 \
  --Xnetwork-merge-fork-epoch=0 \
  --validator-count=256
```

```bash
 teku \
  --eth1-endpoints=http://localhost:8545 \
  --ee-fee-recipient-address=0xfe3b557e8fb62b89f4916b721be55ceb828dbd73 \
  --Xinterop-enabled=true \
  --Xinterop-number-of-validators=256 \
  --Xinterop-owned-validator-start-index=0 \
  --Xinterop-owned-validator-count=256 \
  --network=minimal \
  --Xnetwork-altair-fork-epoch=0 \ 
  --Xnetwork-merge-fork-epoch=0 \ 
  --p2p-enabled=false \
  --initial-state ./local-genesis.ssz
```

