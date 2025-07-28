# 💀 Dead Man’s Wallet

A **self-expiring smart wallet** on Monad that transfers your assets to an heir if you go inactive for too long.  
Inspired by the saying: *"Dead men tell no tales."* — but they do leave tokens behind.

---

## 🧠 Overview

The **Dead Man’s Wallet** is a smart contract designed for digital inheritance.  
It allows a user to:

- ✅ Set a timeout period (e.g. 7 days)
- ✅ Ping the wallet periodically to prove they’re alive (`heartbeat`)
- ✅ Automatically allow the `heir` to claim the wallet’s funds if the owner goes silent

---

## ⚙️ Features

| Feature        | Description |
|----------------|-------------|
| 🫀 `heartbeat()` | Owner pings the wallet to stay alive |
| ☠️ `claim()`     | Heir claims the balance if timeout passed |
| 🔍 `canClaim()` | Checks whether heir can claim |
| 📅 `lastPing()` | Returns last active timestamp |
| 👤 `owner()`     | View owner address |
| 🧬 `heir()`      | View heir address |

---

## 🚀 Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/)
- Monad RPC endpoint (testnet or mainnet)
- Environment variables set:

```env
PRIVATE_KEY=0xYOUR_OWNER_KEY
HEIR_PRIVATE_KEY=0xYOUR_HEIR_KEY
CONTRACT_ADDRESS=0xDEPLOYED_ADDRESS
MONAD_RPC_URL=https://rpc.testnet.monad.xyz
