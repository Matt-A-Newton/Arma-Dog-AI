/*
 *	Author: PDT
 *	allows the handler to carry their dog; acts as a "reset" if the dog is stuck
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	call PDT_DOG_fnc_carryDog;
 *
 */

#include "..\macros.hpp"

if (GETDOGVAR("carried")) then {                          // if dog carried
  SETDOGVAR("carried", false);                            // reset var
  detach PDT_ProjBark_Dog;                                             // detach dog
  PDT_ProjBark_Dog enableAI "ANIM";                                    // allow animations
  RESETCONTROLER;                                         // reset controler
  call PDT_Dog_fnc_resetDog;
} else {                                                  // if dog not carried
  SETDOGVAR("carried", true);                             // set var
  detach PDT_ProjBark_Dog;                                             // detatch dog
  PDT_ProjBark_Dog playMoveNow "Dog_Idle_Stop";                        // neutral animation
  PDT_ProjBark_Dog disableAI "ANIM";                                   // distable animations
  PDT_ProjBark_Dog attachTo [player, [-0.05, -0.17, -0.50], "Pelvis"]; // "pickup" dog

  private _oldPlayerDir = getDir PDT_ProjBark_Handler;                  // current player dir
  player setDir 0;                                        // set player dir 0
  PDT_ProjBark_Dog setDir 0;                                           // set dog dir 0
  PDT_ProjBark_Dog setDir 90;                                          // set dog dir 90
  player setDir (_oldPlayerDir);                          // reset player dir
};
