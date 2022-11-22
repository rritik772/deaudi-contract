// https://eth-goerli.g.alchemy.com/v2/TSzKwmXfM6nrMMSrccpRgtiDtB5PJgi2
require('@nomiclabs/hardhat-waffle');
// require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.0",
  networks: {
    'eth-goerli': {
      url: "https://eth-goerli.g.alchemy.com/v2/TSzKwmXfM6nrMMSrccpRgtiDtB5PJgi2",
      accounts: ['0x85fbb9b73476cac90bf3eb17cbf750df372a1687b5bb1f27992bd233bd2a9e94']
    }
  }
};
