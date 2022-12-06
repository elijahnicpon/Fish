# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
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
# 2 "gba.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;
void interruptHandler();



int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA <= rowB + heightB - 1 && rowA + heightA - 1 >= rowB && colA <= colB + widthB - 1 && colA + widthA - 1 >= colB;
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}




void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[((row) * (240) + (col))] = color;
}

void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
    for (int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r) * (240) + (col))], (2 << 23) | width);
    }
}

void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
    DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}

void drawImage3(int col, int row, int width, int height, const unsigned short *image) {
    for (int r = 0; r < height; r++) {
        DMANow(3, &image[((r) * (width) + (0))], &videoBuffer[((row + r) * (240) + (col))], width);
    }
}

void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160);
}




void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i) * (width / 2) + (0))], &videoBuffer[((row + i) * (240) + (col)) / 2], width / 2);
    }
}

void setPixel4(int col, int row, unsigned char colorIndex) {
    volatile unsigned short pixelData = videoBuffer[((row) * (240) + (col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row) * (240) + (col)) / 2] = pixelData;
}

void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {

        if (width == 1) {
            setPixel4(col, row + r, colorIndex);
        } else if (width == 2) {
            setPixel4(col, row + r, colorIndex);
            setPixel4(col + 1, row + r, colorIndex);
        } else if ((col & 1) && (width & 1)) {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col + 1)) / 2], (2 << 23) | (width - 1) / 2);
        } else if (width & 1) {
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        } else if (col & 1) {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        } else {
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col)) / 2], (2 << 23) | width / 2);
        }
    }
}

void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}

void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}

void flipPage() {
    if ((*(volatile unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1<<4);
}





DMA *dma = (DMA *)0x40000B0;

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;

    dma[channel].src = src;
    dma[channel].dst = dst;

    dma[channel].cnt = cnt | (1 << 31);
}





void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2 << 8);
    }
}

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
# 136 "gba.c" 2


void setupInterrupts() {


    *(unsigned short*)0x4000208 = 0;


    *(unsigned short*)0x4000200 = 1 << 0;

    *(unsigned short*)0x4000004 = (1 << 3);

    *(unsigned short*)0x4000200 |= 1<<5 | 1<<6;


    *((ihp*)0x03007FFC) = interruptHandler;


    *(unsigned short*)0x4000208 = 1;

}

void interruptHandler() {

    *(unsigned short*)0x4000208 = 0;


    if (*(volatile unsigned short*)0x4000202 & 1 << 0) {

        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.length, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                    dma[1].cnt = 0;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.length, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                    dma[2].cnt = 0;
                }
            }
        }



    }


    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;


    *(unsigned short*)0x4000208 = 1;

}
