const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");

describe('Track Contract', function() {

  async function deployTrackFixture() {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Tracks");
    const hardhatToken = await Token.deploy();

    await hardhatToken.deployed();

    return { owner, hardhatToken };
  }

  it("Total tracks at first", async function() {
    const { hardhatToken, owner } = await loadFixture(deployTrackFixture);

    const length = await hardhatToken.totalTracks();
    expect(await length).to.equal(0);
  })

  it("Adding first track", async function() {

    const { hardhatToken } = await loadFixture(deployTrackFixture);

    await hardhatToken.addTrack(
      "first track",
      1,
      120,
      "0x1234",
      "This is the first song of the blockchain",
      ["artist1", "artist2", "artist3"]
    );

    let length = await hardhatToken.totalTracks();
    expect(await length).to.equal(1);

    await hardhatToken.addTrack(
      "second track",
      2,
      1000,
      "0x12345",
      "This is the second song of the blockchain",
      ["artist2", "artist3"]
    );

    length = await hardhatToken.totalTracks();
    expect(await length).to.equal(2);

    await hardhatToken.addTrack(
      "thrid track",
      3,
      150,
      "0x123456",
      "This is the third song of the blockchain",
      ["artist3", "artist4"]
    );

    length = await hardhatToken.totalTracks();
    expect(await length).to.equal(3);
  })

  it("Searching a track", async function() {
    const { hardhatToken } = await loadFixture(deployTrackFixture);

    const track = await hardhatToken.getTracks("thrid track");
    console.log(track);
  })
})
