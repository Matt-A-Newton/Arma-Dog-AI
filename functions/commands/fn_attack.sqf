/*
 *	Author: PDT
 *	commands a dog to attack a target
 *
 *	Arguments:
 *  0: _target <OBJECT> - the target to attack (optional)
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_attack;
 *  [bob] call PDT_Dog_fnc_attack;
 *
 */

#include "..\macros.hpp"

params[["_target", objNull]];
if (_target isEqualTo objNull) then { // params default value
	_target = cursorObject;             // doesn't want to work
};                                    // this is a fix for that

[PDT_ProjBark_Controler] joinSilent grpNull;       // fixes the stuttery behaviour
PDT_ProjBark_Controler setAnimSpeedCoef 1.35;       // makes the dog go fast

call PDT_Dog_fnc_resetDog;

// if the target is alive, is less than 100m from the dog, is a man, and is not in the dog's group
if (alive _target && {_target distance PDT_ProjBark_Dog <= 250} && {_target isKindOf "MAN"} && {!(_target in (units (group PDT_ProjBark_Dog)))}) then {
	SETDOGVAR("following", false);
	SETDOGVAR("attacking", true);
	PDT_ProjBark_Dog playMoveNow "Dog_Sprint";
	PDT_ProjBark_Dog enableAI "MOVE";
	PDT_ProjBark_Controler enableAI "MOVE";
	//private _delay = 0.60; // values lower than this cause issues targets outside
  private _delay = 1;

  // Attack loop
  waitUntil {
    if (PDT_ProjBark_Controler distance _target <= 3) then {
      _target setDamage 0.75;           // deal damge to the target
      _target disableAI "MOVE";         // stop the target from moving
      _target setUnconscious true;      // knock out the target
      doStop PDT_ProjBark_Controler;                 // make the target stop

      PDT_ProjBark_Dog playMoveNow "Dog_Idle_Growl"; // nice animation for the dog


      PDT_ProjBark_Dog attachTo [_target, [0, -2, 0]];
      private _oldDir = getDir _target;                  // current player dir
      _target setDir 0;                                        // set player dir 0
      PDT_ProjBark_Dog setDir 0;                                           // set dog dir 0
      PDT_ProjBark_Dog setDir _oldDir;                                          // set dog dir 90
      _target setDir (_oldDir);                          // reset player dir
      ["Dog_DetectedBomb", 3, 15] call PDT_Dog_fnc_playSound;

      // Tracker to make sure target gets up
      [_target] spawn {
        params[["_target", objNull]];
        if (isNull _target) exitWith {};
        waitUntil {
          if !(GETDOGVAR("attacking")) then {
            _target setUnconscious false;
            _target enableAI "MOVE";
            true
          } else {
            false
          };
        };
      };
      true
    } else {
      PDT_ProjBark_Controler doMove (ASLToATL (AGLToASL (_target modelToWorld [1, 8, 0.0]))); // move to the target pos getPosATL
      uiSleep _delay;                       // is needed or things break
      false
    };
  };
} else { // if any condition on line 28 is false
	hint "Your K-9 looks up at you as if to say 'no one is there'"; // no target
};
