# Ethernaut Capture the Flag (CTF) Challenge Solutions

![Ethernaut Logo](https://ethernaut.openzeppelin.com/imgs/oz-logo.svg) 

This repository contains tips to solving the Ethernaut Capture the Flag (CTF) challenges. I decided not to drop full solutions to the challenges, but rather give hints and tips to solving them. I hope you find this useful!

---

## Challenge 1: Hello Ethernaut

Solved✅
![Screenshot](./img/hello-ethernaut.png)

### **Tips**🏆

To solve the "Hello Ethernaut" challenge, read carefully the `abi` of the `HelloEthernaut` contract and call the `password` function, this will return the password which is used as the parameter for calling the `authenticate` function and this unlocks the level.


- Smart Contract: `contract/HelloEthernaut.sol`

---

## Challenge 2: Fallback

Solved✅
![Screenshot](./img/fallback.png)

### Task 🧵
- Claim ownership of the contract
- Withdraw the contract's funds

### **Tips**🏆

To solve the "Fallback" challenge, You need to understand the how `receive` and `fallback` function works in Solidity

- When msg.data is empty, the `receive` function is called.
- When msg.data is not empty, the `fallback` function is called.

To solve this challenge, you need to send a transaction to the contract with some data, this will call the `receive` function and ownership will be transfered to you which is the first objective.
Lastly, since you are the owner of the contract, you have the access to call the `withdraw` function to drain out the wallet and this will unlock the level.


- Smart Contract: `contract/Fallback.sol`

---

## Challenge 3: Fallout

Solved✅
![Screenshot](./img/fallout.png)

### Task 🧵
- Claim ownership of the contract

### **Tips**🏆

The tips here is just to pay kin attention to how constructors are defined and avoid common spelling mistakes.


- Smart Contract: `contract/Fallout.sol`

---

## Challenge 4: Coin Flip

Solved✅
![Screenshot](./img/CoinFlip.png)

### Task 🧵
- Guess the correct outcome of the coin flip 10 times in a row

### **Tips**🏆

The tips is to study the vulnerability associated with the method used to generate random numbers in the smart contract. In this case, the `blockhash` method is used to generate random numbers and this is vulnerable to miner manipulation.


- Smart Contract: `contract/CoinFlip.sol`

---

## Challenge 5: Telephone

Solved✅
![Screenshot](./img/Telephone.png)

### Task 🧵
- Claim ownership of the contract

### **Tip**🏆

What is the difference between `msg.sender` and `tx.origin`? and What parameter changes the contract owner?

- Smart Contract: `contract/Telephone.sol`

---

## Challenge 6: Token

Solved✅
![Screenshot](./img/token.png)

### Task 🧵
- You are given 20 token, find a way to hack the contract and get more tokens

### **Tip**🏆

What is Overflow and Underflow? and How can you exploit it?
What is Odometer and how can you exploit it?
What is OpenZeppelin SafeMath library and how can you use it to prevent overflow and underflow?

- Smart Contract: `contract/Token.sol`

---

## Challenge 7: Delegation

Solved✅
![Screenshot](./img/Delegation.png)

### Task 🧵
- Claim ownership of the contract

### **Tip**🏆

What is `DelegateCall` and how can you exploit it?

Dont keep banging your head sending data via Remix, check other ways to send data to a contract.

- Smart Contract: `contract/Delegation.sol`

---

## Challenge 8: Force

Solved✅
![Screenshot](./img/Force.png)

### Task 🧵
- Send ethers to this empty contract

### **Tip**🏆

What are forceful ways to send ether to a smart contract?
Have you heard of `selfdestruct`?

- Smart Contract: `contract/Force.sol`


---

## Challenge 9: Vault

Solved✅
![Screenshot](./img/Vault.png)

### Task 🧵
- Unlock the vault to pass the level!

### **Tip**🏆

Is anything hidden on the blockchain?
Have you heard of slot manipulation?

- Smart Contract: `contract/Vault.sol`

---

## Challenge 10: King

Solved✅
![Screenshot](./img/King.png)

### Task 🧵
- Become the king and prevent the contract from being the king

### **Tip**🏆

What are the different ways to send ether to a smart contract? whats the difference between these methods?

- Smart Contract: `contract/King.sol`

## Disclaimer

This repository is for educational and demonstration purposes only. The code in this repository is not optimized for production use and may contain security vulnerabilities. Use it at your own risk.

