/*
 *	Author: PDT
 *	sets up scroll wheel actions
 *
 *	Arguments:
 *  0: dogSpecialty <STRING> - what a dog specialises in (Bomb or SF)
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	["SF"] call PDT_Dog_fnc_dogBehavior;
 *
 */

#include "..\macros.hpp"
params[["_dogSpecialty", "SF"]];

// allow the dog to detect bombs **Only two tpyes avaiable, may add more, defautl off
switch (_dogSpecialty) do {
	case "Bomb": {
		[20] spawn PDT_Dog_fnc_bombDog;
	};
	case "SF": {
		[15] spawn PDT_Dog_fnc_bombDog;
	};
};

// auto-load the dog **May add a CBA option to disable this
PDT_ProjBark_Handler addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    call PDT_Dog_fnc_loadDog;
	}
];

// auto-unload the dog **May add a CBA option to disable this
PDT_ProjBark_Handler addEventHandler ["GetOutMan", {
		call PDT_Dog_fnc_unloadDog;
	}
];

// kill the dog when the controler dies
[] spawn {
	waitUntil {!alive PDT_ProjBark_Controler};
	PDT_ProjBark_Dog setDamage 1;
};
