/*
 *	Author: PDT
 *	loads a dog into a vehicle
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	call PDT_Dog_fnc_loadDog;
 *
 */

#include "..\macros.hpp"
if (PDT_ProjBark_Dog distance PDT_ProjBark_Handler <= 10) then {
  SETDOGVAR("attached", true);
  SETDOGVAR("loaded", true);
  doStop PDT_ProjBark_Controler;
  PDT_ProjBark_Dog attachTo [(vehicle PDT_ProjBark_Handler), [0, 0, -5000]];
};
