#include "hazards.h"
#include "gba.h"
#include "game_ss.h"
#include "states.h"

#include "print.h"

#include <stdio.h>
#include <stdlib.h>

#include "shield.h"

int time, shieldTime, cooldownTimer, gameSpeed;
Player player;
OBJ_ATTR shadowOAM[128];

int sharkFrames[6] = {11, 15, 19, 23, 19, 15};
int dynamiteFrames[10] = {OFFSET(11,8,32), OFFSET(15,8,32), OFFSET(19,8,32), OFFSET(23,8,32), OFFSET(27,8,32), 
                        OFFSET(11,12,32), OFFSET(15,12,32), OFFSET(19,12,32), OFFSET(23,12,32), OFFSET(27,12,32) };
// int sharkFrames[6] = {15,15,15,15,15,15,15};


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int height;
    int width;
    int isTall;
    int isWide;
    int isHFlip;
    int size; //0 = teeny, 1 = small, 2 = medium, 3 = large

    int hazardType;
    int oam_entry;
    int spriteIndex;
    int isAnimated;
    int numFrames;
    int timeToDisplayFrame;
    int frame;
    int active;
    //void (*deathfn)(void); bad!
    //void* (*deathfn)(void* self); try!
    void* (*deathfn)(void);

} Hazard;

enum HAZARD_TYPES {BAG, STRAW, SIX_PACK, NET, OIL, BOAT, SHARK, CYANIDE, DYNAMITE};

Hazard hazards[20];

int NUM_HAZARDS = 20;

void initHazards();
void newHazard();
void updateAndDrawHazards();
int checkHazardCollision();
void hazardFactory(int htype);
int checkHazardSpawnLocation(int x, int width, int height);

void hazardFactory(int htype) {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (!hazards[i].active) {
            hazards[i].active = 1;
            int x;
            hazards[i].isHFlip = rand() % 2;
            switch (htype) {
                case BAG:
                    //mgba_printf("hazards[%d] instantiated. type: %d, oam: %d", i, htype, hazards[i].oam_entry);
                    hazards[i].hazardType = BAG;
                    hazards[i].active = 1;
                    hazards[i].height = 22;
                    hazards[i].width = 18;
                    //hazards[i].x = (rand() % 240) * 8;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(0,19,32);
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathPlastic;
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case STRAW:
                    hazards[i].hazardType = STRAW;
                    hazards[i].active = 1;
                    hazards[i].height = 5;
                    hazards[i].width = 15;
                    hazards[i].spriteIndex = OFFSET(0,23,32);
                    hazards[i].size = 0;
                    hazards[i].deathfn = goDeathPlastic;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;
                    hazards[i].y = -hazards[i].height * 8;
                    // reset defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 1;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case SIX_PACK:
                    hazards[i].hazardType = SIX_PACK;
                    hazards[i].active = 1;
                    hazards[i].height = 19;
                    hazards[i].width = 19;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(0,15,32);
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathPlastic;
                    
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case SHARK:
                    hazards[i].hazardType = SHARK;
                    hazards[i].active = 1;
                    hazards[i].height = 45;
                    hazards[i].width = 20;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;
                    
                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].size = 3;
                    hazards[i].deathfn = goDeathShark;
                    
                    //animation
                    hazards[i].isAnimated = 1;
                    hazards[i].frame = 0;
                    hazards[i].spriteIndex = sharkFrames[hazards[i].frame];
                    hazards[i].numFrames = 6;
                    hazards[i].timeToDisplayFrame = 15 + (rand() % 3);
                    
                    // defaults
                    hazards[i].isTall = 1;
                    hazards[i].isWide = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;

                    break;

                case OIL:

                    cooldownTimer = 59;

                    hazards[i].hazardType = OIL;
                    hazards[i].active = 1;
                    hazards[i].height = 40;
                    hazards[i].width = 48;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(8,24,32);
                    hazards[i].size = 3;
                    //TODO:
                    hazards[i].deathfn = goDeathOil;
                    
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case CYANIDE:

                    cooldownTimer = 59;

                    hazards[i].hazardType = CYANIDE;
                    hazards[i].active = 1;
                    hazards[i].height = 40;
                    hazards[i].width = 52;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(0,24,32);
                    hazards[i].size = 3;
                    //TODO:
                    hazards[i].deathfn = goDeathCyanide;
                    
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case BOAT:

                    cooldownTimer = 49;

                    hazards[i].hazardType = BOAT;
                    hazards[i].active = 1;
                    hazards[i].height = 24;
                    hazards[i].width = 63;

                    // x = (rand() % 240 - hazards[i].width) * 8;
                    // while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                    //     x = (rand() % 240 - hazards[i].width) * 8;
                    // }
                    // hazards[i].x = x;

                    hazards[i].dx = (hazards[i].isHFlip == 0) ? (rand() % 3) + 1 : -(rand() % 3) - 1;
                    hazards[i].x = (rand() % 40) + ((hazards[i].dx > 0) ? 0 : 1500);

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(0,8,32);
                    hazards[i].size = 3;
                    //TODO:
                    hazards[i].deathfn = goDeathBoat;
                    
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 1;
                    hazards[i].isAnimated = 0;
                    // hazards[i].dx = (hazards[i].isHFlip == 0) ? (rand() % 3) + 1 : -(rand() % 3) - 1;
                    hazards[i].dy = 1;
                    break;


                case DYNAMITE:
                    cooldownTimer = 36;

                    hazards[i].hazardType = DYNAMITE;
                    hazards[i].active = 1;
                    hazards[i].height = 32;
                    hazards[i].width = 32;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;
                    
                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathDynamite;
                    
                    //animation
                    hazards[i].isAnimated = 1;
                    hazards[i].frame = 0;
                    hazards[i].spriteIndex = dynamiteFrames[hazards[i].frame];
                    hazards[i].numFrames = 10;
                    hazards[i].timeToDisplayFrame = 10 + (rand() % 3);
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    

                default:
                    break;
            }
            break;
        }
    }
}

