#define GETDOGVAR(VAR) (((PDT_ProjBark_Handler getVariable "dogInfo") select 0) getVariable VAR)
#define SETDOGVAR(VAR, VALUE) (((PDT_ProjBark_Handler getVariable "dogInfo") select 0) setVariable [VAR, VALUE])
#define RESETCONTROLER PDT_ProjBark_Controler setPos [(getPosATL PDT_ProjBark_Handler select 0) + 2, (getPosATL PDT_ProjBark_Handler select 1) + 2, (getPosATL PDT_ProjBark_Handler select 2)]
