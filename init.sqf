#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "functions\macros.hpp"
/* Not currently used, may be used in the future for CBA settings
[
    "PDT_ProjectBark", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Ballistic breach weapons", "A list of weapons seperated by a comma that can be used for ballistic breaches."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Immersive Breaching", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["arifle_MX_F"], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
*/


// CBA keybinds

// attacking
["Project Bark","PDT_Dog_Attack_Key", "Attack", {[cursorObject] spawn PDT_Dog_fnc_attack}, "", [DIK_H, [false, false, false]]] call CBA_fnc_addKeybind;
["Project Bark","PDT_Dog_Release_Key", "Release", {[] spawn PDT_Dog_fnc_release}, "", [DIK_H, [true, false, false]]] call CBA_fnc_addKeybind;

// obedience
["Project Bark","PDT_Dog_Come_Key", "Come", {[] spawn PDT_Dog_fnc_come}, "", [DIK_Y, [false, false, false]]] call CBA_fnc_addKeybind;
["Project Bark","PDT_Dog_Follow_Key", "Follow", {[] spawn PDT_Dog_fnc_follow}, "", [DIK_Y, [true, false, false]]] call CBA_fnc_addKeybind;
["Project Bark","PDT_Dog_Point_Key", "Point", {[] spawn PDT_Dog_fnc_point}, "", [DIK_Y, [false, true, false]]] call CBA_fnc_addKeybind;
["Project Bark","PDT_Dog_Sit_Key", "Sit", {[] spawn PDT_Dog_fnc_sit}, "", [DIK_J, [true, false, false]]] call CBA_fnc_addKeybind;

// specialty
["Project Bark","PDT_Dog_Search_Key", "Search", {[] spawn PDT_Dog_fnc_search}, "", [DIK_J, [false, false, false]]] call CBA_fnc_addKeybind;
["Project Bark","PDT_Dog_Track_Key", "Track", {[((nearestObjects [(screenToWorld [0.5, 0.5]), [], 5]) select 0)] spawn PDT_Dog_fnc_track}, "", [DIK_J, [false, true, false]]] call CBA_fnc_addKeybind;

// misc
["Project Bark","PDT_Dog_Carry_Key", "Carry Dog", {[] spawn PDT_Dog_fnc_carryDog}, "", [DIK_K, [false, false, false]]] call CBA_fnc_addKeybind;
