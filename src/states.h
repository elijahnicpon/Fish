#include "start_menu.h"
#include "info_menu.h"
#include "game.h"
#include "pause.h"
#include "about_menu.h"
#include "death_energy.h"
#include "death_plastic.h"
#include "death_boat.h"
#include "death_oil.h"
#include "death_cyanide.h"
#include "death_dynamite.h"
#include "death_shark.h"
#include "upgrade_menu.h"
#include "controls_menu.h"
#include "sound.h"
#include "win.h"



enum STATE {START_MENU, INFO_MENU, CONTROLS_MENU, ABOUT_MENU, GAME, PAUSE, UPGRADE_MENU, END_ANIMATION, END_MENU, DEATH_ENERGY, DEATH_PLASTIC, DEATH_OIL, DEATH_BOAT, DEATH_SHARK, DEATH_CYANIDE, DEATH_BLAST};
int state;
int shells_owned;
int time;
int gameSpeed;

typedef struct {
    int x;
    int prevX;
    int y;
    int frame;
    int numFrames;
    int height;
    int width;
    int entry_OAM;
    int shieldsLeft;
    int agility;
    int energy;
    int startingEnergy;
    
    int shieldUpgradeValue;
    int agilityUpgradeValue;
    int energyUpgradeValue;

    int shieldUpgradeCost;
    int agilityUpgradeCost;
    int energyUpgradeCost;
} Player;