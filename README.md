# Ethernaut Capture the Flag (CTF) Challenge Solutions

![Ethernaut Logo](https://url-to-your-image.png) <!-- Replace with an image related to the Ethernaut CTF -->

This repository contains my solutions to the Ethernaut Capture the Flag (CTF) challenges.

---

## Challenge 1: Hello Ethernaut

Solved✅
![Screenshot](./img/hello-ethernaut.png)

**Solution**

To solve the "Hello Ethernaut" challenge, read carefully the `abi` of the `HelloEthernaut` contract and call the `password` function, this will return the password which is used as the parameter for calling the `authenticate` function and this unlocks the level.


- Smart Contract: `contract/HelloEthernaut.sol`

## Resources
- Ethernaut CTF: [https://ethernaut.openzeppelin.com/](https://ethernaut.openzeppelin.com/)

---


## Disclaimer

This repository is for educational and demonstration purposes only. The code in this repository is not optimized for production use and may contain security vulnerabilities. Use it at your own risk.



## License

This project is licensed under the MIT License. See the LICENSE file for details.
