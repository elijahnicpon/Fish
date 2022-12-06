# 1 "hazards.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hazards.c"
# 1 "hazards.h" 1
void initHazards();
void newHazard();
void updateAndDrawHazards();
void updateAndDrawShield();
void resetHazards();
# 2 "hazards.c" 2
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
# 3 "hazards.c" 2
# 1 "game_ss.h" 1
# 21 "game_ss.h"
extern const unsigned short game_ssTiles[16384];


extern const unsigned short game_ssPal[256];
# 4 "hazards.c" 2
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
# 5 "hazards.c" 2

# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 7 "hazards.c" 2

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 60 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 80 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 186 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 266 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 396 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 577 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 9 "hazards.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3





# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 10 "hazards.c" 2

# 1 "shield.h" 1



# 3 "shield.h"
extern const unsigned int shield_sampleRate;
extern const unsigned int shield_length;
extern const signed char shield_data[];
# 12 "hazards.c" 2

int time, shieldTime, cooldownTimer, gameSpeed;
Player player;
OBJ_ATTR shadowOAM[128];

int sharkFrames[6] = {11, 15, 19, 23, 19, 15};
int dynamiteFrames[10] = {((8) * (32) + (11)), ((8) * (32) + (15)), ((8) * (32) + (19)), ((8) * (32) + (23)), ((8) * (32) + (27)),
                        ((12) * (32) + (11)), ((12) * (32) + (15)), ((12) * (32) + (19)), ((12) * (32) + (23)), ((12) * (32) + (27)) };



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
    int size;

    int hazardType;
    int oam_entry;
    int spriteIndex;
    int isAnimated;
    int numFrames;
    int timeToDisplayFrame;
    int frame;
    int active;


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

                    hazards[i].hazardType = BAG;
                    hazards[i].active = 1;
                    hazards[i].height = 22;
                    hazards[i].width = 18;


                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = ((19) * (32) + (0));
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathPlastic;


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
                    hazards[i].spriteIndex = ((23) * (32) + (0));
                    hazards[i].size = 0;
                    hazards[i].deathfn = goDeathPlastic;

                    x = (rand() % 240 - hazards[i].width) * 8;
                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240 - hazards[i].width) * 8;
                    }
                    hazards[i].x = x;
                    hazards[i].y = -hazards[i].height * 8;

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
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = ((15) * (32) + (0));
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathPlastic;



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
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].size = 3;
                    hazards[i].deathfn = goDeathShark;


                    hazards[i].isAnimated = 1;
                    hazards[i].frame = 0;
                    hazards[i].spriteIndex = sharkFrames[hazards[i].frame];
                    hazards[i].numFrames = 6;
                    hazards[i].timeToDisplayFrame = 15 + (rand() % 3);


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
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = ((24) * (32) + (8));
                    hazards[i].size = 3;

                    hazards[i].deathfn = goDeathOil;



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
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = ((24) * (32) + (0));
                    hazards[i].size = 3;

                    hazards[i].deathfn = goDeathCyanide;



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







                    hazards[i].dx = (hazards[i].isHFlip == 0) ? (rand() % 3) + 1 : -(rand() % 3) - 1;
                    hazards[i].x = (rand() % 40) + ((hazards[i].dx > 0) ? 0 : 1500);

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = ((8) * (32) + (0));
                    hazards[i].size = 3;

                    hazards[i].deathfn = goDeathBoat;



                    hazards[i].isTall = 0;
                    hazards[i].isWide = 1;
                    hazards[i].isAnimated = 0;

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
                        x = (rand() % 240 - (hazards[i].width / 2)) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].size = 2;
                    hazards[i].deathfn = goDeathDynamite;


                    hazards[i].isAnimated = 1;
                    hazards[i].frame = 0;
                    hazards[i].spriteIndex = dynamiteFrames[hazards[i].frame];
                    hazards[i].numFrames = 10;
                    hazards[i].timeToDisplayFrame = 10 + (rand() % 3);


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

    if (shieldTime >= time) {
        if (time % 2 != 0) {
            shadowOAM[11].attr0 = (player.y & 0xFF) | (0 << 13);
            shadowOAM[11].attr1 = (1 << 14) | ((player.x / 8) - 2 & 0x1FF);

            shadowOAM[11].attr2 = ((16) * (32) + (11)) | ((0)<<10);
        } else {
            shadowOAM[11].attr0 = (2 << 8);
        }

    } else {
        shadowOAM[11].attr0 = (2 << 8);
    }

}

int minmin(int a, int b) {
    return (a < b) ? a : b;
}

