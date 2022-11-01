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


/// @notice This checks if two params are equal to not
/// @dev NA
/// @param s1 string
/// @param s2 string
/// @return bool ( if both string are equal or not )

function string_equals(string memory s1, string memory s2) pure returns (bool) {
    if ( 
        keccak256(abi.encodePacked(s1)) == 
        keccak256(abi.encodePacked(s2)) 
    ) {
        return true;
    }

    return false;
}
