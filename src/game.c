#include "game.h"
#include "states.h"
#include "gba.h"

#include "game_ss.h"
#include "game_bg_copy.h"
#include "game_clouds_bg.h"
#include "game_clouds_SHADOW_bg.h"
#include "town_w_ocean_view.h"

#include "coin.h"

#include <stdlib.h>
#include <stdio.h>

int state, vOff, cloudVOff, gameSpeed, time, shells_owned; 
OBJ_ATTR shadowOAM[128];

void updateBackgrounds();
void initPlayer();
void initShells();
void newShell();
void checkButtons();
void updateAndDrawPlayer();
void updateAndDrawShells();
int checkNoEnergy();
int powpow(int a, int b);
int min(int a, int b);

// typedef struct {
//     int x;
//     int prevX;
//     int y;
//     int frame;
//     int numFrames;
//     int height;
//     int width;
//     int entry_OAM;
//     int shieldsLeft;
//     int agility;
//     int energy;
//     int startingEnergy;
    
//     int shieldUpgradeValue;
//     int agilityUpgradeValue;
//     int energyUpgradeValue;

//     int shieldUpgradeCost;
//     int agilityUpgradeCost;
//     int energyUpgradeCost;
// } Player;


Player player;
int playerFrames[8] = {0, 2, 4, 6, 8, 6, 4, 2};

typedef struct {
    int x;
    int value;
    int y;
    int dy;
    int height;
    int width;
    int entry_OAM;
    int active;
    int spriteIndex;
    int paletteIndex;
} Shell;

Shell shells[20] = {};
int NUM_SHELLS = 20;

void doGame() {
    time++;
    waitForVBlank();
    // checkButtons();
    updateBackgrounds();
    updateAndDrawPlayer();
    updateAndDrawShells();
    updateAndDrawHUD();
    updateAndDrawHazards();
    updateAndDrawShield();
    if (checkNoEnergy()) {
        goDeathEnergy();
    }


    if ((time / 60) > 120 + 2) {
        prepWin();
    } else {
        checkButtons();
    }
    if ((time / 60) > 120 + 3 + 2) {
        goWin();
    }
    DMANow(3, shadowOAM, OAM, 512);
}

int checkNoEnergy() {
    if (player.energy <= 0) {
        return 1;
    } else {
        return 0;
    }
}

void updateAndDrawHUD() {
    doShellDisplay();
    doShieldDisplay();
    doEnergyBar();
    doProgressBar();
}

void doProgressBar() {
    if ((time % 40) > 20) {
        // int yval = 156 - time / 120 * 60
        shadowOAM[24].attr0 = ATTR0_4BPP | ATTR0_TALL | ((48+64-4 - (((time) / (120 + 8)))) & 0xFF);
        shadowOAM[24].attr1 = ATTR1_LARGE | (231 & 0x1FF);
        shadowOAM[24].attr2 = OFFSET(18,24,32);

    } else {
        shadowOAM[24].attr0 = ATTR0_HIDE;   
    }
}

void doEnergyBar() {
    int numIndicatorBars = (player.energy  * 28) / (player.startingEnergy);
    //("%d, %d, %d", numIndicatorBars,player.energy, player.startingEnergy);
    
    for (int i = numIndicatorBars; i < 28; i++) {
        shadowOAM[30 + i].attr0 = ATTR0_HIDE;
    }
}

