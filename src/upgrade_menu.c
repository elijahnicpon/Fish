#include "upgrade_menu.h"
#include "states.h"
#include "gba.h"

#include "coral_bg.h"
#include "upgrade_menu_ss.h"

#include "error.h"
#include "success.h"

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];
Player player;

int shieldUpgradeCosts[6] = {50, 100, 250, 500, 1000, 0};
int agilityUpgradeCosts[6] = {10, 25, 50, 100, 250, 0};
int energyUpgradeCosts[6] = {5, 50, 100, 250, 500, 0};
int cheatUsed;

void attemptUpgradeAgility();
void attemptUpgradeEnergy();
void attemptUpgradeShield();
void updateAgility();
void updateEnergy();
void updateShield();
void updateShellsOwned();

void doUpgradeMenu() {
    if (BUTTON_PRESSED(BUTTON_UP)) {
        attemptUpgradeAgility();
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        attemptUpgradeEnergy();
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        attemptUpgradeShield();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        newGameRun();
    }
    if (BUTTON_HELD(BUTTON_L) && BUTTON_HELD(BUTTON_R) && BUTTON_HELD(BUTTON_SELECT) && !cheatUsed) {
        shells_owned += 5000;
        cheatUsed = 1;
        updateAgility();
        updateEnergy();
        updateShield();
        updateShellsOwned();
        DMANow(3, shadowOAM, OAM, 512);
    }
    waitForVBlank();
    hOff += 1;
    vOff = 0;
    time++;
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff / 8;
}

void attemptUpgradeEnergy() {
    if (shells_owned >= energyUpgradeCosts[player.energyUpgradeValue] && player.energyUpgradeValue < 5) {
        shells_owned -= energyUpgradeCosts[player.energyUpgradeValue];
        player.energyUpgradeValue++;
        updateShellsOwned();
        updateAgility();
        updateEnergy();
        updateShield();
        DMANow(3, shadowOAM, OAM, 512);
        //: play success sound
        playSoundB(success_data, success_length - 500, 0);

    } else {
        //TODO: play failed sound
        playSoundB(error_data, error_length - 500, 0);
    }
}

void attemptUpgradeShield() {
    if (shells_owned >= shieldUpgradeCosts[player.shieldUpgradeValue] && player.shieldUpgradeValue < 5) {
        shells_owned -= shieldUpgradeCosts[player.shieldUpgradeValue];
        player.shieldUpgradeValue++;
        updateShellsOwned();
        updateAgility();
        updateEnergy();
        updateShield();
        DMANow(3, shadowOAM, OAM, 512);
        //: play success sound
        playSoundB(success_data, success_length - 500, 0);

    } else {
        //TODO: play failed sound
        playSoundB(error_data, error_length - 500, 0);
    }
}

