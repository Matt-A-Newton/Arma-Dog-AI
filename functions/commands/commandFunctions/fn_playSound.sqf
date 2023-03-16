/*
 *	Author: PDT
 *	plays a sound around a dog
 *
 *	Arguments:
 *  0: sound      <STRING> - file path to a sound
 *  1: duration   <NUMBER> - duration of the sound
 *  2: reapeatNum <NUMBER> - number of times to repeat the sound
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	["file\path", 15] call PDT_Dog_fnc_playSound;
 *
 */

#include "..\..\macros.hpp"
params["_sound", ["_duration", 3], ["_reapeatNum", 5]];

_dummy = "#particlesource" createVehicle getPosATL PDT_ProjBark_Dog;
_dummy attachTo [PDT_ProjBark_Dog, [0, 0, 0.75]];
for "_i" from 0 to _reapeatNum do {
    _dummy say3D _sound;
    sleep _duration;
};
deleteVehicle _dummy;