void initEnergyBar() {
    for (int i = 0; i < 28; i++) {
        shadowOAM[30 + i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (2 & 0xFF);
        shadowOAM[30 + i].attr1 = ATTR1_TINY | ((9 + i * 2) & 0x1FF);
        shadowOAM[30 + i].attr2 = OFFSET(8,4,32);
    }
}

void doShieldDisplay() {
    shadowOAM[29].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (11 & 0xFF);
    shadowOAM[29].attr1 = ATTR1_TINY | (59 & 0xFF);
    shadowOAM[29].attr2 = OFFSET(player.shieldsLeft, 3, 32);
}

void doShellDisplay() {
    shadowOAM[25].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (11 & 0xFF);
    shadowOAM[25].attr1 = ATTR1_TINY | (37 & 0x1FF);
    shadowOAM[25].attr2 = OFFSET(shells_owned % 10, 3, 32);

    shadowOAM[26].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (11 & 0xFF);
    shadowOAM[26].attr1 = ATTR1_TINY | (30 & 0x1FF);
    shadowOAM[26].attr2 = OFFSET((shells_owned / 10) % 10, 3, 32);
    
    shadowOAM[27].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (11 & 0xFF);
    shadowOAM[27].attr1 = ATTR1_TINY | (23 & 0x1FF);
    shadowOAM[27].attr2 = OFFSET((shells_owned / 100) % 10, 3, 32);

    shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (11 & 0xFF);
    shadowOAM[28].attr1 = ATTR1_TINY | (16 & 0x1FF);
    shadowOAM[28].attr2 = OFFSET(shells_owned / 1000, 3, 32);
}

void updateAndDrawShells() {

    if (time % 120 == 0) {
        newShell();
    }

    for (int i = 0; i < NUM_SHELLS; i++) {
        if (shells[i].active) {
            shadowOAM[shells[i].entry_OAM].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ((shells[i].y / 8) & 0xFF);
            shadowOAM[shells[i].entry_OAM].attr1 = ATTR1_TINY | ((shells[i].x / 8) & 0x1FF);
            shadowOAM[shells[i].entry_OAM].attr2 = shells[i].spriteIndex | ATTR2_PALROW(shells[i].paletteIndex) | ATTR2_PRIORITY(1);

            if (collision(shells[i].x / 8, shells[i].y / 8, shells[i].height, shells[i].width, player.x / 8, player.y, player.width, player.height)) {
                shells[i].active = 0;
                shells_owned += shells[i].value;
                //TODO: play coin sound
                playSoundB(coin_data, coin_length - 500, 0);
            }

            if (shells[i].y > 160 * 8) {
                shells[i].active = 0;
            } else {
                //TODO: replace acording to gameSpeed
                shells[i].y += gameSpeed;
            }

        } else {
            shadowOAM[shells[i].entry_OAM].attr0 = ATTR0_HIDE;
        }
    }
}

int min(int a, int b) {
    return (a < b) ? a : b;
}

void initShells() {
    for (int i = 0; i < NUM_SHELLS; i++) {
        shells[i].entry_OAM = 4 + i;
        shells[i].active = 0;
        shells[i].spriteIndex = 10;
        shells[i].height = 7;
        shells[i].width = 7;
    }
}

void newShell() {
    for (int i = 0; i < NUM_SHELLS; i++) {
        if (!shells[i].active) {
            //TODO: balance shell vals
            //shells[i].value = min(8, powpow(2, (time / 1200 * (rand() % 4))));
            shells[i].value = min(8, powpow(2, time / 120) * (rand() % 2 == 0) ? 2 : 1);
            shells[i].x = (rand() % 240) * 8;
            shells[i].y = -8*8;
            shells[i].active = 1;

            switch (shells[i].value) {
                case 1:
                    shells[i].paletteIndex = 0;
                    break;
                case 2: 
                    shells[i].paletteIndex = 1; //2
                    break;
                case 4:
                    shells[i].paletteIndex = 2; //3
                    break;
                case 8:
                    shells[i].paletteIndex = 3;
            }
            break;
        }
    }
}

int powpow(int base, int exp) {
    int returnme = 1;
    int expc = exp;
    while (exp != 0) {
        exp--;
        returnme *= base;
    }
    //mgba_printf("powpow(%d, %d) -> %d", base, expc, returnme);
    return returnme;
}

void updateAndDrawPlayer() {

    player.energy--;
    
    if (time % (10 - (gameSpeed / 2)) == 0) {
        player.frame = (player.frame + 1) % player.numFrames;
    }

    if (player.agilityUpgradeValue == 5 && player.energyUpgradeValue == 5 && player.shieldUpgradeValue == 5) {
        SPRITEPALETTE[12]++; //change ss pal @ runtime :)
    }


    shadowOAM[player.entry_OAM].attr0 = (player.y & 0xFF) | ATTR0_TALL | ATTR0_4BPP;
    shadowOAM[player.entry_OAM].attr1 = ATTR1_TINY | (player.x / 8 & 0x1FF);
    shadowOAM[player.entry_OAM].attr2 = playerFrames[player.frame] | ATTR2_PRIORITY(1);

    
}

void prepWin() {
    player.x += ((player.x / 8) > 120) ? -3 : 3;
    player.y -= 1;
    if (player.y < -16) {
        player.y = -16;
    }
}

void checkButtons() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSounds();
        goPause();
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if ((player.x + (player.agility) / 8) >= 0) {
            player.x -= player.agility;
            player.energy--;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if ((player.x + (player.agility) / 8) <= (241 - player.width) * 8) {
            player.x += player.agility;
            player.energy--;
        }
    }
}

