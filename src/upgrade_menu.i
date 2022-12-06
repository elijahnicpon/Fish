# 1 "upgrade_menu.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "upgrade_menu.c"
# 1 "upgrade_menu.h" 1
void doUpgradeMenu();
void goUpgradeMenu();
# 2 "upgrade_menu.c" 2
# 1 "states.h" 1
# 1 "start_menu.h" 1
void goStartMenu();
void doStartMenu();
# 2 "states.h" 2
# 1 "info_menu.h" 1
void goInfoMenu();
void doInfoMenu();
# 3 "states.h" 2
# 1 "game.h" 1
void goGame();
void doGame();
void resumeGame();
void newGameRun();
# 4 "states.h" 2
# 1 "pause.h" 1
void goPause();
void doPause();
# 5 "states.h" 2
# 1 "about_menu.h" 1
void goAboutMenu();
void doAboutMenu();
# 6 "states.h" 2
# 1 "death_energy.h" 1
void goDeathEnergy();
void doDeathEnergy();
# 7 "states.h" 2
# 1 "death_plastic.h" 1
void goDeathPlastic();
void doDeathPlastic();
# 8 "states.h" 2
# 1 "death_boat.h" 1
void doDeathBoat();
void goDeathBoat();
# 9 "states.h" 2
# 1 "death_oil.h" 1
void doDeathOil();
void goDeathOil();
# 10 "states.h" 2
# 1 "death_cyanide.h" 1
void goDeathCyanide();
void doDeathCyanide();
# 11 "states.h" 2
# 1 "death_dynamite.h" 1
void goDeathDynamite();
void doDeathDynamite();
# 12 "states.h" 2
# 1 "death_shark.h" 1
void goDeathShark();
void doDeathShark();
# 13 "states.h" 2
# 1 "upgrade_menu.h" 1
void doUpgradeMenu();
void goUpgradeMenu();
# 14 "states.h" 2
# 1 "controls_menu.h" 1
void goControlsMenu();
void doControlsMenu();
# 15 "states.h" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int looping;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 16 "states.h" 2
# 1 "win.h" 1
void doWin();
void goWin();
# 17 "states.h" 2



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
# 3 "upgrade_menu.c" 2
# 1 "gba.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 41 "gba.h"
extern volatile unsigned short *videoBuffer;
# 66 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);
void waitForVBlank();





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 118 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 147 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 158 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 198 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 255 "gba.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 305 "gba.h"
void setupInterrupts();







typedef void (*ihp)(void);
# 4 "upgrade_menu.c" 2

# 1 "coral_bg.h" 1
# 22 "coral_bg.h"
extern const unsigned short coral_bgTiles[3920];


extern const unsigned short coral_bgMap[1024];


extern const unsigned short coral_bgPal[256];
# 6 "upgrade_menu.c" 2
# 1 "upgrade_menu_ss.h" 1
# 21 "upgrade_menu_ss.h"
extern const unsigned short upgrade_menu_ssTiles[16384];


extern const unsigned short upgrade_menu_ssPal[256];
# 7 "upgrade_menu.c" 2

# 1 "error.h" 1


extern const unsigned int error_sampleRate;
extern const unsigned int error_length;
extern const signed char error_data[];
# 9 "upgrade_menu.c" 2
# 1 "success.h" 1


extern const unsigned int success_sampleRate;
extern const unsigned int success_length;
extern const signed char success_data[];
# 10 "upgrade_menu.c" 2

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];
Player player;

int shieldUpgradeCosts[6] = {50, 100, 250, 500, 1000, 9999};
int agilityUpgradeCosts[6] = {10, 25, 50, 100, 250, 9999};
int energyUpgradeCosts[6] = {5, 50, 100, 250, 500, 9999};
int cheatUsed;

void attemptUpgradeAgility();
void attemptUpgradeEnergy();
void attemptUpgradeShield();
void updateAgility();
void updateEnergy();
void updateShield();
void updateShellsOwned();

void doUpgradeMenu() {
    if ((!(~(oldButtons) & ((1<<6))) && (~buttons & ((1<<6))))) {
        attemptUpgradeAgility();
    }
    if ((!(~(oldButtons) & ((1<<4))) && (~buttons & ((1<<4))))) {
        attemptUpgradeEnergy();
    }
    if ((!(~(oldButtons) & ((1<<7))) && (~buttons & ((1<<7))))) {
        attemptUpgradeShield();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        newGameRun();
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<9))) && (~((*(volatile unsigned short *)0x04000130)) & ((1<<8))) && (~((*(volatile unsigned short *)0x04000130)) & ((1<<2))) && !cheatUsed) {
        shells_owned += 5000;
        cheatUsed = 1;
        updateAgility();
        updateEnergy();
        updateShield();
        updateShellsOwned();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    }
    waitForVBlank();
    hOff += 1;
    vOff = 0;
    time++;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff / 8;
}

