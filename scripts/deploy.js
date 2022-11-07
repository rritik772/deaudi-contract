// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Tracks = await hre.ethers.getContractFactory("Tracks");
  const tracks = await Tracks.deploy();
  await tracks.deployed();

  const Profile = await hre.ethers.getContractFactory("Profile");
  const profile = await Profile.deploy();
  await profile.deployed();

  console.log("Tracks address: ", tracks.address);
  console.log("Profile address: ", profile.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => {
    process.exit(0)
  })
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