void updateBackgrounds() {
    //TODO: balance speed
    gameSpeed = 2 + (time /( 60 * 20));

    cloudVOff -=  gameSpeed / 2;
    REG_BG0VOFF = cloudVOff / 8;
    REG_BG2VOFF = cloudVOff / 8 - 10;

    vOff -= gameSpeed;
    REG_BG1VOFF = vOff / 8;

    REG_BG1HOFF = 0;
    REG_BG0HOFF = 0;
    REG_BG2HOFF = 0;
}

void resumeGame() {
    // hideSprites();
    // state = GAME;
    // REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | MODE0;

    // REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // DMANow(3, game_bg_copyPal, PALETTE, game_bg_copyPalLen/2);
    // DMANow(3, game_bg_copyTiles, &CHARBLOCK[0], game_bg_copyTilesLen/2);
    // DMANow(3, game_bg_copyMap, &SCREENBLOCK[31], game_bg_copyMapLen/2);

    // REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    // DMANow(3, game_clouds_bgPal, PALETTE + 32, game_clouds_bgPalLen/2);
    // DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    // DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);

    // DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    // DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);
    unpauseSounds();

    hideSprites();

    state = GAME;

    //BACKGROUNDS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | BG2_ENABLE | MODE0;
                // 2 = PRIORITY
    REG_BG1CNT = 2 | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, game_bg_copyPal, PALETTE, game_bg_copyPalLen/2);
    DMANow(3, game_bg_copyTiles, &CHARBLOCK[0], game_bg_copyTilesLen/2);
    DMANow(3, game_bg_copyMap, &SCREENBLOCK[31], game_bg_copyMapLen/2);

                // 0 = PRIORITY
    REG_BG0CNT = 0 | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);
                // 1 = PRIORITY
    REG_BG2CNT = 1 | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);

    DMANow(3, game_clouds_SHADOW_bgTiles, &CHARBLOCK[2], game_clouds_SHADOW_bgTilesLen/2);
    DMANow(3, game_clouds_SHADOW_bgMap, &SCREENBLOCK[29], game_clouds_SHADOW_bgMapLen/2);


    //SPRITES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);

    //~~~~~~~~~~~~~~~~~~~~~~~~

    //HUD OUTLINE
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_MEDIUM | (2 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,4,32); //real@(0,4,32)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_MEDIUM | (34 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(4,4,32); //real@(4,4,32)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_TALL | (((160-64) / 2) & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (240-2-8 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(16,24,32);

    // initShells();
    initEnergyBar();

    DMANow(3, shadowOAM, OAM, 512);
}

