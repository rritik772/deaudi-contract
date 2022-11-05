// SPDX-License-Identifier: The GPLv3 License (GPLv3)

// Copyright (c) 2022 
// Author: Ritik Ranjan
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity ^0.8.0;

import { string_equals } from "./../Lib/StringUtils.sol";

struct SingleProfile {
  string name;
  uint totalTracksAdded;
  string description;
  string username;
}

/// @title Profile contract use to access profile of the user
/// @author Ritik Ranjan
/// @notice Profile
/// @dev N.A

contract Profile {
  mapping ( address => SingleProfile ) profileMap;
  address[] profileAddresses;

  function createProfile(string memory name, string memory desc, string memory username) public {
    profileMap[msg.sender] = SingleProfile({
        name: name,
        totalTracksAdded: 0,
        description: desc,
        username: username
    });

    profileAddresses.push(msg.sender);
  }

  function createdNewTrack() public {
      profileMap[msg.sender].totalTracksAdded ++;
  }

  function changeDescription(string memory desc) public {
      profileMap[msg.sender].description = desc;
  }

  function getProfile() public view returns (SingleProfile memory) {
      return profileMap[msg.sender];
  }

  function isUsernameExisted(string memory username) public view returns(bool) {
      for (uint i=0; i < profileAddresses.length; i++) {
        if ( string_equals(profileMap[profileAddresses[i]].username, username) ) {
          return true;
        }
      }

      return false;
  }
}
