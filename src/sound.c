#include "gba.h"
#include "sound.h"

int pause;

void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;

}

// TODO 1.1: Complete this function
void playSoundA(const signed char* sound, int length, int looping) {

   // Set DMA channel to 1
    dma[1].cnt = 0;
    DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 0
    REG_TM0CNT = TIMER_OFF;
    int ticks = (PROCESSOR_CYCLES_PER_SECOND/SOUND_FREQ);
    REG_TM0D = -ticks;
    REG_TM0CNT = TIMER_ON;

    // Initialize struct members of soundA
    soundA.data = sound;
    soundA.length = length;
    soundA.looping = looping;
    soundA.duration = (VBLANK_FREQ * length) / SOUND_FREQ;
    soundA.vBlankCount = 0;
    soundA.isPlaying = 1;



}

// TODO 1.2: Complete this function
void playSoundB(const signed char* sound, int length, int looping) {

   // Set DMA channel to 2
    dma[2].cnt = 0;
    DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 1
    REG_TM1CNT = TIMER_OFF;
    int ticks = (PROCESSOR_CYCLES_PER_SECOND/SOUND_FREQ);
    REG_TM1D = -ticks;
    REG_TM1CNT = TIMER_ON;

    // Initialize struct members of soundB
    soundB.data = sound;
    soundB.length = length;
    soundB.looping = looping;
    soundB.duration = (VBLANK_FREQ * length) / SOUND_FREQ;
    soundB.vBlankCount = 0;
    soundB.isPlaying = 1;


}

// TODO 4.1: Complete this function
void pauseSounds() {
    //pause = 1;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    //REG_TM1CNT = TIMER_OFF;
    //REG_TM3CNT = TIMER_OFF;
}

// TODO 4.2: Complete this function
void unpauseSounds() {
    //pause = 0;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    //REG_TM1CNT = TIMER_ON;
    // REG_TM2CNT = TIMER_ON;
    // REG_TM3CNT = TIMER_ON;
}

// TODO 4.3: Complete this function
void stopSounds() {
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
    dma[0].cnt = 0;
    dma[1].cnt = 0;
}