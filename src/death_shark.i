# 1 "death_shark.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "death_shark.c"
# 1 "death_shark.h" 1
void goDeathShark();
void doDeathShark();
# 2 "death_shark.c" 2
# 1 "states.h" 1
# 1 "start_menu.h" 1
void goStartMenu();
void doStartMenu();
# 2 "states.h" 2
# 1 "info_menu.h" 1
void goInfoMenu(void (*returnTo)());
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
void goAboutMenu(void (*returnTo)());
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
# 3 "death_shark.c" 2
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
# 4 "death_shark.c" 2

# 1 "coral_bg.h" 1
# 22 "coral_bg.h"
extern const unsigned short coral_bgTiles[3920];


extern const unsigned short coral_bgMap[1024];


extern const unsigned short coral_bgPal[256];
# 6 "death_shark.c" 2
# 1 "death_shark_ss.h" 1
# 21 "death_shark_ss.h"
extern const unsigned short death_shark_ssTiles[16384];


extern const unsigned short death_shark_ssPal[256];
# 7 "death_shark.c" 2

int state, hOff, vOff, time;
OBJ_ATTR shadowOAM[128];

void doDeathShark() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))){
        goUpgradeMenu();
    }
    waitForVBlank();
    hOff += 1;
    vOff = 0;
    time++;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff / 8;
}


void goDeathShark() {
    hideSprites();
    state = DEATH_SHARK;

    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, coral_bgPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, coral_bgTiles, &((charblock *)0x6000000)[0], 7840/2);
    DMANow(3, coral_bgMap, &((screenblock *)0x6000000)[31], 2048/2);

    DMANow(3, death_shark_ssPal, ((unsigned short *)0x5000200), 512/2);
    DMANow(3, death_shark_ssTiles, &((charblock *)0x6000000)[4], 32768/2);


    shadowOAM[2].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[2].attr1 = (3 << 14) | (24 & 0x1FF);
    shadowOAM[2].attr2 = ((16) * (32) + (0));
    shadowOAM[3].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[3].attr1 = (3 << 14) | (88 & 0x1FF);
    shadowOAM[3].attr2 = ((16) * (32) + (8));
    shadowOAM[4].attr0 = (0 << 13) | (16 & 0xFF);
    shadowOAM[4].attr1 = (3 << 14) | (152 & 0x1FF);
    shadowOAM[4].attr2 = ((16) * (32) + (16));

    shadowOAM[5].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[5].attr1 = (3 << 14) | (24 & 0x1FF);
    shadowOAM[5].attr2 = ((24) * (32) + (0));
    shadowOAM[6].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[6].attr1 = (3 << 14) | (88 & 0x1FF);
    shadowOAM[6].attr2 = ((24) * (32) + (8));
    shadowOAM[7].attr0 = (0 << 13) | (80 & 0xFF);
    shadowOAM[7].attr1 = (3 << 14) | (152 & 0x1FF);
    shadowOAM[7].attr2 = ((24) * (32) + (16));


    shadowOAM[8].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[8].attr1 = (3 << 14) | (80 & 0x1FF);
    shadowOAM[8].attr2 = ((13) * (32) + (0));
    shadowOAM[9].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[9].attr1 = (3 << 14) | (144 & 0x1FF);
    shadowOAM[9].attr2 = ((13) * (32) + (8));
    shadowOAM[10].attr0 = (0 << 13) | (1 << 14) | (144 & 0xFF);
    shadowOAM[10].attr1 = (3 << 14) | (208 & 0x1FF);
    shadowOAM[10].attr2 = ((13) * (32) + (16));


    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
