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

struct SingleProfile {
  string name;
  string totalTracksAdded;
}

/// @title A title that should describe the contract/interface
/// @author The name of the author
/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details

contract Profile {
  mapping ( address => SingleProfile ) profileMap;

  function createProfile(string memory name) {
    profileMap
    
  }
}
