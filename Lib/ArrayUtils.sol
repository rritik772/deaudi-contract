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

import { string_equals } from "./StringUtils.sol";


/// @notice checks if the string (s) is in array or not
/// @dev NA
/// @param array string
/// @param s string
/// @return if s is in array or not

function in_array(string[] memory array, string memory s) pure returns (bool) {
    for (uint i=0; i < array.length; i++) {
        if ( string_equals(array[i], s) ) {
            return true;
        }
    }

    return false;
}