void attemptUpgradeEnergy() {
    if (shells_owned >= energyUpgradeCosts[player.energyUpgradeValue] && player.energyUpgradeValue < 5) {
        shells_owned -= energyUpgradeCosts[player.energyUpgradeValue];
        player.energyUpgradeValue++;
        updateShellsOwned();
        updateAgility();
        updateEnergy();
        updateShield();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

        playSoundB(success_data, success_length - 500, 0);

    } else {

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
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

        playSoundB(success_data, success_length - 500, 0);

    } else {

        playSoundB(error_data, error_length - 500, 0);
    }
}

void updateShield() {

    shadowOAM[22].attr0 = (0 << 13) | (110 & 0xFF);
    shadowOAM[22].attr1 = (0 << 14) | (148 & 0x1FF);
    shadowOAM[22].attr2 = (((shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((shieldUpgradeCosts[player.shieldUpgradeValue] / 1000) % 10))
                                                                                       ;
    shadowOAM[23].attr0 = (0 << 13) | (110 & 0xFF);
    shadowOAM[23].attr1 = (0 << 14) | (156 & 0x1FF);
    shadowOAM[23].attr2 = (((shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((shieldUpgradeCosts[player.shieldUpgradeValue] / 100) % 10))
                                                                                       ;
    shadowOAM[24].attr0 = (0 << 13) | (110 & 0xFF);
    shadowOAM[24].attr1 = (0 << 14) | (164 & 0x1FF);
    shadowOAM[24].attr2 = (((shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((shieldUpgradeCosts[player.shieldUpgradeValue] / 10) % 10))
                                                                                       ;
    shadowOAM[25].attr0 = (0 << 13) | (110 & 0xFF);
    shadowOAM[25].attr1 = (0 << 14) | (172 & 0x1FF);
    shadowOAM[25].attr2 = (((shieldUpgradeCosts[player.shieldUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((shieldUpgradeCosts[player.shieldUpgradeValue] / 1) % 10))
                                                                                       ;


    for (int i = 0; i < 5; i++) {
        shadowOAM[26 + i].attr0 = (0 << 13) | (1 << 14) | (127 & 0xFF);
        shadowOAM[26 + i].attr1 = (1 << 14) | (74 + (i * 23) & 0x1FF);
        shadowOAM[26 + i].attr2 = (((i >= player.shieldUpgradeValue) ? 2 : 3) * (32) + (0));
    }


}

void updateEnergy() {

    shadowOAM[12].attr0 = (0 << 13) | (70 & 0xFF);
    shadowOAM[12].attr1 = (0 << 14) | (148 & 0x1FF);
    shadowOAM[12].attr2 = (((energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((energyUpgradeCosts[player.energyUpgradeValue] / 1000) % 10))
                                                                                       ;
    shadowOAM[13].attr0 = (0 << 13) | (70 & 0xFF);
    shadowOAM[13].attr1 = (0 << 14) | (156 & 0x1FF);
    shadowOAM[13].attr2 = (((energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((energyUpgradeCosts[player.energyUpgradeValue] / 100) % 10))
                                                                                       ;
    shadowOAM[14].attr0 = (0 << 13) | (70 & 0xFF);
    shadowOAM[14].attr1 = (0 << 14) | (164 & 0x1FF);
    shadowOAM[14].attr2 = (((energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((energyUpgradeCosts[player.energyUpgradeValue] / 10) % 10))
                                                                                       ;
    shadowOAM[15].attr0 = (0 << 13) | (70 & 0xFF);
    shadowOAM[15].attr1 = (0 << 14) | (172 & 0x1FF);
    shadowOAM[15].attr2 = (((energyUpgradeCosts[player.energyUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((energyUpgradeCosts[player.energyUpgradeValue] / 1) % 10))
                                                                                       ;


    for (int i = 0; i < 5; i++) {
        shadowOAM[16 + i].attr0 = (0 << 13) | (1 << 14) | (87 & 0xFF);
        shadowOAM[16 + i].attr1 = (1 << 14) | (74 + (i * 23) & 0x1FF);
        shadowOAM[16 + i].attr2 = (((i >= player.energyUpgradeValue) ? 2 : 3) * (32) + (0));
    }


}

void attemptUpgradeAgility() {
    if (shells_owned >= agilityUpgradeCosts[player.agilityUpgradeValue] && player.agilityUpgradeValue < 5) {
        shells_owned -= agilityUpgradeCosts[player.agilityUpgradeValue];
        player.agilityUpgradeValue++;
        updateShellsOwned();
        updateAgility();
        updateEnergy();
        updateShield();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

        playSoundB(success_data, success_length - 500, 0);

    } else {

        playSoundB(error_data, error_length - 500, 0);
    }
}

void updateAgility() {

    shadowOAM[2].attr0 = (0 << 13) | (30 & 0xFF);
    shadowOAM[2].attr1 = (0 << 14) | (148 & 0x1FF);
    shadowOAM[2].attr2 = (((agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((agilityUpgradeCosts[player.agilityUpgradeValue] / 1000) % 10))
                                                                                         ;
    shadowOAM[3].attr0 = (0 << 13) | (30 & 0xFF);
    shadowOAM[3].attr1 = (0 << 14) | (156 & 0x1FF);
    shadowOAM[3].attr2 = (((agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((agilityUpgradeCosts[player.agilityUpgradeValue] / 100) % 10))
                                                                                         ;
    shadowOAM[4].attr0 = (0 << 13) | (30 & 0xFF);
    shadowOAM[4].attr1 = (0 << 14) | (164 & 0x1FF);
    shadowOAM[4].attr2 = (((agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((agilityUpgradeCosts[player.agilityUpgradeValue] / 10) % 10))
                                                                                         ;
    shadowOAM[5].attr0 = (0 << 13) | (30 & 0xFF);
    shadowOAM[5].attr1 = (0 << 14) | (172 & 0x1FF);
    shadowOAM[5].attr2 = (((agilityUpgradeCosts[player.agilityUpgradeValue] < shells_owned) ? 0 : 1) * (32) + ((agilityUpgradeCosts[player.agilityUpgradeValue] / 1) % 10))
                                                                                         ;


    for (int i = 0; i < 5; i++) {
        shadowOAM[6 + i].attr0 = (0 << 13) | (1 << 14) | (47 & 0xFF);
        shadowOAM[6 + i].attr1 = (1 << 14) | (74 + (i * 23) & 0x1FF);
        shadowOAM[6 + i].attr2 = (((i >= player.agilityUpgradeValue) ? 2 : 3) * (32) + (0));
    }



}

void updateShellsOwned() {

    shadowOAM[32].attr0 = (0 << 13) | (0 << 14) | (4 & 0xFF);
    shadowOAM[32].attr1 = (0 << 14) | (37 & 0x1FF);
    shadowOAM[32].attr2 = ((8) * (32) + (shells_owned % 10));

    shadowOAM[33].attr0 = (0 << 13) | (0 << 14) | (4 & 0xFF);
    shadowOAM[33].attr1 = (0 << 14) | (30 & 0x1FF);
    shadowOAM[33].attr2 = ((8) * (32) + ((shells_owned / 10) % 10));

    shadowOAM[34].attr0 = (0 << 13) | (0 << 14) | (4 & 0xFF);
    shadowOAM[34].attr1 = (0 << 14) | (23 & 0x1FF);
    shadowOAM[34].attr2 = ((8) * (32) + ((shells_owned / 100) % 10));

    shadowOAM[35].attr0 = (0 << 13) | (0 << 14) | (4 & 0xFF);
    shadowOAM[35].attr1 = (0 << 14) | (16 & 0x1FF);
    shadowOAM[35].attr2 = ((8) * (32) + (shells_owned / 1000));


}

void goUpgradeMenu() {

    int cheatUsed = 0;

    hideSprites();
    state = UPGRADE_MENU;

    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, coral_bgPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, coral_bgTiles, &((charblock *)0x6000000)[0], 7840/2);
    DMANow(3, coral_bgMap, &((screenblock *)0x6000000)[31], 2048/2);

    DMANow(3, upgrade_menu_ssPal, ((unsigned short *)0x5000200), 512/2);
    DMANow(3, upgrade_menu_ssTiles, &((charblock *)0x6000000)[4], 32768/2);
# 338 "upgrade_menu.c"
    shadowOAM[36].attr0 = (0 << 13) | (0 << 14) | (4 & 0xFF);
    shadowOAM[36].attr1 = (1 << 14) | (2 & 0x1FF);
    shadowOAM[36].attr2 = ((9) * (32) + (0));

    updateShellsOwned();
    updateAgility();
    updateEnergy();
    updateShield();



    shadowOAM[102].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[102].attr1 = (3 << 14) | (24 & 0x1FF);
    shadowOAM[102].attr2 = ((16) * (32) + (0));
    shadowOAM[103].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[103].attr1 = (3 << 14) | (88 & 0x1FF);
    shadowOAM[103].attr2 = ((16) * (32) + (8));
    shadowOAM[104].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[104].attr1 = (3 << 14) | (152 & 0x1FF);
    shadowOAM[104].attr2 = ((16) * (32) + (16));

    shadowOAM[105].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[105].attr1 = (3 << 14) | (24 & 0x1FF);
    shadowOAM[105].attr2 = ((24) * (32) + (0));
    shadowOAM[106].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[106].attr1 = (3 << 14) | (88 & 0x1FF);
    shadowOAM[106].attr2 = ((24) * (32) + (8));
    shadowOAM[107].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[107].attr1 = (3 << 14) | (152 & 0x1FF);
    shadowOAM[107].attr2 = ((24) * (32) + (16));


    shadowOAM[108].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[108].attr1 = (3 << 14) | (80 & 0x1FF);
    shadowOAM[108].attr2 = ((13) * (32) + (0));
    shadowOAM[109].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[109].attr1 = (3 << 14) | (144 & 0x1FF);
    shadowOAM[109].attr2 = ((13) * (32) + (8));
    shadowOAM[110].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[110].attr1 = (3 << 14) | (208 & 0x1FF);
    shadowOAM[110].attr2 = ((13) * (32) + (16));


    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
