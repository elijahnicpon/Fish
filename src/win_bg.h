
//{{BLOCK(win_bg)

//======================================================================
//
//	win_bg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 270 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 8640 + 2048 = 11200
//
//	Time-stamp: 2022-12-04, 23:11:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_BG_H
#define GRIT_WIN_BG_H

#define win_bgTilesLen 8640
extern const unsigned short win_bgTiles[4320];

#define win_bgMapLen 2048
extern const unsigned short win_bgMap[1024];

#define win_bgPalLen 512
extern const unsigned short win_bgPal[256];

#endif // GRIT_WIN_BG_H

//}}BLOCK(win_bg)
