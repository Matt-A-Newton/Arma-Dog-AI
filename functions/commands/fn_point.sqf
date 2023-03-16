/*
 *	Author: PDT
 *	commands a dog to go to a location
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] spawn PDT_Dog_fnc_point;
 *
 */

#include "..\macros.hpp"

_postition = screenToWorld [0.5,0.5];
if (_postition distance PDT_ProjBark_Dog > 100) exitWith
{
    hint "Your K-9 looks up at you as if to say 'that's to far'";
};
SETDOGVAR("following", false);
SETDOGVAR("barking", false);
PDT_ProjBark_Dog playMoveNow "Dog_Sprint";
PDT_ProjBark_Dog enableAI "MOVE";
PDT_ProjBark_Controler doMove _postition;
waitUntil{PDT_ProjBark_Dog distance _postition < 2};
PDT_ProjBark_Dog playMoveNow "Dog_Sit";
