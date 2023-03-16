/*
 *	Author: PDT
 *	commands a dog to sit
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_sit;
 *
 */

#include "..\macros.hpp"

SETDOGVAR("following", false);
SETDOGVAR("attacking", false);
SETDOGVAR("tracking", false);
SETDOGVAR("attached", false);
PDT_ProjBark_Dog playMoveNow "Dog_Sit";
PDT_ProjBark_Dog disableAI "MOVE";
doStop PDT_ProjBark_Controler;
