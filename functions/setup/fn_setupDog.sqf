/*
 *	Author: PDT
 *	sets up a dog
 * TODO get info from module
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_setupDog;
 *
 */

#include "..\macros.hpp"

params [["_unit", player]];

private _dogType = "Alsatian_Black_F"; // type of dog
private _dogSpecialty = "SF";          // dog specialty

// controler
private  _controler = (createGroup (side _unit)) createUnit["B_Soldier_VR_F", getPosATL _unit, [], 2, "NONE"];

_controler hideObject true;
_controler enableStamina false;     // disable controler stamina
_controler setBehaviour "CARELESS"; // set controler behaviour to careless
// dog
private _dog = (createGroup (side _unit)) createUnit[_dogType, getPosATL _unit, [], 2, "NONE"];
_dog setVariable ["BIS_fnc_animalBehaviour_disable", true]; // disable animal
private _dogInfo = [_dog, _controler];                      // dog info
_unit setVariable["dogInfo", _dogInfo];                    // set var

SETDOGVAR("following", false);                              // folling var
SETDOGVAR("attacking", false);                              // attacking var
SETDOGVAR("tracking", false);                               // tracking var
SETDOGVAR("barking", false);                                // barking var
SETDOGVAR("attached", false);                               // attached var
SETDOGVAR("loaded", false);                                 // loaded var
SETDOGVAR("controlling", false);                            // controlling var
SETDOGVAR("camera", objNull);                               // camera var
SETDOGVAR("carried", false);                                // carried var

[_dogSpecialty] call PDT_Dog_fnc_dogBehaviour;              // start behaviour
call PDT_Dog_fnc_sit;                                       // make the dog sit
_dog attachTo [_controler, [0,0,0]];                          // attach dog

PDT_ProjBark_Handler = _unit;
PDT_ProjBark_Controler = _controler;
PDT_ProjBark_Dog = _dog;
