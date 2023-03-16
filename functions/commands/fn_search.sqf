/*
 *	Author: PDT
 *	commands a dog to search a target
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_search;
 *
 */

#include "..\macros.hpp"

_target = cursorObject;

if (alive _target && {_target distance PDT_ProjBark_Dog <= 100}) then
{
  SETDOGVAR("following", false);
  PDT_ProjBark_Dog playMoveNow "Dog_Sprint";
  PDT_ProjBark_Dog enableAI "MOVE";
  PDT_ProjBark_Controler doMove (getPosATL _target); // dog go to target
  waitUntil{PDT_ProjBark_Dog distance _target <= 4};
  PDT_ProjBark_Dog playMoveNow "Dog_Sit";
  PDT_ProjBark_Dog disableAI "MOVE";

  private _hasContraband = false; // bool flag for contraband
  private _hasThrowable = false;  // bool flag for throwables
  private _hasExplosive = false;  // bool flag for explosives

  {
    _item = _x;
    if (count ("_item in getArray( _x >> 'magazines')" configClasses (configFile >> "CfgWeapons" >> "Throw")) > 0) then {_hasThrowable = true};
    if (count ("_item in getArray( _x >> 'magazines')" configClasses (configFile >> "CfgWeapons" >> "Put")) > 0) then {_hasExplosive = true};
  } forEach itemsWithMagazines _target;
  // does the target have contraban?
  if (someAmmo _target || {count (weapons _target) > 0} || {_hasThrowable} || {_hasExplosive}) then {
    _hasContraband = true;  // yes, flag it
  };

  hint "Your dog is sniffing for contraband";
  uiSleep 5;
  if (_hasContraband) then                              // if contraban found
  {
    hint "Your dog has found contraband";               // tell the PDT_ProjBark_Handler
    PDT_ProjBark_Dog playMoveNow "Dog_Idle_Bark";                    // dog should bark
    ["Dog_DetectedBomb", 3] call PDT_Dog_fnc_playSound; // make the dog bark
  } else {                                              // nothing found
    hint "Your dog did not find any contraband";        // tell the PDT_ProjBark_Handler
  };
};
