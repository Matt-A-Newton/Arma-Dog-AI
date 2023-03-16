/*
 *	Author: PDT
 *	cleans up tracks
 *
 *	Arguments:
 *  0: _tracks <ARRAY> - array of tracks to clean.
 *
 *	Return Value:
 *	_return <ARRAY> - empty tracks array;
 *
 *	Example:
 *	[_tracks] call PDT_DOG_fnc_cleaupTracks;
 *
 */

params [["_tracks", []]];

// No tracks, do nothing.
if (_tracks isEqualTo []) exitWith {};

{
  if !(isNull _x) then {
    deleteVehicle _x;
  };
} forEach _tracks;

_tracks = [];

_return = _tracks;
_return
