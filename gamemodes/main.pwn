#include <a_samp>

// Core Definitions
#undefine MAX_PLAYERS
    #define MAX_PLAYERS 10

public OnGameModeInit()
{
    print("[OnGameModeInit] Initializing script..");

    //OnGameModeInit_
}

main(){}

// Custom Functions

OnGameModeInit_Setup()
{
	log("[OnGameModeInit_Setup] Setting up...");

	// removed the file thing, so left this at the last version number for now.
	// probably needs a better method, like a build-time variable or something.
	new buildstring[12] = "1769";

	// file_read("BUILD_NUMBER", buildstring);
	gBuildNumber = strval(buildstring);

	gAccounts = db_open_persistent(ACCOUNT_DATABASE);

	LoadSettings();

	SendRconCommand(sprintf("mapname %s", GetMapName()));

	GetSettingInt("server/global-debug-level", 0, gGlobalDebugLevel);
	debug_set_level("global", gGlobalDebugLevel);

	RestartCount				=TextDrawCreate(430.000000, 10.000000, "Server Restart In:~n~00:00");
	TextDrawAlignment			(RestartCount, 2);
	TextDrawBackgroundColor		(RestartCount, 255);
	TextDrawFont				(RestartCount, 1);
	TextDrawLetterSize			(RestartCount, 0.400000, 2.000000);
	TextDrawColor				(RestartCount, -1);
	TextDrawSetOutline			(RestartCount, 1);
	TextDrawSetProportional		(RestartCount, 1);
}