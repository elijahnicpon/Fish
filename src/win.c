#include "win.h"
#include "states.h"
#include "gba.h"

#include "win_ss.h"
#include "win_bg.h"

int state, hOff, vOff, time, wintime;
OBJ_ATTR shadowOAM[128];

int clarkFrames[4] = {8,4,0,4};

typedef struct {
    int x;
    int y;
    int frame;
    int active;

} Clark;
Clark clark = {.x = -24, .y = 110, .frame = 0, .active = 1};

void drawWin();

void doWin() {
    //hideSprites();
    
    waitForVBlank();
    wintime++;
    drawWin();
    DMANow(3, shadowOAM, OAM, 512);
    if (BUTTON_PRESSED(BUTTON_START)){
        goStartMenu();
    }
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
}

void drawWin() {

    //Draw Coral Top
    shadowOAM[0].attr0 = ATTR0_4BPP | (100 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (116 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,2,32);

    if (clark.active) {
        if (wintime % 10 == 0) {
            clark.frame = (clark.frame + 1) % 4;
            clark.x++;
            if (clark.y > 111) {
                clark.y--;
            } else {
                clark.y++;
            }
        }
        if (clark.x == 122) {
            clark.active = 0;
        }
        shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (clark.y & 0xFF);
        shadowOAM[1].attr1 = ATTR1_MEDIUM | (clark.x & 0x1FF);
        shadowOAM[1].attr2 = clarkFrames[clark.frame];
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }

    if (wintime > (60 * 12)) {
        int xAlign = 50;
        int yAlign = 80;

        shadowOAM[2].attr0 = ATTR0_4BPP | (yAlign & 0xFF);
        shadowOAM[2].attr1 = ATTR1_LARGE | (xAlign & 0x1FF);
        shadowOAM[2].attr2 = OFFSET(0,10,32);
        shadowOAM[3].attr0 = ATTR0_4BPP | (yAlign & 0xFF);
        shadowOAM[3].attr1 = ATTR1_LARGE | ((64 + xAlign) & 0x1FF);
        shadowOAM[3].attr2 = OFFSET(8,10,32);
        shadowOAM[4].attr0 = ATTR0_4BPP | (yAlign & 0xFF);
        shadowOAM[4].attr1 = ATTR1_LARGE | ((128 + xAlign) & 0x1FF);
        shadowOAM[4].attr2 = OFFSET(16,10,32);

    }
}


void goWin() {
    hideSprites();
    state = END_MENU;
    REG_DISPCTL = BG0_ENABLE | SPRITE_ENABLE | MODE0;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, win_bgPal, PALETTE, win_bgPalLen/2);
    DMANow(3, win_bgTiles, &CHARBLOCK[0], win_bgTilesLen/2);
    DMANow(3, win_bgMap, &SCREENBLOCK[31], win_bgMapLen/2);

    DMANow(3, win_ssPal, SPRITEPALETTE, win_ssPalLen/2);
    DMANow(3, win_ssTiles, &CHARBLOCK[4], win_ssTilesLen/2);

    //Draw Coral Top
    shadowOAM[0].attr0 = ATTR0_4BPP | (100 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_LARGE | (116 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,2,32);
    
    int wintime = 0;
    clark.x = -24;
    clark.y = 110;
    clark.active = 1;
    clark.frame = 0;

    DMANow(3, shadowOAM, OAM, 512);
}