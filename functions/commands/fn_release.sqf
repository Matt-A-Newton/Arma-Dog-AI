/*
 *	Author: PDT
 *	commands a dog to release a target
 *  TODO determine if this function should stay, could add some depth to it
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_release;
 *
 */

#include "..\macros.hpp"
SETDOGVAR("attacking", false);

call PDT_Dog_fnc_resetDog;

[] spawn PDT_Dog_fnc_follow;
