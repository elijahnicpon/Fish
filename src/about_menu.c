#include "start_menu.h"
#include "states.h"
#include "gba.h"

#include "coral_bg.h"
#include "pause_and_about_menus_ss.h"

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];

void doAboutMenu() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goInfoMenu();
    }
    waitForVBlank();
    hOff += 1;
    vOff = 0;
    time++;
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff / 8;
}

void goAboutMenu() {
    hideSprites();
    state = ABOUT_MENU;

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, coral_bgPal, PALETTE, coral_bgPalLen/2);
    DMANow(3, coral_bgTiles, &CHARBLOCK[0], coral_bgTilesLen/2);
    DMANow(3, coral_bgMap, &SCREENBLOCK[31], coral_bgMapLen/2);

    DMANow(3, pause_and_about_menus_ssPal, SPRITEPALETTE, pause_and_about_menus_ssPalLen/2);
    DMANow(3, pause_and_about_menus_ssTiles, &CHARBLOCK[4], pause_and_about_menus_ssTilesLen/2);

    //Draw About Title
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (4 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (84 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,4,32);
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (4 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_LARGE | (148 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(8,4,32);

    //Draw About Description
    shadowOAM[2].attr0 = ATTR0_4BPP | (20 & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (24 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(0,16,32);
    shadowOAM[3].attr0 = ATTR0_4BPP | (20 & 0xFF);
    shadowOAM[3].attr1 = ATTR1_LARGE | (88 & 0x1FF);
    shadowOAM[3].attr2 = OFFSET(8,16,32);
    shadowOAM[4].attr0 = ATTR0_4BPP | (20 & 0xFF);
    shadowOAM[4].attr1 = ATTR1_LARGE | (152 & 0x1FF);
    shadowOAM[4].attr2 = OFFSET(16,16,32);

    shadowOAM[5].attr0 = ATTR0_4BPP | (84 & 0xFF);
    shadowOAM[5].attr1 = ATTR1_LARGE | (24 & 0x1FF);
    shadowOAM[5].attr2 = OFFSET(0,24,32);
    shadowOAM[6].attr0 = ATTR0_4BPP | (84 & 0xFF);
    shadowOAM[6].attr1 = ATTR1_LARGE | (88 & 0x1FF);
    shadowOAM[6].attr2 = OFFSET(8,24,32);
    shadowOAM[7].attr0 = ATTR0_4BPP | (84 & 0xFF);
    shadowOAM[7].attr1 = ATTR1_LARGE | (152 & 0x1FF);
    shadowOAM[7].attr2 = OFFSET(16,24,32);

    //Draw back instruction
    shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_WIDE | (148 & 0xFF);
    shadowOAM[8].attr1 = ATTR1_LARGE | (80 & 0x1FF);
    shadowOAM[8].attr2 = OFFSET(0,13,32);
    shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_WIDE | (148 & 0xFF);
    shadowOAM[9].attr1 = ATTR1_LARGE | (144 & 0x1FF);
    shadowOAM[9].attr2 = OFFSET(8,13,32);

    DMANow(3, shadowOAM, OAM, 512);
}