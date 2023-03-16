/*
 *	Author: PDT
 *	commands a dog to follow the PDT_ProjBark_Handler
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_follow;
 *
 */

#include "..\macros.hpp"

//CONTROLER setAnimSpeedCoef 1.50; // makes the dog go fast

SETDOGVAR("following", true);
SETDOGVAR("barking", false);

PDT_ProjBark_Dog playMoveNow "Dog_Sprint";
PDT_ProjBark_Dog enableAI "MOVE";
call PDT_Dog_fnc_resetDog;
private _delay = 1;                              // delay in seconds

waitUntil {
  if !(GETDOGVAR("following")) then {
    true
  } else {

  if ([PDT_ProjBark_Handler] call PDT_Dog_fnc_isInBuilding && !((attachedTo PDT_ProjBark_Dog) isEqualTo PDT_ProjBark_Handler)) then {
    PDT_ProjBark_Dog attachTo [PDT_ProjBark_Handler, [0.5,0,0]];
    _delay = 0.25;
  } else {
    if (!([PDT_ProjBark_Handler] call PDT_Dog_fnc_isInBuilding) && (attachedTo PDT_ProjBark_Dog) isEqualTo PDT_ProjBark_Handler) then {
      PDT_ProjBark_Controler setPos (getPosATL PDT_ProjBark_Handler);
      call PDT_Dog_fnc_resetDog;
    };
  };

    private _sprintPos =  ASLToATL (AGLToASL (PDT_ProjBark_Handler modelToWorld [1, 15, 0.0]));
    private _runPos =  ASLToATL (AGLToASL (PDT_ProjBark_Handler modelToWorld [1, 8, 0.0]));
    private _walkPos = ASLToATL (AGLToASL (PDT_ProjBark_Handler modelToWorld [1, 6, 0.0]));
    private _sitPos = ASLToATL (AGLToASL (PDT_ProjBark_Handler modelToWorld [1, 0, 0.0]));

    private _dogDistance = PDT_ProjBark_Dog distance PDT_ProjBark_Handler;        // distance dog to PDT_ProjBark_Handler
    private _PDT_ProjBark_HandlerSpeed = abs (round (speed PDT_ProjBark_Handler));
    switch (true) do {
      case (_PDT_ProjBark_HandlerSpeed > 1 && _PDT_ProjBark_HandlerSpeed < 7): {   // dog is close
        PDT_ProjBark_Controler setAnimSpeedCoef 1.0;
        PDT_ProjBark_Dog playMoveNow "Dog_Walk";                    // the dog should walk
        PDT_ProjBark_Controler moveTo _walkPos;
      };
      case (_PDT_ProjBark_HandlerSpeed > 7 && _PDT_ProjBark_HandlerSpeed < 15): { // dog is simi-close
        PDT_ProjBark_Controler setAnimSpeedCoef 1.15;
        PDT_ProjBark_Dog playMoveNow "Dog_Run";                     // the dog should run
        PDT_ProjBark_Controler moveTo _runPos;
      };
      case (_PDT_ProjBark_HandlerSpeed > 15): {                      // dog is far
        PDT_ProjBark_Controler setAnimSpeedCoef 1.25;
        PDT_ProjBark_Dog playMoveNow "Dog_Sprint";                  // the dog should sprint
        PDT_ProjBark_Controler moveTo _runPos;
      };
      case (_PDT_ProjBark_HandlerSpeed isEqualTo 0): {     // the PDT_ProjBark_Handler stopped
        PDT_ProjBark_Controler setAnimSpeedCoef 1.0;
        PDT_ProjBark_Controler moveTo _sitPos;
        waitUntil {round (PDT_ProjBark_Controler distance _sitPos) <= 3};
        PDT_ProjBark_Dog playMoveNow "Dog_Sit";                     // the dog should sit
        doStop PDT_ProjBark_Controler;
      };
    };
    uiSleep _delay;                                    // wait for ~_delay seconds
    false
  };
};
