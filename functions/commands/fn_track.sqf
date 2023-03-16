/*
 *	Author: PDT
 *	commands a dog to track a target
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[] call PDT_Dog_fnc_track;
 *
 */

#include "..\macros.hpp"
params [["_track", objNull]];

SETDOGVAR("following", false);

PDT_ProjBark_Controler setAnimSpeedCoef 1.35;
private _trackingObject = "Sign_Sphere10cm_F"; // object to track
// if no track was found, exit
if (_track isEqualTo objNull || {!(typeOf _track isEqualTo _trackingObject)}) exitWith {hint "PDT_Dog_track: No track found";};

private _trackInfo = _track getVariable ["trackInfo", []]; // track info
// if no track info was found, exit
if (_trackInfo isEqualTo []) exitWith {hint "PDT_Dog_track: No track info";};

SETDOGVAR("tracking", true);

waitUntil {
  // "Tracking" branch.
  if (GETDOGVAR("tracking")) then {
    _trackInfo = _track getVariable ["trackInfo", []];     // track info
    private _nextTrack = _trackInfo select 1;              // the next track
    private _target = _trackInfo select 2;                 // target being tracked
    private _trackPos = getPosATL _track;                  // track position

    // Move to next track.
    PDT_ProjBark_Dog playMoveNow "Dog_Sprint";
    PDT_ProjBark_Controler doMove (_trackPos);

    // Check if the dog is near the target.
    if (PDT_ProjBark_Dog distance _target <= 200) exitWith {
      [_target] call PDT_Dog_fnc_attack;                        // attatck _target
      _target getVariable["beingTracked", false];          // stop tracking
      private _tracks = _target getVariable["tracks", []]; // get tracks array
      [_tracks] call PDT_Dog_fnc_cleanupTracks;             // clean up tracks
      _target setVariable["tracks", []];                   // reset _target tracks array
      true
    };

    // Wait until the dog is close to a track
    waitUntil {
      if ((PDT_ProjBark_Controler distance _trackPos) <= 10) then {     // dog is close to track
        deleteVehicle _track;                             // delete the track
        true
      } else {
        false
      };
    };

    _track = _nextTrack;                                 // setup next track
    waitUntil {if ((_track getVariable ["trackInfo", []]) isEqualTo []) then {false} else {true}};
    false
  } else {
    true
  };
};
