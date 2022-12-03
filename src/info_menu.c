#include "info_menu.h"
#include "states.h"
#include "gba.h"

#include "coral_bg.h"
#include "start_menus_ss.h"

int state, hOff, vOff;
OBJ_ATTR shadowOAM[128];


void doInfoMenu() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        goAboutMenu();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goControlsMenu();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goStartMenu();
    }
    waitForVBlank();
    hOff += 1;
    REG_BG0HOFF = hOff / 8;
}

void goInfoMenu() {

    hideSprites();

    state = INFO_MENU;

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, coral_bgPal, PALETTE, coral_bgPalLen/2);
    DMANow(3, coral_bgTiles, &CHARBLOCK[0], coral_bgTilesLen/2);
    DMANow(3, coral_bgMap, &SCREENBLOCK[31], coral_bgMapLen/2);

    DMANow(3, start_menus_ssPal, SPRITEPALETTE, start_menus_ssPalLen/2);
    DMANow(3, start_menus_ssTiles, &CHARBLOCK[4], start_menus_ssTilesLen/2);

    hOff = 0;

    shadowOAM[0].attr0 = ATTR0_4BPP | (40 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (32 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(24,0,32);

    shadowOAM[2].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (110 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(16,20,32);

    shadowOAM[3].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[3].attr1 = ATTR1_LARGE | (174 & 0x1FF);
    shadowOAM[3].attr2 = OFFSET(24,20,32);

    DMANow(3, shadowOAM, OAM, 512);
}