
//{{BLOCK(game_bg_copy)

//======================================================================
//
//	game_bg_copy, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2022-11-15, 17:59:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME_BG_COPY_H
#define GRIT_GAME_BG_COPY_H

#define game_bg_copyTilesLen 352
extern const unsigned short game_bg_copyTiles[176];

#define game_bg_copyMapLen 2048
extern const unsigned short game_bg_copyMap[1024];

#define game_bg_copyPalLen 512
extern const unsigned short game_bg_copyPal[256];

#endif // GRIT_GAME_BG_COPY_H

//}}BLOCK(game_bg_copy)