void newGameRun() {
    playSoundA(town_w_ocean_view_data, town_w_ocean_view_length - 500, 1);
    // hideSprites();
    // state = GAME;
    // REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | MODE0;

    // REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // DMANow(3, game_bg_copyPal, PALETTE, game_bg_copyPalLen/2);
    // DMANow(3, game_bg_copyTiles, &CHARBLOCK[0], game_bg_copyTilesLen/2);
    // DMANow(3, game_bg_copyMap, &SCREENBLOCK[31], game_bg_copyMapLen/2);

    // REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    // DMANow(3, game_clouds_bgPal, PALETTE + 32, game_clouds_bgPalLen/2);
    // DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    // DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);

    // DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    // DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);

    hideSprites();

    state = GAME;

    //BACKGROUNDS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | BG2_ENABLE | MODE0;
                // 2 = PRIORITY
    REG_BG1CNT = 2 | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, game_bg_copyPal, PALETTE, game_bg_copyPalLen/2);
    DMANow(3, game_bg_copyTiles, &CHARBLOCK[0], game_bg_copyTilesLen/2);
    DMANow(3, game_bg_copyMap, &SCREENBLOCK[31], game_bg_copyMapLen/2);

                // 0 = PRIORITY
    REG_BG0CNT = 0 | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);
                // 1 = PRIORITY
    REG_BG2CNT = 1 | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);

    DMANow(3, game_clouds_SHADOW_bgTiles, &CHARBLOCK[2], game_clouds_SHADOW_bgTilesLen/2);
    DMANow(3, game_clouds_SHADOW_bgMap, &SCREENBLOCK[29], game_clouds_SHADOW_bgMapLen/2);


    //SPRITES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);

    //~~~~~~~~~~~~~~~~~~~~~~~~

    //HUD
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_MEDIUM | (2 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,4,32); //real@(0,4,32)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_MEDIUM | (34 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(4,4,32); //real@(4,4,32)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_TALL | (((160-64) / 2) & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (240-2-8 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(16,24,32);

    initShells();
    initEnergyBar();
    updatePlayerStatsAndReset();
    resetHazards();

    time = 0;

    DMANow(3, shadowOAM, OAM, 512);
}

void updatePlayerStatsAndReset() {
    //update stats
    player.shieldsLeft = player.shieldUpgradeValue;
    player.agility = 2 + (3 * (player.agilityUpgradeValue));
    player.energy = 2700 * (player.energyUpgradeValue + 1);
    player.startingEnergy = 2700 * (player.energyUpgradeValue + 1);

    player.x = (120 - (player.width / 2)) * 8;
}

void goGame(int seed) {
    playSoundA(town_w_ocean_view_data, town_w_ocean_view_length - 500, 1);

    srand(seed);

    hideSprites();

    state = GAME;

    //BACKGROUNDS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | BG2_ENABLE | MODE0;
                // 2 = PRIORITY
    REG_BG1CNT = 2 | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, game_bg_copyPal, PALETTE, game_bg_copyPalLen/2);
    DMANow(3, game_bg_copyTiles, &CHARBLOCK[0], game_bg_copyTilesLen/2);
    DMANow(3, game_bg_copyMap, &SCREENBLOCK[31], game_bg_copyMapLen/2);

                // 0 = PRIORITY
    REG_BG0CNT = 0 | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);
                // 1 = PRIORITY
    REG_BG2CNT = 1 | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(29);

    DMANow(3, game_clouds_SHADOW_bgTiles, &CHARBLOCK[2], game_clouds_SHADOW_bgTilesLen/2);
    DMANow(3, game_clouds_SHADOW_bgMap, &SCREENBLOCK[29], game_clouds_SHADOW_bgMapLen/2);


    //SPRITES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);

    // HUD OUTLINE
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_MEDIUM | (2 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,4,32); //real@(0,4,32)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_MEDIUM | (34 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(4,4,32); //real@(4,4,32)
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_TALL | (((160-64) / 2) & 0xFF);
    shadowOAM[2].attr1 = ATTR1_LARGE | (240-2-8 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET(16,24,32) | ATTR2_PALROW(0);

    initPlayer();
    initShells();
    initEnergyBar();
    initHazards();

    vOff = 0;
    int cloudVOff = 0;
    int gameSpeed = 2;
    gameSpeed = 2;
    time = 0;

    DMANow(3, shadowOAM, OAM, 512);

}

void initPlayer() {
    shells_owned = 0;
    player.width = 9;
    player.x = (120 - (player.width / 2)) * 8;
    player.prevX = 120 * 8;
    player.y = 138;
    player.frame = 0;
    player.height = 16;
    player.numFrames = 8;
    player.entry_OAM = 3;

    player.energyUpgradeValue = 0;
    player.shieldUpgradeValue = 0;
    player.agilityUpgradeValue = 0;

    player.shieldsLeft = player.shieldUpgradeValue;
    player.agility = 2 * (player.agilityUpgradeValue + 1);
    player.energy = 2700 * (player.energyUpgradeValue + 1);
    player.startingEnergy = 2700 * (player.energyUpgradeValue + 1);
} 