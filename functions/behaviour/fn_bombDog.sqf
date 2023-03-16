/*
 *	Author: PDT
 *	handles detection of bombs by a dog
 *
 *	Arguments:
 *  0: detectDistance <NUMBER> - how far to detect bombs
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[15] call PDT_Dog_fnc_bombDog;
 *
 */

#include "..\macros.hpp"
params["_detectDistance"];
private _detectableBombs = [ // the types of bombs to detect
  "TimeBombCore", "DirectionalBombBase", "BoundingMineBase", "MineBase", "PipeBombBase"
];


private _bombDetected = false;


waitUntil {
  if !(alive PDT_ProjBark_Dog) then {
    true
  } else {
    private _detectedBombs = allMines select {(_x distance PDT_ProjBark_Dog) <= _detectDistance};

    if !((count _detectedBombs) isEqualTo 0) then {
      PDT_ProjBark_Controler lookAt (_detectedBombs select 0); // look at nearest bomb
      PDT_ProjBark_Dog lookAt (_detectedBombs select 0);       // look at nearest bomb
      ["Dog_DetectedBomb", 3, 2] call PDT_Dog_fnc_playSound; // make the dog bark
    } else {
      PDT_ProjBark_Controler lookAt (PDT_ProjBark_Handler);                 // look at the PDT_ProjBark_Handler
      PDT_ProjBark_Dog lookAt (PDT_ProjBark_Handler);                       // look at the PDT_ProjBark_Handler
    };
    sleep 1;

    false
  };
};
