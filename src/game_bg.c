
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

const unsigned short game_bgTiles[176] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x2222,0x2222,0x2222,0x2222,0x3232,0x2222,0x2323,0x2323,
	0x3232,0x3232,0x2311,0x2323,0x1166,0x3232,0x6666,0x1111,
	0x2222,0x3222,0x2222,0x2322,0x3232,0x3232,0x2323,0x2323,
	0x3232,0x1112,0x1323,0x6661,0x6111,0x4466,0x6666,0x7744,
	0x3232,0x3232,0x2323,0x2323,0x3232,0x3232,0x1111,0x1111,
	0x6666,0x6666,0x4446,0x4444,0x7774,0x7777,0x5757,0x5757,

	0x2222,0x2222,0x2323,0x2223,0x3232,0x2232,0x2323,0x2323,
	0x1116,0x3232,0x6666,0x2311,0x6444,0x1166,0x4777,0x6664,
	0x6447,0x6666,0x4777,0x4444,0x7575,0x7777,0x5752,0x5757,
	0x7222,0x7575,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x4446,0x7577,0x7774,0x5757,0x7577,0x2275,0x5757,0x2222,
	0x2225,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x7575,0x7575,0x2227,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,

	0x7575,0x4447,0x5757,0x7777,0x7222,0x7575,0x2222,0x7752,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short game_bgMap[1024] __attribute__((aligned(4)))=
{
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0009,0x0009,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x000A,0x000A,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0000,0x0000,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0000,0x0000,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0000,0x0000,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0001,0x0002,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0005,0x0006,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0000,0x0000,

	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0001,0x0002,0x0003,0x0004,0x0001,0x0002,0x0003,0x0004,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,
	0x0005,0x0006,0x0007,0x0008,0x0005,0x0006,0x0007,0x0008,

	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0000,0x0000,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x0009,0x0009,0x0009,0x0009,0x0009,0x0009,0x0000,0x0009,
};

const unsigned short game_bgPal[256] __attribute__((aligned(4)))=
{
	0x0000,0x7FDA,0x7E00,0x7E8A,0x40E2,0x6582,0x7FFF,0x5123,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//}}BLOCK(game_bg)