checkHazardSpawnLocation(int x, int width, int height) {
    mgba_printf("checkHazardSpawnLocation(%d, %d, %d) called", x, width, height);
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            if (hazards[i].y < 40
            
            ) {
                if (collision(x / 8, -height, width, height, hazards[i].x / 8, hazards[i].y, hazards[i].width, hazards[i].height)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

void newShield() {
    playSoundB(shield_data, shield_length - 500, 0);
    shieldTime = time + 60;
}

void updateAndDrawShield() {
    //mgba_printf("draw shield if (%d >= %d)?", shieldTime, time);
    if (shieldTime >= time) {
        if (time % 2 != 0) {
            shadowOAM[11].attr0 = (player.y & 0xFF) | ATTR0_4BPP;
            shadowOAM[11].attr1 = ATTR1_SMALL | ((player.x / 8) - 2 & 0x1FF);
            //shadowOAM[2].attr2 = OFFSET(20,9,32) | ATTR2_PRIORITY(1);
            shadowOAM[11].attr2 = OFFSET(11,16,32) | ATTR2_PRIORITY(0);
        } else {
            shadowOAM[11].attr0 = ATTR0_HIDE;
        }
        
    } else {
        shadowOAM[11].attr0 = ATTR0_HIDE; // intentionally creates flicker
    }
    
}

int minmin(int a, int b) {
    return (a < b) ? a : b;
}

void updateAndDrawHazards() { // MATCH UPDATE AND DRAW SHELLS
    cooldownTimer--;

    //    gamespeed factor                 cooldown            2 minute hard stop
    if (time % (120 / gameSpeed) == 0 && cooldownTimer < 0 && (time / 60) < 120) {
        newHazard();
    }

    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            //shadowOAM[hazards[i].oam_entry].attr0 = ((hazards[i].y / 8) & (0xFF)) | ATTR0_4BPP | (hazards[i].isTall == 0) ? 0 : ATTR0_TALL | (hazards[i].isWide == 0) ? 0 : ATTR0_WIDE;
            //shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | ATTR0_4BPP;
            //shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size == 1) ? ATTR1_SMALL : 0 | (hazards[i].size == 2) ? ATTR1_MEDIUM : 0 | (hazards[i].size == 3) ? ATTR1_LARGE : 0;
            //shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF));
            if (hazards[i].isTall) {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | ATTR0_4BPP | ATTR0_TALL;
            } else if (hazards[i].isWide) {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | ATTR0_4BPP | ATTR0_WIDE;
            } else {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | ATTR0_4BPP;
            }

            if (hazards[i].isAnimated && (time % hazards[i].timeToDisplayFrame) == 0) {
                if (hazards[i].hazardType == SHARK) {
                    hazards[i].frame = (hazards[i].frame + 1) % hazards[i].numFrames;
                    hazards[i].spriteIndex = sharkFrames[hazards[i].frame];
                }
                if (hazards[i].hazardType == DYNAMITE && hazards[i].y > 90 * 8) {
                    //hazards[i].frame = (hazards[i].frame + 1) % hazards[i].numFrames;
                    hazards[i].frame = minmin(hazards[i].frame + 1, 9);
                    hazards[i].spriteIndex = dynamiteFrames[hazards[i].frame];
                }
            }

            if (hazards[i].isHFlip) {
                shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size << 14) | ATTR1_HFLIP; 
            } else {
                shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size << 14); 
            }
            if (hazards[i].hazardType == DYNAMITE) {
                shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex | ATTR2_PRIORITY(1) | ATTR2_PALROW(1);
            } else {
                shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex | ATTR2_PRIORITY(1);
            }

            if (collision(hazards[i].x / 8, hazards[i].y / 8, hazards[i].width, hazards[i].height, player.x / 8, player.y, player.width, player.height)) {
                if (player.shieldsLeft > 0) {
                    player.shieldsLeft--;
                    newShield();
                } else {
                    //TODO:
                    pauseSounds();
                    shieldTime = 0;
                    hazards[i].deathfn();
                    //goDeathPlastic();
                }
                
                hazards[i].active = 0;
                
            }

            if (hazards[i].y > 160 * 8) {
                hazards[i].active = 0;
            } else { // TODO: replace with gameSpeed
                hazards[i].y += gameSpeed;
                if (hazards[i].hazardType == SHARK) {
                    hazards[i].y += 2;
                }
                if (hazards[i].hazardType == BOAT) {
                    hazards[i].x += hazards[i].dx;
                }
                //mgba_printf("%d", hazards[i].y);
            }

        } else {
            shadowOAM[hazards[i].oam_entry].attr0 = ATTR0_HIDE;
        }
    }
}

