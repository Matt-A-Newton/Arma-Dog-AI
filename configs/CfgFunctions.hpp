class CfgFunctions
{
	class PDT_Dog // tag
	{
		// setup functions; spawning and initialising
		class setup
		{
			class setupDog     {file = "functions\setup\fn_setupDog.sqf";};
		};

		// commands and command functions; handle and support dog actions
		class commands
		{
			// commands
			class attack       {file = "functions\commands\fn_attack.sqf";};
			class follow       {file = "functions\commands\fn_follow.sqf";};
			class point        {file = "functions\commands\fn_point.sqf"};
			class release      {file = "functions\commands\fn_release.sqf";};
			class search       {file = "functions\commands\fn_search.sqf";};
			class sit          {file = "functions\commands\fn_sit.sqf";};
			class track        {file = "functions\commands\fn_track.sqf";};
			class playSound    {file = "functions\commands\commandFunctions\fn_playSound.sqf";};
			class isInBuilding {file = "functions\commands\commandFunctions\fn_isInBuilding.sqf";};
		};

		// behaviour functions; the backbone of the dog
    class behaviour
    {
      class dogBehaviour  {file = "functions\behaviour\fn_dogBehaviour.sqf";};
      class bombDog      {file = "functions\behaviour\fn_bombDog.sqf";};
      class loadDog      {file = "functions\behaviour\fn_loadDog.sqf";};
			class unloadDog    {file = "functions\behaviour\fn_unloadDog.sqf";};
			class controlDog   {file = "functions\behaviour\fn_controlDog.sqf";};
    };

		// misc functions; misc actions and other random things
		class misc
		{
			class carryDog     {file = "functions\misc\fn_carryDog.sqf";};
      class resetDog     {file = "functions\misc\fn_resetDog.sqf";};
		};

		// tracking functions; backbone for tracking
		class tracking
		{
			class createTracks  {file = "functions\tracking\fn_createTracks.sqf";};
      class cleanupTracks {file = "functions\tracking\fn_cleanupTracks.sqf";};
		}
	};
};
