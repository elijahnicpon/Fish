
//{{BLOCK(game_bg)

//======================================================================
//
//	game_bg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2022-11-07, 02:34:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME_BG_H
#define GRIT_GAME_BG_H

#define game_bgTilesLen 352
extern const unsigned short game_bgTiles[176];

#define game_bgMapLen 2048
extern const unsigned short game_bgMap[1024];

#define game_bgPalLen 512
extern const unsigned short game_bgPal[256];

#endif // GRIT_GAME_BG_H

//}}BLOCK(game_bg)
