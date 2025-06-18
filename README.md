# zkBridge_DEMO

This project was completed as the Final Project for **"Generative AI and Blockchain 2025"** at GIST, supervised by Professor Heung-No Lee.

---

## 🔗 Overview

zkBridge_DEMO is a prototype demonstrating a simplified zero-knowledge bridge mechanism between two blockchains using ZK-SNARKs. It enables locking ERC-20 tokens on a source chain and validating the lock via zero-knowledge proof on a destination chain.

---

## 🧩 Open Source Utilized

This project utilizes the following open-source GitHub repositories:

- [snarkjs](https://github.com/iden3/snarkjs)
- [keccak256-circom](https://github.com/vocdoni/keccak256-circom)

The CIRCOM circuit files from the above repositories have been copied and included in the `circuits` directory of this project.

---

## ⚙️ GPT-Vibe Coding & Disclaimer

The following files were primarily developed using **ChatGPT-assisted vibe coding**:

- `lockproof.circom`
- `generate_input.py`
- Solidity contracts

Approximately **80% of the implementation** was generated via AI assistance and **20% manually revised**. As a result, there may still be **functional or security vulnerabilities**. **Use on a blockchain mainnet is NOT recommended**. Please validate thoroughly on testnets before any real-world application.

---

## ✅ Features

This demo project includes the following key components:

1. **ERC-20 Token Deployment** and **Lock Smart Contract** on Chain A  
2. **Zero-Knowledge Proof Generation** circuit for lock transaction hash  
3. **Verifier Circuit and Mint Contract** on Chain B

---

## ❗ Limitations

The project does **not yet support** the following:

- Full block proof generation and light client for the destination chain  
- Token minting logic within `Mint.sol` smart contract

---

## 🚀 How to Run

1. Deploy `Token.sol` and `Lock.sol` on **Blockchain A (Sender)**.
2. Lock a specific amount of tokens using the deployed `Lock` contract.
3. Modify `generate_input.py` with your wallet address and lock amount.
4. Run the following command:

   ```bash
   python3 generate_input.py
   ```

   (See `command.txt` for full command list.)

5. Execute commands (2) through (7) in order.  
   > ⚠️ Command (4) takes ~10 minutes to complete.

6. Deploy `Verifier.sol` (from Step 4) and `Token.sol` to **Blockchain B (Receiver)**.
7. Input the proof output from Command (7) into the deployed `Verifier.sol` to check for `True/False`.
8. _(Optional)_ Use `Mint.sol` (which inherits from `Verifier.sol`) to confirm behavior based on the proof result.

---

## 🎥 Demo Video (Korean)

Check out the demo video on YouTube:

👉 [Watch the Demo](https://www.youtube.com/TOBEUPDATED)

---

## 📁 Project Structure

```
zkBridge_DEMO/
│
├── circuits/                # CIRCOM circuit files
├── contracts/               # Solidity smart contracts
├── generate_input.py        # Script to prepare input.json
├── command.txt              # CLI commands for proof generation
└── README.md                # Project documentation
```
---

