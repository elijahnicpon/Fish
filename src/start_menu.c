#include "start_menu.h"
#include "states.h"
#include "gba.h"

#include "coral_bg.h"
#include "start_menus_ss.h"

#include "sixth_station.h"

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];


void doStartMenu() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goGame(time);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goInfoMenu(goStartMenu);
    }
    waitForVBlank();
    hOff += 1;
    time++;
    REG_BG0HOFF = hOff / 8;
}

void goStartMenu() {

    hideSprites();

    state = START_MENU;

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, coral_bgPal, PALETTE, coral_bgPalLen/2);
    DMANow(3, coral_bgTiles, &CHARBLOCK[0], coral_bgTilesLen/2);
    DMANow(3, coral_bgMap, &SCREENBLOCK[31], coral_bgMapLen/2);

    DMANow(3, start_menus_ssPal, SPRITEPALETTE, start_menus_ssPalLen/2);
    DMANow(3, start_menus_ssTiles, &CHARBLOCK[4], start_menus_ssTilesLen/2);

    hOff = 0;
    time = 0;

    //FONTS: MENU TITLE:            HELVETICA 22pt, BOLD
        //   BUTTON TEXT:           PT MONO 8pt, 
        //   BUTTON DESCRIPTION:    HELVETICA 14pt, BOLD
        //   BODY TEXT:             ARIAL 9pt, BOLD
        // . SM BUTTON DESCRIPTION: HELVETICA 11pt, BOLD

    shadowOAM[0].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (20 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,0,32);

    shadowOAM[1].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_LARGE | (84 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(8,0,32);

    shadowOAM[2].attr0 = ATTR0_4BPP | (40 & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (150 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(0,20,32);

    shadowOAM[3].attr0 = ATTR0_4BPP | (40 & 0xFF);
    shadowOAM[3].attr1 = ATTR1_LARGE | (214 & 0x1FF);
    shadowOAM[3].attr2 = OFFSET(8,20,32);

    DMANow(3, shadowOAM, OAM, 512);
    //TODO: uncomment below
    //playSoundA(town_w_ocean_view_data, town_w_ocean_view_length - 500, 1);
    playSoundA(sixth_station_data, sixth_station_length - 500, 1);
}