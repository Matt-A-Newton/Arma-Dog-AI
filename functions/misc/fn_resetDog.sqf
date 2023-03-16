/*
 *	Author: PDT
 *	resets the dog's attachment to the controler.
 *
 *	Arguments:
 *  None.
 *
 *	Return Value:
 *	None
 *
 *	Example:
 *	call PDT_Dog_fnc_resetDog;
 *
 */

detach PDT_ProjBark_Dog;

PDT_ProjBark_Dog attachTo [PDT_ProjBark_Controler, [0,0,0]];
