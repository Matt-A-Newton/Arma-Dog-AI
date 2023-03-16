/*
 *	Author: PDT
 *	lunloads a dog from a vehicle
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	call PDT_Dog_fnc_unloadDog;
 *
 */

#include "..\macros.hpp"
if (GETDOGVAR("loaded")) then {
  SETDOGVAR("loaded", false);
  SETDOGVAR("attached", false);
  RESETCONTROLER;
  call PDT_Dog_fnc_resetDog;
  [] spawn PDT_Dog_fnc_follow;
};
