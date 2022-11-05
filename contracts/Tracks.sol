// SPDX-License-Identifier: The GPLv3 License (GPLv3)

// Copyright (c) 2022 
// Author: Ritik Ranjan

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// ************************************************************************ //
// ************************************************************************ //

pragma solidity ^0.8.0;

import { string_equals } from "./../Lib/StringUtils.sol";
import { in_array } from "./../Lib/ArrayUtils.sol";


/// @title Tracks
/// @author Ritik Ranjan
/// @notice Single track
/// @dev N.A

struct Track {
  string name;
  uint trackId;
  uint length;
  string IPFSHash;
  string description;

  uint timestamp; // added on
  address addedBy;
  string addedByName;
  string album;
  string[] artists;

  bool isDeleted;
}

// ************************************************************************ //

/// @title Tracks
/// @author Ritik Ranjan
/// @notice This contract includes all the tracks avaliable in the blockchain
/// @dev N.A.

contract Tracks {
  Track[] private trackList;

  function addTrack(
    string memory name,
    uint track_id,
    uint length,
    string memory IPFS_hash,
    string memory description,

    string[] memory artists,
    string memory album,
    string memory added_by_name
  ) public {

    Track memory track = Track({
      name: name,
      trackId: track_id,
      length: length,
      IPFSHash: IPFS_hash,
      description: description,

      timestamp: block.timestamp,
      addedBy: msg.sender,
      artists: artists,
      album: album,
      addedByName: added_by_name,

      isDeleted: false
    });

    trackList.push(track);
  }

  function getTracks(string memory track_name) public view returns (Track[] memory) {
    uint tracks_count = 0;
    for (uint i = 0; i < trackList.length; i++) {
        if ( string_equals(trackList[i].name, track_name) ) { 
            tracks_count ++; 
        }
    }

    Track[] memory searched_tracks = new Track[](tracks_count);
    uint j = 0;

    for (uint i = 0; i < trackList.length; i++) {
      if ( string_equals(trackList[i].name, track_name) ) {
        searched_tracks[j] = trackList[i];
        j++;
      }
    }

    return searched_tracks;
  }

  function getArtistTracks(string memory artist) public view returns (Track[] memory) {
      uint tracks_count = 0;
      for (uint i = 0; i < trackList.length; i++) {
          if ( in_array(trackList[i].artists, artist) ) { tracks_count ++; }
      }

      Track[] memory searched_tracks = new Track[](tracks_count);
      uint j = 0;

      for (uint i = 0; i < trackList.length; i++) {
        if ( in_array(trackList[i].artists, artist) ) { 
            searched_tracks[j] = trackList[i];
            j++; 
        }
      }

      return searched_tracks;
  }

  function totalTracks() public view returns (uint) {
    return trackList.length;
  }
}
