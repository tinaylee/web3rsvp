require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();


task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
	const accounts = await hre.ethers.getSigners();
  
	for (const account of accounts) {
	  console.log(account.address);
	}
  });

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
	solidity: "0.8.4",
	networks: {
		hardhat: {
			chainId: 1337,
		},
		mumbai: {
			url: process.env.API_URL,
			accounts: [`0x${process.env.PRIVATE_KEY}`],
			gas: 2100000,
			gasPrice: 8000000000,
		},
	},
  };