void updateShield() {
    //Draw Shield Upgrade Cost
    shadowOAM[22].attr0 = ATTR0_4BPP | (110 & 0xFF);
    shadowOAM[22].attr1 = ATTR1_TINY | (148 & 0x1FF);
    shadowOAM[22].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 1000) % 10, 
            (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[23].attr0 = ATTR0_4BPP | (110 & 0xFF);
    shadowOAM[23].attr1 = ATTR1_TINY | (156 & 0x1FF);
    shadowOAM[23].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 100) % 10, 
            (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[24].attr0 = ATTR0_4BPP | (110 & 0xFF);
    shadowOAM[24].attr1 = ATTR1_TINY | (164 & 0x1FF);
    shadowOAM[24].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 10) % 10, 
            (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[25].attr0 = ATTR0_4BPP | (110 & 0xFF);
    shadowOAM[25].attr1 = ATTR1_TINY | (172 & 0x1FF);
    shadowOAM[25].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 1) % 10, 
            (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);

    //Draw Shield Upgrade Bars
    for (int i = 0; i < 5; i++) {
        shadowOAM[26 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (127 & 0xFF);
        shadowOAM[26 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
        shadowOAM[26 + i].attr2 = OFFSET(0, (i >= player.shieldUpgradeValue) ? 2 : 3, 32);
    }

    //DMANow(3, shadowOAM, OAM, 512);
}

void updateEnergy() {
    //Draw Energy Upgrade Cost
    shadowOAM[12].attr0 = ATTR0_4BPP | (70 & 0xFF);
    shadowOAM[12].attr1 = ATTR1_TINY | (148 & 0x1FF);
    shadowOAM[12].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 1000) % 10, 
            (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[13].attr0 = ATTR0_4BPP | (70 & 0xFF);
    shadowOAM[13].attr1 = ATTR1_TINY | (156 & 0x1FF);
    shadowOAM[13].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 100) % 10, 
            (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[14].attr0 = ATTR0_4BPP | (70 & 0xFF);
    shadowOAM[14].attr1 = ATTR1_TINY | (164 & 0x1FF);
    shadowOAM[14].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 10) % 10, 
            (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[15].attr0 = ATTR0_4BPP | (70 & 0xFF);
    shadowOAM[15].attr1 = ATTR1_TINY | (172 & 0x1FF);
    shadowOAM[15].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 1) % 10, 
            (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);

    //Draw Energy Upgrade Bars
    for (int i = 0; i < 5; i++) {
        shadowOAM[16 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (87 & 0xFF);
        shadowOAM[16 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
        shadowOAM[16 + i].attr2 = OFFSET(0, (i >= player.energyUpgradeValue) ? 2 : 3, 32);
    }

    //DMANow(3, shadowOAM, OAM, 512);
}

void attemptUpgradeAgility() {
    if (shells_owned >= agilityUpgradeCosts[player.agilityUpgradeValue] && player.agilityUpgradeValue < 5) {
        shells_owned -= agilityUpgradeCosts[player.agilityUpgradeValue];
        player.agilityUpgradeValue++;
        updateShellsOwned();
        updateAgility();
        updateEnergy();
        updateShield();
        DMANow(3, shadowOAM, OAM, 512);
        //: play success sound
        playSoundB(success_data, success_length - 500, 0);

    } else {
        //TODO: play failed sound
        playSoundB(error_data, error_length - 500, 0);
    }
}

void updateAgility() {
    //Draw Agility Upgrade Cost
    shadowOAM[2].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[2].attr1 = ATTR1_TINY | (148 & 0x1FF);
    shadowOAM[2].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 1000) % 10, 
            (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[3].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[3].attr1 = ATTR1_TINY | (156 & 0x1FF);
    shadowOAM[3].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 100) % 10, 
            (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[4].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[4].attr1 = ATTR1_TINY | (164 & 0x1FF);
    shadowOAM[4].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 10) % 10, 
            (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    shadowOAM[5].attr0 = ATTR0_4BPP | (30 & 0xFF);
    shadowOAM[5].attr1 = ATTR1_TINY | (172 & 0x1FF);
    shadowOAM[5].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 1) % 10, 
            (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);

    //Draw Agility Upgrade Bars
    for (int i = 0; i < 5; i++) {
        shadowOAM[6 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (47 & 0xFF);
        shadowOAM[6 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
        shadowOAM[6 + i].attr2 = OFFSET(0, (i >= player.agilityUpgradeValue) ? 2 : 3, 32);
    }

    //DMANow(3, shadowOAM, OAM, 512);

}

void updateShellsOwned() {
    //Draw owned shells
    shadowOAM[32].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    shadowOAM[32].attr1 = ATTR1_TINY | (37 & 0x1FF);
    shadowOAM[32].attr2 = OFFSET(shells_owned % 10, 8, 32);

    shadowOAM[33].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    shadowOAM[33].attr1 = ATTR1_TINY | (30 & 0x1FF);
    shadowOAM[33].attr2 = OFFSET((shells_owned / 10) % 10, 8, 32);
    
    shadowOAM[34].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    shadowOAM[34].attr1 = ATTR1_TINY | (23 & 0x1FF);
    shadowOAM[34].attr2 = OFFSET((shells_owned / 100) % 10, 8, 32);

    shadowOAM[35].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    shadowOAM[35].attr1 = ATTR1_TINY | (16 & 0x1FF);
    shadowOAM[35].attr2 = OFFSET(shells_owned / 1000, 8, 32);
    
    //DMANow(3, shadowOAM, OAM, 512);
}

void goUpgradeMenu() {

    int cheatUsed = 0;

    hideSprites();
    state = UPGRADE_MENU;

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, coral_bgPal, PALETTE, coral_bgPalLen/2);
    DMANow(3, coral_bgTiles, &CHARBLOCK[0], coral_bgTilesLen/2);
    DMANow(3, coral_bgMap, &SCREENBLOCK[31], coral_bgMapLen/2);

    DMANow(3, upgrade_menu_ssPal, SPRITEPALETTE, upgrade_menu_ssPalLen/2);
    DMANow(3, upgrade_menu_ssTiles, &CHARBLOCK[4], upgrade_menu_ssTilesLen/2);

    // //Draw Title
    // shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (1 & 0xFF);
    // shadowOAM[0].attr1 = ATTR1_LARGE | (74 & 0x1FF);
    // shadowOAM[0].attr2 = OFFSET(0,4,32);
    // shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (1 & 0xFF);
    // shadowOAM[1].attr1 = ATTR1_LARGE | (138 & 0x1FF);
    // shadowOAM[1].attr2 = OFFSET(8,4,32);

    // //Draw Agility Upgrade Cost
    // shadowOAM[2].attr0 = ATTR0_4BPP | (30 & 0xFF);
    // shadowOAM[2].attr1 = ATTR1_TINY | (148 & 0x1FF);
    // shadowOAM[2].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 1000) % 10, 
    //         (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[3].attr0 = ATTR0_4BPP | (30 & 0xFF);
    // shadowOAM[3].attr1 = ATTR1_TINY | (156 & 0x1FF);
    // shadowOAM[3].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 100) % 10, 
    //         (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[4].attr0 = ATTR0_4BPP | (30 & 0xFF);
    // shadowOAM[4].attr1 = ATTR1_TINY | (164 & 0x1FF);
    // shadowOAM[4].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 10) % 10, 
    //         (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[5].attr0 = ATTR0_4BPP | (30 & 0xFF);
    // shadowOAM[5].attr1 = ATTR1_TINY | (172 & 0x1FF);
    // shadowOAM[5].attr2 = OFFSET((agilityUpgradeCosts[player.agilityUpgradeValue] / 1) % 10, 
    //         (agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1, 32);

    // //Draw Agility Upgrade Bars
    // for (int i = 0; i < 5; i++) {
    //     shadowOAM[6 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (47 & 0xFF);
    //     shadowOAM[6 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
    //     shadowOAM[6 + i].attr2 = OFFSET(0, (i >= player.agilityUpgradeValue) ? 2 : 3, 32);
    // }

    // //Draw Energy Upgrade Cost
    // shadowOAM[12].attr0 = ATTR0_4BPP | (70 & 0xFF);
    // shadowOAM[12].attr1 = ATTR1_TINY | (148 & 0x1FF);
    // shadowOAM[12].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 1000) % 10, 
    //         (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[13].attr0 = ATTR0_4BPP | (70 & 0xFF);
    // shadowOAM[13].attr1 = ATTR1_TINY | (156 & 0x1FF);
    // shadowOAM[13].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 100) % 10, 
    //         (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[14].attr0 = ATTR0_4BPP | (70 & 0xFF);
    // shadowOAM[14].attr1 = ATTR1_TINY | (164 & 0x1FF);
    // shadowOAM[14].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 10) % 10, 
    //         (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[15].attr0 = ATTR0_4BPP | (70 & 0xFF);
    // shadowOAM[15].attr1 = ATTR1_TINY | (172 & 0x1FF);
    // shadowOAM[15].attr2 = OFFSET((energyUpgradeCosts[player.energyUpgradeValue] / 1) % 10, 
    //         (energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1, 32);

    // //Draw Energy Upgrade Bars
    // for (int i = 0; i < 5; i++) {
    //     shadowOAM[16 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (87 & 0xFF);
    //     shadowOAM[16 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
    //     shadowOAM[16 + i].attr2 = OFFSET(0, (i >= player.energyUpgradeValue) ? 2 : 3, 32);
    // }

    // //Draw Shield Upgrade Cost
    // shadowOAM[22].attr0 = ATTR0_4BPP | (110 & 0xFF);
    // shadowOAM[22].attr1 = ATTR1_TINY | (148 & 0x1FF);
    // shadowOAM[22].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 1000) % 10, 
    //         (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[23].attr0 = ATTR0_4BPP | (110 & 0xFF);
    // shadowOAM[23].attr1 = ATTR1_TINY | (156 & 0x1FF);
    // shadowOAM[23].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 100) % 10, 
    //         (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[24].attr0 = ATTR0_4BPP | (110 & 0xFF);
    // shadowOAM[24].attr1 = ATTR1_TINY | (164 & 0x1FF);
    // shadowOAM[24].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 10) % 10, 
    //         (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);
    // shadowOAM[25].attr0 = ATTR0_4BPP | (110 & 0xFF);
    // shadowOAM[25].attr1 = ATTR1_TINY | (172 & 0x1FF);
    // shadowOAM[25].attr2 = OFFSET((shieldUpgradeCosts[player.shieldUpgradeValue] / 1) % 10, 
    //         (shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1, 32);

    // //Draw Shield Upgrade Bars
    // for (int i = 0; i < 5; i++) {
    //     shadowOAM[26 + i].attr0 = ATTR0_4BPP | ATTR0_WIDE | (127 & 0xFF);
    //     shadowOAM[26 + i].attr1 = ATTR1_SMALL | (74 + (i * 23) & 0x1FF);
    //     shadowOAM[26 + i].attr2 = OFFSET(0, (i >= player.shieldUpgradeValue) ? 2 : 3, 32);
    // }

    // //Draw owned shells
    // shadowOAM[32].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    // shadowOAM[32].attr1 = ATTR1_TINY | (37 & 0x1FF);
    // shadowOAM[32].attr2 = OFFSET(shells_owned % 10, 8, 32);

    // shadowOAM[33].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    // shadowOAM[33].attr1 = ATTR1_TINY | (30 & 0x1FF);
    // shadowOAM[33].attr2 = OFFSET((shells_owned / 10) % 4, 8, 32);
    
    // shadowOAM[34].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    // shadowOAM[34].attr1 = ATTR1_TINY | (23 & 0x1FF);
    // shadowOAM[34].attr2 = OFFSET((shells_owned / 100) % 10, 8, 32);

    // shadowOAM[35].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    // shadowOAM[35].attr1 = ATTR1_TINY | (16 & 0x1FF);
    // shadowOAM[35].attr2 = OFFSET(shells_owned / 1000, 8, 32);

    //Draw shell icon
    shadowOAM[36].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (4 & 0xFF);
    shadowOAM[36].attr1 = ATTR1_SMALL | (2 & 0x1FF);
    shadowOAM[36].attr2 = OFFSET(0,9,32);

    updateShellsOwned();
    updateAgility();
    updateEnergy();
    updateShield();
    

    //Draw Window
    shadowOAM[102].attr0 = ATTR0_4BPP | (16 & 0xFF);
    shadowOAM[102].attr1 = ATTR1_LARGE | (24 & 0x1FF);
    shadowOAM[102].attr2 = OFFSET(0,16,32);
    shadowOAM[103].attr0 = ATTR0_4BPP | (16 & 0xFF);
    shadowOAM[103].attr1 = ATTR1_LARGE | (88 & 0x1FF);
    shadowOAM[103].attr2 = OFFSET(8,16,32);
    shadowOAM[104].attr0 = ATTR0_4BPP | (16 & 0xFF);
    shadowOAM[104].attr1 = ATTR1_LARGE | (152 & 0x1FF);
    shadowOAM[104].attr2 = OFFSET(16,16,32);

    shadowOAM[105].attr0 = ATTR0_4BPP | (80 & 0xFF);
    shadowOAM[105].attr1 = ATTR1_LARGE | (24 & 0x1FF);
    shadowOAM[105].attr2 = OFFSET(0,24,32);
    shadowOAM[106].attr0 = ATTR0_4BPP | (80 & 0xFF);
    shadowOAM[106].attr1 = ATTR1_LARGE | (88 & 0x1FF);
    shadowOAM[106].attr2 = OFFSET(8,24,32);
    shadowOAM[107].attr0 = ATTR0_4BPP | (80 & 0xFF);
    shadowOAM[107].attr1 = ATTR1_LARGE | (152 & 0x1FF);
    shadowOAM[107].attr2 = OFFSET(16,24,32);

    //Draw continue instructions
    shadowOAM[108].attr0 = ATTR0_4BPP | ATTR0_WIDE | (144 & 0xFF);
    shadowOAM[108].attr1 = ATTR1_LARGE | (80 & 0x1FF);
    shadowOAM[108].attr2 = OFFSET(0,13,32);
    shadowOAM[109].attr0 = ATTR0_4BPP | ATTR0_WIDE | (144 & 0xFF);
    shadowOAM[109].attr1 = ATTR1_LARGE | (144 & 0x1FF);
    shadowOAM[109].attr2 = OFFSET(8,13,32);
    shadowOAM[110].attr0 = ATTR0_4BPP | ATTR0_WIDE | (144     & 0xFF);
    shadowOAM[110].attr1 = ATTR1_LARGE | (208 & 0x1FF);
    shadowOAM[110].attr2 = OFFSET(16,13,32);
    

    DMANow(3, shadowOAM, OAM, 512);
}