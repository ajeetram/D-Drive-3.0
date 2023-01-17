require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
require("dotenv").config();
const PRIVATE_KEY = process.env.PRIVATE_KEY;
module.exports = {
  solidity: "0.8.17",
  networks:{
    hardhat:{
      chainId:1337,
    },
  },
  paths:{
    artifacts:"./client/src/artifacts",
  },
};
