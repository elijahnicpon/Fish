#include "gba.h" // Mode 0 Scaffold
#include "print.h"
#include "states.h"

int state, shells_owned;
u16 buttons, oldButtons;
void init();

// ------------------------------------------------------------------------------
// M02 COMMENT:
    //CONTROLS:
        // <- , -> :        player movement
        // ↑ :              upgrade agility
        // -> :             upgrade energy
        // ↓ :              upgrade shield

        // R + L + SELECT:  Cheat: Add 100 Shells once per run in UPGRADE_MENU state only.
                                //('A' + 'S' + 'DEL') on default Mac controls

        // all others listed in-game
    //NOTES:
        //Need to fix GAME state palettes and priorities
        //Need to rebalance shell values
        //Need to add upgrade controls instructions
        //Need to design controls page
            //There's a few other sub-menus already implemented I just didn't come up with a design I liked yet.
                //See state machine for the menus I've implemented
        //Enemies not yet implemented per Tuesday conversation, opted for fully-functioning upgrades instead.
    
    //QUESTIONS:
        //Is it okay to remove the return to start from pause? 
                //it would reset all stats and would be a pain to accidently hit it.
// ------------------------------------------------------------------------------


int main() {
    init();
    mgba_open();
    mgba_printf("Debugging Initialized :)");
    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch (state) {
            case START_MENU:
                doStartMenu();
                break;

            case INFO_MENU:
                doInfoMenu();
                break;

            case ABOUT_MENU:
                doAboutMenu();
                break;

            case CONTROLS_MENU:
                doControlsMenu();
                break;
            
            case GAME:
                doGame();
                break;
            
            case PAUSE:
                doPause();
                break;
            
            case DEATH_ENERGY:
                doDeathEnergy();
                break;

            case UPGRADE_MENU:
                doUpgradeMenu();
                break;

            case DEATH_PLASTIC:
                doDeathPlastic();
                break;
            
            default:
                break;
        }
    }
}

void init() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    setupInterrupts();
    setupSounds();

    int shells_owned = 0; 
    u16 oldButtons = 0;
    u16 buttons = BUTTONS;

    hideSprites();
    goStartMenu();
}