void resetHazards() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        hazards[i].oam_entry = 60 + i;
        hazards[i].active = 0;
        hazards[i].spriteIndex = OFFSET(24,24,32);
    }
    shieldTime = 0;
    cooldownTimer = 0;
}

void initHazards() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        hazards[i].oam_entry = 60 + i;
        hazards[i].active = 0;
    }
    int shieldTime = 0;
    shieldTime = 0;
    int cooldownTimer = 0;
    cooldownTimer = 0;
}

int checkHazardCollision() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            if (collision(hazards[i].x, hazards[i].y, hazards[i].width, hazards[i].height,
                            player.x, player.y, player.width, player.height)) {
                return 1;
            }
        }
    }
    return 0;
}

void newHazard() {
    int timeInSeconds = time / 60;
    int timeBlock;

    if (0 <= timeInSeconds && timeInSeconds < 15){
        timeBlock = 0;
    } else if (15 <= timeInSeconds && timeInSeconds < 30) {
        timeBlock = 1;
    } else if (30 <= timeInSeconds && timeInSeconds < 45) {
        timeBlock = 2;
    } else if (45 <= timeInSeconds && timeInSeconds < 60) {
        timeBlock = 3;
    } else if (60 <= timeInSeconds && timeInSeconds < 75) {
        timeBlock = 4;
    } else if (75 <= timeInSeconds && timeInSeconds < 90) {
        timeBlock = 5;
    } else if (90 <= timeInSeconds && timeInSeconds < 105) {
        timeBlock = 6;
    } else {
        timeBlock = 7;
    }

    int randVal = rand() % 100;
    
    mgba_printf("newHazard(): time: %d, timeInSeconds: %d, timeBlock: %d", time, timeInSeconds, timeBlock);

    //hazardFactory(BOAT);


    //TODO: replace newXXX functions with hazardFactory() calls
    switch (timeBlock) {
        case 0: // 0-15sec
            if (0 < randVal && randVal < 50) {
                hazardFactory(BAG);
            } else {
                //newPlasticStraw();
                hazardFactory(STRAW);
            } 
            break;

        case 1: // 15-30sec
            if (0 < randVal && randVal < 25) {
                // newPlasticBag();
                hazardFactory(BAG);
            } else if (25 < randVal && randVal < 50) {
                // newPlasticStraw();
                hazardFactory(STRAW);
            } else if (50 < randVal && randVal < 75) {
                // newSixPack();
                hazardFactory(SIX_PACK);
            } else {
                // newNet();
                hazardFactory(NET);
            }
            break;

        case 2: // 30-45sec
            if (0 < randVal && randVal < 33) {
                // newSixPack();
                hazardFactory(SIX_PACK);
            } else if (33 < randVal && randVal < 66) {
                // newNet();
                hazardFactory(NET);
            } else {
                // newOilSpill();
                hazardFactory(OIL);
            }
            break;

        case 3: // 45-60sec
            if (0 < randVal && randVal < 25) {
                // newNet();
                hazardFactory(NET);
            } else if (25 < randVal && randVal < 50) {
                // newOilSpill();
                hazardFactory(OIL);
            } else if (50 < randVal && randVal < 75) {
                // newShark();
                hazardFactory(SHARK);
            } else {
                // newCyanide();
                hazardFactory(CYANIDE);
            }
            break;

        case 4: // 60-75sec
            if (0 < randVal && randVal < 25) {
                // newNet();
                hazardFactory(NET);
            } else if (25 < randVal && randVal < 50) {
                // newOilSpill();
                hazardFactory(OIL);
            } else if (50 < randVal && randVal < 75) {
                // newShark();
                hazardFactory(SHARK);
            } else {
                // newCyanide();
                hazardFactory(CYANIDE);
            }
            break;

        case 5: // 75-90sec
            if (0 < randVal && randVal < 33) {
                // newShark();
                hazardFactory(SHARK);
            } else if (33 < randVal && randVal < 66) {
                hazardFactory(BOAT);
            } else {
                // newCyanide();
                hazardFactory(CYANIDE);
            }
            break;

        case 6: // 90-105sec
            if (0 < randVal && randVal < 50) {
                // newShark();
                hazardFactory(SHARK);
            } else {
                // newBoat();
                hazardFactory(BOAT);
            }
            break;

        case 7: // 105-120sec
            if (0 < randVal && randVal < 33) {
                // newShark();
                hazardFactory(SHARK);
            } else if (33 < randVal && randVal < 66) {
                // newBoat();
                hazardFactory(BOAT);
            } else {
                // newDynamite();
                hazardFactory(DYNAMITE);
            }
            break;

        default:
            break;
    }
}