/*
 *	Author: PDT
 *	checks if a unit is in a building
 *
 *	Arguments:
 *  0: _unit <OBJECT> - the unit to check
 *
 *	Return Value:
 *	_reture <BOOL> - true if in a building; false if not
 *
 *	Example:
 *  [bob] call PDT_Dog_fnc_isInBuilding;
 *
 */

params [["_unit", objNull]];
private _isInBuilding = false; // bool flag
if (_unit isEqualTo objNull) exitWith { // don't check if no unit
  hint "PDT_Dog_isInBuilding: No unit";
};
private _unitPos = getPosATL _unit; // the unit's position
private _nearestBuildings = (_unitPos nearObjects ["House", 7]) + (_unitPos nearObjects ["Building", 7]);

if (_nearestBuildings isEqualTo []) then { // if no building is found
  _isInBuilding = false;
} else {                                   // if a building is found
  _isInBuilding = true;
};

_return = _isInBuilding;
_return
