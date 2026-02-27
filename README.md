# 🫙 Savings Jar — OpNet OP_20

A micro savings jar built on **OpNet** (Bitcoin L1 smart contracts) using the **OP_20** token standard. Earn 4% APY in `TSAV` tokens, with yield accruing every Bitcoin block.

---

## Quick Start

```bash
# 1. Install & run (auto-installs deps)
chmod +x start.sh
./start.sh

# Or manually:
npm install
npm run dev
```

App opens at **http://localhost:3000**

---

## Project Structure

```
savings-jar/
├── src/
│   ├── main.jsx          # React entry point
│   └── SavingsJar.jsx    # Main app (OpNet-wired frontend)
├── contract/
│   ├── SavingsJar.ts     # OP_20 AssemblyScript contract
│   ├── asconfig.json     # AssemblyScript build config
│   └── build/            # Compiled .wasm output (after build)
├── index.html
├── vite.config.js
├── package.json
└── start.sh              # One-click start script
```

---

## Deploying the Contract

### 1. Install OpNet CLI
```bash
npm install -g @btc-vision/opnet-cli
```

### 2. Compile the contract
```bash
cd contract
npx asc SavingsJar.ts --config asconfig.json
```

### 3. Deploy to testnet
```bash
opnet deploy --network testnet --wasm build/SavingsJar.wasm
```

### 4. Update the contract address
In `src/SavingsJar.jsx`, set your deployed address:
```js
const CONFIG = {
  contractAddress: "YOUR_DEPLOYED_ADDRESS_HERE",
  ...
}
```

---

## Going Live (Real OpNet Integration)

The frontend has real SDK calls stubbed inline. Search for:

```
// ── REAL IMPLEMENTATION ──
```

Uncomment those blocks and remove the `// ── DEMO STUB ──` blocks beneath them.

Install the OpNet wallet extension, then the app will:
1. Connect to UniSat / OpNet wallet
2. Read on-chain balances via `JSONRpcProvider`
3. Sign & broadcast real transactions

---

## Token Info

| Field        | Value             |
|--------------|-------------------|
| Name         | TestSave          |
| Symbol       | TSAV              |
| Decimals     | 8                 |
| Total Supply | 21,000,000        |
| APY          | ~4%               |
| Monthly Rate | 33 bps (0.33%)    |
| Yield Cycle  | Per Bitcoin block |
| Network      | OpNet Testnet     |

---

## Contract Methods

| Method              | Description                              |
|---------------------|------------------------------------------|
| `deposit(amount)`   | Lock TSAV into the jar, start earning    |
| `withdraw(amount)`  | Withdraw principal (auto-claims yield)   |
| `claimYield()`      | Claim accrued yield without withdrawing  |
| `getDeposit(addr)`  | View deposited balance for an address    |
| `getPendingYield(addr)` | View unclaimed yield                |
| `getTotalDeposits()` | Protocol TVL                           |
| `getTotalYieldPaid()` | Total yield ever distributed          |

---

## Requirements

- Node.js v18+
- npm v8+
- OpNet wallet browser extension (for live mode)
