# AES-128-FPGA-Accelerator
FPGA-Based AES-128 Hardware Accelerator using Verilog HDL

# FPGA-Based AES-128 Hardware Accelerator

A Verilog HDL implementation of the **AES-128 encryption algorithm**, developed as part of the NIELIT Chip Design project.

# Project Overview

This project focuses on designing a modular **AES-128 hardware accelerator using Verilog HDL**.

The AES encryption algorithm is divided into individual RTL modules for the major transformation stages. The design is developed and verified at the RTL level through simulation.

> **Note:** This project currently focuses on RTL design, simulation, and verification. No physical FPGA development kit is used for the current implementation.

# Objective

* Implement AES-128 encryption using Verilog HDL.
* Design the major AES transformations as individual RTL modules.
* Develop a modular hardware-oriented cryptographic architecture.
* Verify the functionality of the AES-128 encryption process through simulation.

# AES-128 Encryption

AES-128 uses:

* **128-bit plaintext**
* **128-bit encryption key**
* **128-bit ciphertext**
* **10 encryption rounds**

The main AES transformations are:

1. **SubBytes**
2. **ShiftRows**
3. **MixColumns**
4. **AddRoundKey**
5. **Key Expansion**

The final AES round does not include MixColumns.

# Project Modules

| Verilog File        | Function                               |
| ------------------- | -------------------------------------- |
| `aes_top.v`         | Top-level AES module                   |
| `aes_round.v`       | Performs the main AES round            |
| `aes_final_round.v` | Performs the final AES round           |
| `sub_bytes.v`       | Performs the SubBytes transformation   |
| `shift_rows.v`      | Performs the ShiftRows transformation  |
| `mix_columns.v`     | Performs the MixColumns transformation |
| `add_round_key.v`   | Performs the AddRoundKey operation     |
| `key_expansion.v`   | Generates the AES round keys           |

# Technologies Used

* **Verilog HDL**
* **RTL Design**
* **AES-128 Cryptographic Algorithm**
* **Quartus II**
* **RTL Simulation**

# AES Encryption Flow

```text
128-bit Plaintext
       │
       ▼
  AddRoundKey
       │
       ▼
   Rounds 1–9
       │
       ├── SubBytes
       ├── ShiftRows
       ├── MixColumns
       └── AddRoundKey
       │
       ▼
   Final Round
       │
       ├── SubBytes
       ├── ShiftRows
       └── AddRoundKey
       │
       ▼
128-bit Ciphertext
```

# Verification

The AES-128 RTL design is being verified through simulation using known AES test vectors.

Verification focuses on:

* Correct AES transformations
* Correct round-key generation
* Correct round processing
* Matching the expected AES-128 ciphertext

# Project Status

**Current Status:** RTL design and simulation-based verification in progress.

The current project focuses on RTL design and simulation-based verification. Synthesis analysis may be performed as part of further evaluation.