void updateAndDrawHazards() {
    cooldownTimer--;


    if (time % (120 / gameSpeed) == 0 && cooldownTimer < 0 && (time / 60) < 120) {
        newHazard();
    }

    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {




            if (hazards[i].isTall) {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | (0 << 13) | (2 << 14);
            } else if (hazards[i].isWide) {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | (0 << 13) | (1 << 14);
            } else {
                shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | (0 << 13);
            }

            if (hazards[i].isAnimated && (time % hazards[i].timeToDisplayFrame) == 0) {
                if (hazards[i].hazardType == SHARK) {
                    hazards[i].frame = (hazards[i].frame + 1) % hazards[i].numFrames;
                    hazards[i].spriteIndex = sharkFrames[hazards[i].frame];
                }
                if (hazards[i].hazardType == DYNAMITE && hazards[i].y > 90 * 8) {

                    hazards[i].frame = minmin(hazards[i].frame + 1, 9);
                    hazards[i].spriteIndex = dynamiteFrames[hazards[i].frame];
                }
            }

            if (hazards[i].isHFlip) {
                shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size << 14) | (1 << 12);
            } else {
                shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size << 14);
            }
            if (hazards[i].hazardType == DYNAMITE) {
                shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex | ((1)<<10) | ((1)<<12);
            } else {
                shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex | ((1)<<10);
            }

            if (collision(hazards[i].x / 8, hazards[i].y / 8, hazards[i].width, hazards[i].height, player.x / 8, player.y, player.width, player.height)) {
                if (player.shieldsLeft > 0) {
                    player.shieldsLeft--;
                    newShield();
                } else {

                    pauseSounds();
                    shieldTime = 0;
                    hazards[i].deathfn();

                }

                hazards[i].active = 0;

            }

            if (hazards[i].y > 160 * 8) {
                hazards[i].active = 0;
            } else {
                hazards[i].y += gameSpeed;
                if (hazards[i].hazardType == SHARK) {
                    hazards[i].y += 2;
                }
                if (hazards[i].hazardType == BOAT) {
                    hazards[i].x += hazards[i].dx;
                }

            }

        } else {
            shadowOAM[hazards[i].oam_entry].attr0 = (2 << 8);
        }
    }
}

void resetHazards() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        hazards[i].oam_entry = 60 + i;
        hazards[i].active = 0;
        hazards[i].spriteIndex = ((24) * (32) + (24));
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





    switch (timeBlock) {
        case 0:
            if (0 < randVal && randVal < 50) {
                hazardFactory(BAG);
            } else {

                hazardFactory(STRAW);
            }
            break;

        case 1:
            if (0 < randVal && randVal < 25) {

                hazardFactory(BAG);
            } else if (25 < randVal && randVal < 50) {

                hazardFactory(STRAW);
            } else if (50 < randVal && randVal < 75) {

                hazardFactory(SIX_PACK);
            } else {

                hazardFactory(NET);
            }
            break;

        case 2:
            if (0 < randVal && randVal < 33) {

                hazardFactory(SIX_PACK);
            } else if (33 < randVal && randVal < 66) {

                hazardFactory(NET);
            } else {

                hazardFactory(OIL);
            }
            break;

        case 3:
            if (0 < randVal && randVal < 25) {

                hazardFactory(NET);
            } else if (25 < randVal && randVal < 50) {

                hazardFactory(OIL);
            } else if (50 < randVal && randVal < 75) {

                hazardFactory(SHARK);
            } else {

                hazardFactory(CYANIDE);
            }
            break;

        case 4:
            if (0 < randVal && randVal < 25) {

                hazardFactory(NET);
            } else if (25 < randVal && randVal < 50) {

                hazardFactory(OIL);
            } else if (50 < randVal && randVal < 75) {

                hazardFactory(SHARK);
            } else {

                hazardFactory(CYANIDE);
            }
            break;

        case 5:
            if (0 < randVal && randVal < 33) {

                hazardFactory(SHARK);
            } else if (33 < randVal && randVal < 66) {
                hazardFactory(BOAT);
            } else {

                hazardFactory(CYANIDE);
            }
            break;

        case 6:
            if (0 < randVal && randVal < 50) {

                hazardFactory(SHARK);
            } else {

                hazardFactory(BOAT);
            }
            break;

        case 7:
            if (0 < randVal && randVal < 33) {

                hazardFactory(SHARK);
            } else if (33 < randVal && randVal < 66) {

                hazardFactory(BOAT);
            } else {

                hazardFactory(DYNAMITE);
            }
            break;

        default:
            break;
    }
}
