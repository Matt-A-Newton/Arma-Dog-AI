/*
 *	Author: PDT
 *	creates tracks for a dog to follow
 *
 *	Arguments:
 *  0: _target <OBJECT> - the target to track
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	[Bob] spawn PDT_DOG_fnc_createTracks;
 *
 */

#include "..\macros.hpp"

params [["_target", objNull]];

// if no target, exit
if (_target isEqualTo objNull) exitWith {hint "PDT_DOG_createTracks: No target";};
// if isn't alive, more than 100m from dog, isn't a man, or is in the dogs group
// exit
if (!alive _target || {_target distance PDT_ProjBark_Dog > 100} ||
  {!(_target isKindOf "MAN")} || {_target in (units (group PDT_ProjBark_Dog))}) exitWith {
    hint "Your K-9 looks up at you as if to say 'no one is there'"
  };

private _trackingObject = "Sign_Sphere10cm_F";                  // track object
private _tracks = [];                                           // tracks
private _track = createSimpleObject [_trackingObject, [0,0,0]]; // track
_target setVariable["beingTracked", true];                      // set var
// while target is alive and being tracked
while {alive _target && _target getVariable["beingTracked", false]} do {
  private _targetPos = getPosATL _target;                     // target pos
  private _trackInfo = [];                                    // track info
  if !(isNull objectParent _target) exitWith {};              // target in car
  _track setPos (_targetPos);                                 // set track pos
  _tracks pushBack _track;                                    // track to array
  _nextTrack = createSimpleObject [_trackingObject, [0,0,0]]; // next track
  _trackInfo = [_track, _nextTrack, _target];                 // set track info
  _track setVariable ["trackInfo", _trackInfo];               // set track var
  _target setVariable["tracks", _tracks];                     // set tracks var
  _track = _nextTrack;                                        // setup new track
  uiSleep (random [0, 10, 20]);                               // wait ~0-20 sec
};
