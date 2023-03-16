/*
 *	Author: PDT
 *	allows the handler to control their dog EXPERIMENTAL
 *
 *	Arguments:
 *  0: _dog <OBJECT> - the dog to control
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	call PDT_Dog_fnc_controlDog;
 *  [fluffy] call PDT_Dog_fnc_controlDog;
 *
 */
#include "..\macros.hpp"

if (GETDOGVAR("controlling")) then {
  deleteVehicle (GETDOGVAR("camera"));
  SETDOGVAR("controlling", false);
  selectPlayer PDT_ProjBark_Handler;
} else {
  detach PDT_ProjBark_Dog;
  selectPlayer PDT_ProjBark_Dog;

  // create a camera for the PDT_ProjBark_Handler to look through
  PDT_ProjBark_Dog setAnimSpeedCoef 1.5;
  _camera = "Land_HandyCam_F" createVehicle [0,0,0];
  _camera setDir ((getDir PDT_ProjBark_Dog) - 180);
  _camera camCommit 0;
  _camera attachTo [PDT_ProjBark_Dog, [0, 0.25, 1]];
  switchCamera _camera;
  SETDOGVAR("controlling", true);
  SETDOGVAR("camera", _camera);
  PDT_ProjBark_Dog enableAI "MOVE";
};
