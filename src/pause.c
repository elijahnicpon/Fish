#include "pause.h"
#include "states.h"
#include "gba.h"

#include "coral_bg.h"
#include "pause_and_about_menus_ss.h"

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];

void doPause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goStartMenu();
    }
    waitForVBlank();
    hOff += 1;
    vOff = 0;
    //time++;
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff / 8;
}

void goPause() {
    hideSprites();
    state = PAUSE;

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, coral_bgPal, PALETTE, coral_bgPalLen/2);
    DMANow(3, coral_bgTiles, &CHARBLOCK[0], coral_bgTilesLen/2);
    DMANow(3, coral_bgMap, &SCREENBLOCK[31], coral_bgMapLen/2);

    DMANow(3, pause_and_about_menus_ssPal, SPRITEPALETTE, pause_and_about_menus_ssPalLen/2);
    DMANow(3, pause_and_about_menus_ssTiles, &CHARBLOCK[4], pause_and_about_menus_ssTilesLen/2);
    //Draw Pause.
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (46 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (10 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,0,32);
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (46 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_LARGE | (74 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(8,0,32);

    // Draw Pause Options.
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_WIDE | (40 & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (90 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(0,8,32);

    shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_WIDE | (40 & 0xFF);
    shadowOAM[3].attr1 = ATTR1_LARGE | (154 & 0x1FF);
    shadowOAM[3].attr2 = OFFSET(8,8,32);

    shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_WIDE | (40 & 0xFF);
    shadowOAM[4].attr1 = ATTR1_LARGE | (218 & 0x1FF);
    shadowOAM[4].attr2 = OFFSET(16,8,32);

    DMANow(3, shadowOAM, OAM, 512);
}