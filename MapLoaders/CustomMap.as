Random map_random(1569815698);

#include "LoadMapUtils.as";
#include "BlockCommon.as" 

namespace CMap
{
	// tiles
	const SColor color_water(255, 77, 133, 188);
	// custom land tiles
	const SColor color_sand(255, 236, 213, 144);
	const SColor color_grass(255, 100, 155, 13);
	const SColor color_rock(255, 161, 161, 161);
	const SColor color_shoal(255, 100, 170, 180);
	// objects
	const SColor color_main_spawn(255, 0, 255, 255);
	const SColor color_station(255, 255, 0, 0);
	const SColor color_ministation(255, 255, 140, 0);
	const SColor color_palmtree(255, 0, 150, 0);
	
	//
	void SetupMap(CMap@ map, int width, int height)
	{
		map.CreateTileMap(width, height, 8.0f, "LandTiles.png");
		map.CreateSky(SColor(255, 41, 100, 176));
		map.topBorder = map.bottomBorder = map.rightBorder = map.leftBorder = true;
	} 

	enum Blocks {
		water = 0,
		
		sand_inland = 384,
		sand_shore_convex_RU1 = 400,
		sand_shore_convex_LU1 = 402,
		sand_shore_convex_LD1 = 404,
		sand_shore_convex_RD1 = 406,
		sand_shore_straight_R1 = 416,
		sand_shore_straight_U1 = 418,
		sand_shore_straight_L1 = 420,
		sand_shore_straight_D1 = 422,
		sand_shore_concave_RU1 = 432,
		sand_shore_concave_LU1 = 434,
		sand_shore_concave_LD1 = 436,
		sand_shore_concave_RD1 = 438,
		sand_shore_peninsula_R1 = 448,
		sand_shore_peninsula_U1 = 450,
		sand_shore_peninsula_L1 = 452,
		sand_shore_peninsula_D1 = 454,
		sand_shore_strip_H1 = 464,
		sand_shore_strip_V1 = 466,
		sand_shore_island1 = 468,
		sand_shore_cross1 = 470,
		sand_shore_bend_RU1 = 480,
		sand_shore_bend_LU1 = 482,
		sand_shore_bend_LD1 = 484,
		sand_shore_bend_RD1 = 486,
		sand_shore_T_R1 = 496,
		sand_shore_T_U1 = 598,
		sand_shore_T_L1 = 600,
		sand_shore_T_D1 = 602,
		sand_shore_choke_R1 = 512,
		sand_shore_choke_U1 = 514,
		sand_shore_choke_L1 = 516,
		sand_shore_choke_D1 = 518,
		sand_shore_split_RU1 = 528,
		sand_shore_split_LU1 = 530,
		sand_shore_split_LD1 = 532,
		sand_shore_split_RD1 = 534,
		sand_shore_panhandleL_R1 = 544,
		sand_shore_panhandleL_U1 = 546,
		sand_shore_panhandleL_L1 = 548,
		sand_shore_panhandleL_D1 = 550,
		sand_shore_panhandleR_R1 = 560,
		sand_shore_panhandleR_U1 = 562,
		sand_shore_panhandleR_L1 = 564,
		sand_shore_panhandleR_D1 = 566,
		sand_shore_diagonal_R1 = 576,
		sand_shore_diagonal_L1 = 578,
		
		//--------
		
		grass_inland = 389,
		grass_sand_border_convex_RU1 = 408,
		grass_sand_border_convex_LU1 = 410,
		grass_sand_border_convex_LD1 = 412,
		grass_sand_border_convex_RD1 = 414,
		grass_sand_border_straight_R1 = 424,
		grass_sand_border_straight_U1 = 426,
		grass_sand_border_straight_L1 = 428,
		grass_sand_border_straight_D1 = 430,
		grass_sand_border_concave_RU1 = 440,
		grass_sand_border_concave_LU1 = 442,
		grass_sand_border_concave_LD1 = 446,
		grass_sand_border_concave_RD1 = 389,
		grass_sand_border_peninsula_R1 = 456,
		grass_sand_border_peninsula_U1 = 458,
		grass_sand_border_peninsula_L1 = 460,
		grass_sand_border_peninsula_D1 = 462,
		grass_sand_border_strip_H1 = 472,
		grass_sand_border_strip_V1 = 474,
		grass_sand_border_island1 = 476,
		grass_sand_border_cross1 = 478,
		grass_sand_border_bend_RU1 = 488,
		grass_sand_border_bend_LU1 = 490,
		grass_sand_border_bend_LD1 = 492,
		grass_sand_border_bend_RD1 = 494,
		grass_sand_border_T_R1 = 504,
		grass_sand_border_T_U1 = 506,
		grass_sand_border_T_L1 = 508,
		grass_sand_border_T_D1 = 510,
		grass_sand_border_choke_R1 = 520,
		grass_sand_border_choke_U1 = 522,
		grass_sand_border_choke_L1 = 524,
		grass_sand_border_choke_D1 = 526,
		grass_sand_border_split_RU1 = 536,
		grass_sand_border_split_LU1 = 538,
		grass_sand_border_split_LD1 = 540,
		grass_sand_border_split_RD1 = 542,
		grass_sand_border_panhandleL_R1 = 552,
		grass_sand_border_panhandleL_U1 = 554,
		grass_sand_border_panhandleL_L1 = 556,
		grass_sand_border_panhandleL_D1 = 558,
		grass_sand_border_panhandleR_R1 = 568,
		grass_sand_border_panhandleR_U1 = 570,
		grass_sand_border_panhandleR_L1 = 572,
		grass_sand_border_panhandleR_D1 = 574,
		grass_sand_border_diagonal_R1 = 584,
		grass_sand_border_diagonal_L1 = 586,
		
		rock_inland = 592,
		rock_shore_convex_RU1 = 608,
		rock_shore_convex_LU1 = 612,
		rock_shore_convex_LD1 = 616,
		rock_shore_convex_RD1 = 620,
		rock_shore_straight_R1 = 624,
		rock_shore_straight_U1 = 628,
		rock_shore_straight_L1 = 632,
		rock_shore_straight_D1 = 636,
		rock_shore_concave_RU1 = 640,
		rock_shore_concave_LU1 = 644,
		rock_shore_concave_LD1 = 648,
		rock_shore_concave_RD1 = 652,
		rock_shore_peninsula_R1 = 656,
		rock_shore_peninsula_U1 = 660,
		rock_shore_peninsula_L1 = 664,
		rock_shore_peninsula_D1 = 668,
		rock_shore_strip_H1 = 672,
		rock_shore_strip_V1 = 676,
		rock_shore_island1 = 680,
		rock_shore_cross1 = 684,
		rock_shore_bend_RU1 = 688,
		rock_shore_bend_LU1 = 692,
		rock_shore_bend_LD1 = 696,
		rock_shore_bend_RD1 = 700,
		rock_shore_T_R1 = 704,
		rock_shore_T_U1 = 708,
		rock_shore_T_L1 = 712,
		rock_shore_T_D1 = 716,
		rock_shore_choke_R1 = 720,
		rock_shore_choke_U1 = 724,
		rock_shore_choke_L1 = 728,
		rock_shore_choke_D1 = 732,
		rock_shore_split_RU1 = 736,
		rock_shore_split_LU1 = 740,
		rock_shore_split_LD1 = 744,
		rock_shore_split_RD1 = 748,
		rock_shore_panhandleL_R1 = 752,
		rock_shore_panhandleL_U1 = 756,
		rock_shore_panhandleL_L1 = 760,
		rock_shore_panhandleL_D1 = 764,
		rock_shore_panhandleR_R1 = 768,
		rock_shore_panhandleR_U1 = 772,
		rock_shore_panhandleR_L1 = 776,
		rock_shore_panhandleR_D1 = 780,
		rock_shore_diagonal_R1 = 784,
		rock_shore_diagonal_L1 = 788,

		//---------
		
		rock_sand_border_convex_RU1 = 800,
		rock_sand_border_convex_LU1 = 804,
		rock_sand_border_convex_LD1 = 808,
		rock_sand_border_convex_RD1 = 812,
		rock_sand_border_straight_R1 = 816,
		rock_sand_border_straight_U1 = 820,
		rock_sand_border_straight_L1 = 824,
		rock_sand_border_straight_D1 = 828,
		rock_sand_border_concave_RU1 = 832,
		rock_sand_border_concave_LU1 = 836,
		rock_sand_border_concave_LD1 = 840,
		rock_sand_border_concave_RD1 = 844,
		rock_sand_border_peninsula_R1 = 848,
		rock_sand_border_peninsula_U1 = 852,
		rock_sand_border_peninsula_L1 = 856,
		rock_sand_border_peninsula_D1 = 860,
		rock_sand_border_strip_H1 = 864,
		rock_sand_border_strip_V1 = 868,
		rock_sand_border_island1 = 872,
		rock_sand_border_cross1 = 876,
		rock_sand_border_bend_RU1 = 880,
		rock_sand_border_bend_LU1 = 884,
		rock_sand_border_bend_LD1 = 888,
		rock_sand_border_bend_RD1 = 892,
		rock_sand_border_T_R1 = 896,
		rock_sand_border_T_U1 = 900,
		rock_sand_border_T_L1 = 904,
		rock_sand_border_T_D1 = 908,
		rock_sand_border_choke_R1 = 912,
		rock_sand_border_choke_U1 = 916,
		rock_sand_border_choke_L1 = 920,
		rock_sand_border_choke_D1 = 924,
		rock_sand_border_split_RU1 = 928,
		rock_sand_border_split_LU1 = 932,
		rock_sand_border_split_LD1 = 936,
		rock_sand_border_split_RD1 = 940,
		rock_sand_border_panhandleL_R1 = 944,
		rock_sand_border_panhandleL_U1 = 948,
		rock_sand_border_panhandleL_L1 = 952,
		rock_sand_border_panhandleL_D1 = 956,
		rock_sand_border_panhandleR_R1 = 960,
		rock_sand_border_panhandleR_U1 = 964,
		rock_sand_border_panhandleR_L1 = 968,
		rock_sand_border_panhandleR_D1 = 972,
		rock_sand_border_diagonal_R1 = 976,
		rock_sand_border_diagonal_L1 = 980,

		rock_shoal_border_convex_RU1 = 992,
		rock_shoal_border_convex_LU1 = 996,
		rock_shoal_border_convex_LD1 = 1000,
		rock_shoal_border_convex_RD1 = 1004,
		rock_shoal_border_straight_R1 = 1008,
		rock_shoal_border_straight_U1 = 1012,
		rock_shoal_border_straight_L1 = 1016,
		rock_shoal_border_straight_D1 = 1020,
		rock_shoal_border_concave_RU1 = 1024,
		rock_shoal_border_concave_LU1 = 1028,
		rock_shoal_border_concave_LD1 = 1032,
		rock_shoal_border_concave_RD1 = 1036,
		rock_shoal_border_peninsula_R1 = 1040,
		rock_shoal_border_peninsula_U1 = 1044,
		rock_shoal_border_peninsula_L1 = 1048,
		rock_shoal_border_peninsula_D1 = 1052,
		rock_shoal_border_strip_H1 = 1056,
		rock_shoal_border_strip_V1 = 1060,
		rock_shoal_border_island1 = 1064,
		rock_shoal_border_cross1 = 1068,
		rock_shoal_border_bend_RU1 = 1072,
		rock_shoal_border_bend_LU1 = 1076,
		rock_shoal_border_bend_LD1 = 1080,
		rock_shoal_border_bend_RD1 = 1084,
		rock_shoal_border_T_R1 = 1088,
		rock_shoal_border_T_U1 = 1092,
		rock_shoal_border_T_L1 = 1096,
		rock_shoal_border_T_D1 = 1100,
		rock_shoal_border_choke_R1 = 1104,
		rock_shoal_border_choke_U1 = 1108,
		rock_shoal_border_choke_L1 = 1112,
		rock_shoal_border_choke_D1 = 1116,
		rock_shoal_border_split_RU1 = 1120,
		rock_shoal_border_split_LU1 = 1124,
		rock_shoal_border_split_LD1 = 1128,
		rock_shoal_border_split_RD1 = 1132,
		rock_shoal_border_panhandleL_R1 = 1136,
		rock_shoal_border_panhandleL_U1 = 1140,
		rock_shoal_border_panhandleL_L1 = 1144,
		rock_shoal_border_panhandleL_D1 = 1148,
		rock_shoal_border_panhandleR_R1 = 1152,
		rock_shoal_border_panhandleR_U1 = 1156,
		rock_shoal_border_panhandleR_L1 = 1160,
		rock_shoal_border_panhandleR_D1 = 1164,
		rock_shoal_border_diagonal_R1 = 1168,
		rock_shoal_border_diagonal_L1 = 1172,
		
		shoal_inland = 1184,
		shoal_shore_convex_RU1 = 1200,
		shoal_shore_convex_LU1 = 1204,
		shoal_shore_convex_LD1 = 1208,
		shoal_shore_convex_RD1 = 1212,
		shoal_shore_straight_R1 = 1216,
		shoal_shore_straight_U1 = 1220,
		shoal_shore_straight_L1 = 1224,
		shoal_shore_straight_D1 = 1228,
		shoal_shore_concave_RU1 = 1232,
		shoal_shore_concave_LU1 = 1236,
		shoal_shore_concave_LD1 = 1240,
		shoal_shore_concave_RD1 = 1244,
		shoal_shore_peninsula_R1 = 1248,
		shoal_shore_peninsula_U1 = 1252,
		shoal_shore_peninsula_L1 = 1256,
		shoal_shore_peninsula_D1 = 1260,
		shoal_shore_strip_H1 = 1264,
		shoal_shore_strip_V1 = 1268,
		shoal_shore_island1 = 1272,
		shoal_shore_cross1 = 1276,
		shoal_shore_bend_RU1 = 1280,
		shoal_shore_bend_LU1 = 1284,
		shoal_shore_bend_LD1 = 1288,
		shoal_shore_bend_RD1 = 1292,
		shoal_shore_T_R1 = 1296,
		shoal_shore_T_U1 = 1300,
		shoal_shore_T_L1 = 1304,
		shoal_shore_T_D1 = 1308,
		shoal_shore_choke_R1 = 1312,
		shoal_shore_choke_U1 = 1316,
		shoal_shore_choke_L1 = 1320,
		shoal_shore_choke_D1 = 1324,
		shoal_shore_split_RU1 = 1328,
		shoal_shore_split_LU1 = 1332,
		shoal_shore_split_LD1 = 1336,
		shoal_shore_split_RD1 = 1340,
		shoal_shore_panhandleL_R1 = 1344,
		shoal_shore_panhandleL_U1 = 1348,
		shoal_shore_panhandleL_L1 = 1352,
		shoal_shore_panhandleL_D1 = 1356,
		shoal_shore_panhandleR_R1 = 1360,
		shoal_shore_panhandleR_U1 = 1364,
		shoal_shore_panhandleR_L1 = 1368,
		shoal_shore_panhandleR_D1 = 1372,
		shoal_shore_diagonal_R1 = 1376,
		shoal_shore_diagonal_L1 = 1380,
		
		//-----------

		sand_shoal_border_convex_RU1 = 1392,
		sand_shoal_border_convex_LU1 = 1396,
		sand_shoal_border_convex_LD1 = 1400,
		sand_shoal_border_convex_RD1 = 1404,
		sand_shoal_border_straight_R1 = 1408,
		sand_shoal_border_straight_U1 = 1412,
		sand_shoal_border_straight_L1 = 1416,
		sand_shoal_border_straight_D1 = 1420,
		sand_shoal_border_concave_RU1 = 1424,
		sand_shoal_border_concave_LU1 = 1428,
		sand_shoal_border_concave_LD1 = 1432,
		sand_shoal_border_concave_RD1 = 1436,
		sand_shoal_border_peninsula_R1 = 1440,
		sand_shoal_border_peninsula_U1 = 1444,
		sand_shoal_border_peninsula_L1 = 1448,
		sand_shoal_border_peninsula_D1 = 1452,
		sand_shoal_border_strip_H1 = 1456,
		sand_shoal_border_strip_V1 = 1460,
		sand_shoal_border_island1 = 1464,
		sand_shoal_border_cross1 = 1468,
		sand_shoal_border_bend_RU1 = 1472,
		sand_shoal_border_bend_LU1 = 1476,
		sand_shoal_border_bend_LD1 = 1480,
		sand_shoal_border_bend_RD1 = 1484,
		sand_shoal_border_T_R1 = 1488,
		sand_shoal_border_T_U1 = 1492,
		sand_shoal_border_T_L1 = 1496,
		sand_shoal_border_T_D1 = 1500,
		sand_shoal_border_choke_R1 = 1504,
		sand_shoal_border_choke_U1 = 1508,
		sand_shoal_border_choke_L1 = 1512,
		sand_shoal_border_choke_D1 = 1516,
		sand_shoal_border_split_RU1 = 1520,
		sand_shoal_border_split_LU1 = 1524,
		sand_shoal_border_split_LD1 = 1528,
		sand_shoal_border_split_RD1 = 1532,
		sand_shoal_border_panhandleL_R1 = 1536,
		sand_shoal_border_panhandleL_U1 = 1540,
		sand_shoal_border_panhandleL_L1 = 1544,
		sand_shoal_border_panhandleL_D1 = 1548,
		sand_shoal_border_panhandleR_R1 = 1552,
		sand_shoal_border_panhandleR_U1 = 1556,
		sand_shoal_border_panhandleR_L1 = 1560,
		sand_shoal_border_panhandleR_D1 = 1564,
		sand_shoal_border_diagonal_R1 = 1568,
		sand_shoal_border_diagonal_L1 = 1572,
	}; 	
	
	SColor pixel_R = color_water;
	SColor pixel_RU = color_water;
	SColor pixel_U = color_water;
	SColor pixel_LU = color_water;
	SColor pixel_L = color_water;
	SColor pixel_LD = color_water;
	SColor pixel_D = color_water;
	SColor pixel_RD = color_water;

	//
	void handlePixel( CMap@ map, CFileImage@ image, SColor pixel, int offset, Vec2f pixelPos)
	{	
		if ( image !is null && image.isLoaded() )
		{
			image.setPixelPosition( pixelPos + Vec2f(1, 0) );
			if (image.canRead())
				pixel_R = image.readPixel();
			
			if (image.getPixelPosition().y > 0)
			{
				image.setPixelPosition( pixelPos + Vec2f(1, -1) );
				if (image.canRead())
					pixel_RU = image.readPixel();

				image.setPixelPosition( pixelPos + Vec2f(0, -1) );
				if (image.canRead())
					pixel_U = image.readPixel();
				
				image.setPixelPosition( pixelPos + Vec2f(-1, -1) );
				if (image.canRead())
					pixel_LU = image.readPixel();
			}
			
			image.setPixelPosition( pixelPos + Vec2f(-1, 0) );
			if (image.canRead())
				pixel_L = image.readPixel();
			
			image.setPixelPosition( pixelPos + Vec2f(-1, 1) );
			if (image.canRead())
				pixel_LD = image.readPixel();
			
			image.setPixelPosition( pixelPos + Vec2f(0, 1) );
			if (image.canRead())
				pixel_D = image.readPixel();
			
			image.setPixelPosition( pixelPos + Vec2f(1, 1) );
			if (image.canRead())
				pixel_RD = image.readPixel();
				
			image.setPixelOffset(offset);
		}
	
		if (pixel == color_water) 
		{				
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );

		}		
		else if (pixel == color_main_spawn) 
		{
			AddMarker( map, offset, "spawn" );
			PlaceMostLikelyTile(map, offset);
		}
		else if (pixel == color_station) 
		{
			map.SetTile(offset, CMap::grass_inland );		
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
			
			CBlob@ stationBlob = spawnBlob( map, "block", offset, 10, false);	
			stationBlob.setPosition( stationBlob.getPosition() + Vec2f(-4.0f, -4.0f) );
			stationBlob.server_setTeamNum(255);
			stationBlob.getSprite().SetFrame( Block::STATION );
			stationBlob.AddScript("Station.as"); 
		}
		else if (pixel == color_ministation) 
		{
			map.SetTile(offset, CMap::grass_inland );		
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
			
			CBlob@ ministationBlob = spawnBlob( map, "block", offset, 10, false);	
			ministationBlob.setPosition( ministationBlob.getPosition() );
			ministationBlob.server_setTeamNum(255);
			ministationBlob.getSprite().SetFrame( Block::MINISTATION );
			ministationBlob.AddScript("MiniStation.as"); 
		}
		else if (pixel == color_palmtree) 
		{
			map.SetTile(offset, CMap::grass_inland + map_random.NextRanged(5) );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
			
			CBlob@ palmtreeBlob = spawnBlob( map, "palmtree", offset, 10, false);	
			palmtreeBlob.setPosition( palmtreeBlob.getPosition() );
			palmtreeBlob.AddScript("Palmtree.as"); 
		}	
		else if (pixel == color_sand) 
		{
			//SAND AND SHOAL BORDERS
			//completely surrrounded island
			if 		( pixel_R == color_shoal && pixel_U == color_shoal && pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_shoal && pixel_U == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_peninsula_R1 );
			else if ( pixel_R == color_shoal && pixel_U == color_shoal && pixel_L == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_peninsula_U1 );
			else if ( pixel_U == color_shoal && pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_peninsula_L1 );
			else if ( pixel_L == color_shoal && pixel_D == color_shoal && pixel_R == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal
						&& pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_T_R1 );
			else if ( pixel_U == color_shoal && pixel_RD == color_shoal && pixel_LD == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_T_U1 );
			else if ( pixel_RU == color_shoal && pixel_L == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_T_L1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_shoal && pixel_LU == color_shoal
						&& pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleL_R1 );
			else if ( pixel_U == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleL_U1 );
			else if ( pixel_L == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleL_L1 );
			else if ( pixel_RU == color_shoal && pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_shoal && pixel_LD == color_shoal 
						&& pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleR_R1 );
			else if ( pixel_U == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleR_U1 );
			else if ( pixel_RU == color_shoal && pixel_L == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleR_L1 );
			else if ( pixel_LU == color_shoal && pixel_D == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_split_RU1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_split_LU1 );
			else if ( pixel_LU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_split_LD1 );
			else if ( pixel_RU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_choke_R1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_choke_U1 );
			else if ( pixel_LU == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_choke_L1 );
			else if ( pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_strip_H1 );
			else if ( pixel_R == color_shoal && pixel_L == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_shoal && pixel_RU == color_shoal && pixel_U == color_shoal && pixel_LD == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_bend_RU1 );
			else if ( pixel_L == color_shoal && pixel_LU == color_shoal && pixel_U == color_shoal && pixel_RD == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_bend_LU1 );
			else if ( pixel_L == color_shoal && pixel_LD == color_shoal && pixel_D == color_shoal && pixel_RU == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_bend_LD1 );
			else if ( pixel_R == color_shoal && pixel_RD == color_shoal && pixel_D == color_shoal && pixel_LU == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_shoal && pixel_LD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_diagonal_R1 );	
			else if ( pixel_LU == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_shoal 
						&& pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_straight_R1 );	
			else if ( pixel_U == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_straight_U1 );	
			else if ( pixel_L == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_straight_L1 );	
			else if ( pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_shoal && pixel_U == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_convex_RU1 );
			else if ( pixel_L == color_shoal && pixel_U == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_convex_LU1 );
			else if ( pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_convex_LD1 );
			else if ( pixel_R == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_concave_RU1 );	
			else if ( pixel_LU == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_concave_LU1 );	
			else if ( pixel_LD == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_concave_LD1 );	
			else if ( pixel_RD == color_shoal )
				map.SetTile(offset, CMap::sand_shoal_border_concave_RD1 );
		
			//SAND SHORES
			//completely surrrounded island
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_peninsula_R1 );
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::sand_shore_peninsula_U1 );
			else if ( pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_peninsula_L1 );
			else if ( pixel_L == color_water && pixel_D == color_water && pixel_R == color_water )
				map.SetTile(offset, CMap::sand_shore_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_water && pixel_LU == color_water && pixel_LD == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_T_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_T_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_T_L1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::sand_shore_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_water && pixel_LU == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleL_R1 );
			else if ( pixel_U == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleL_U1 );
			else if ( pixel_L == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleL_L1 );
			else if ( pixel_RU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_water && pixel_LD == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleR_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleR_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleR_L1 );
			else if ( pixel_LU == color_water && pixel_D == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::sand_shore_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_split_RU1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_split_LU1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_split_LD1 );
			else if ( pixel_RU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_choke_R1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_choke_U1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_choke_L1 );
			else if ( pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_strip_H1 );
			else if ( pixel_R == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::sand_shore_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_water && pixel_RU == color_water && pixel_U == color_water && pixel_LD == color_water )
				map.SetTile(offset, CMap::sand_shore_bend_RU1 );
			else if ( pixel_L == color_water && pixel_LU == color_water && pixel_U == color_water && pixel_RD == color_water )
				map.SetTile(offset, CMap::sand_shore_bend_LU1 );
			else if ( pixel_L == color_water && pixel_LD == color_water && pixel_D == color_water && pixel_RU == color_water )
				map.SetTile(offset, CMap::sand_shore_bend_LD1 );
			else if ( pixel_R == color_water && pixel_RD == color_water && pixel_D == color_water && pixel_LU == color_water )
				map.SetTile(offset, CMap::sand_shore_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_diagonal_R1 );	
			else if ( pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::sand_shore_straight_R1 );	
			else if ( pixel_U == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_straight_U1 );	
			else if ( pixel_L == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::sand_shore_straight_L1 );	
			else if ( pixel_D == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::sand_shore_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::sand_shore_convex_RU1 );
			else if ( pixel_L == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::sand_shore_convex_LU1 );
			else if ( pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_convex_LD1 );
			else if ( pixel_R == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::sand_shore_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_water )
				map.SetTile(offset, CMap::sand_shore_concave_RU1 );	
			else if ( pixel_LU == color_water )
				map.SetTile(offset, CMap::sand_shore_concave_LU1 );	
			else if ( pixel_LD == color_water )
				map.SetTile(offset, CMap::sand_shore_concave_LD1 );	
			else if ( pixel_RD == color_water )
				map.SetTile(offset, CMap::sand_shore_concave_RD1 );
			else
				map.SetTile(offset, CMap::sand_inland + map_random.NextRanged(5) );	
			
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
		}
		else if (pixel == color_grass) 
		{
			//grass SURROUNDED BY SAND
			//completely surrrounded island
			if 		( pixel_R == color_sand && pixel_U == color_sand && pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_sand && pixel_U == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_peninsula_R1 );
			else if ( pixel_R == color_sand && pixel_U == color_sand && pixel_L == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_peninsula_U1 );
			else if ( pixel_U == color_sand && pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_peninsula_L1 );
			else if ( pixel_L == color_sand && pixel_D == color_sand && pixel_R == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_sand && pixel_LU == color_sand && pixel_LD == color_sand
						&& pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_T_R1 );
			else if ( pixel_U == color_sand && pixel_RD == color_sand && pixel_LD == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_T_U1 );
			else if ( pixel_RU == color_sand && pixel_L == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_T_L1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_D == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_sand && pixel_LU == color_sand
						&& pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleL_R1 );
			else if ( pixel_U == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleL_U1 );
			else if ( pixel_L == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleL_L1 );
			else if ( pixel_RU == color_sand && pixel_D == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_sand && pixel_LD == color_sand 
						&& pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleR_R1 );
			else if ( pixel_U == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleR_U1 );
			else if ( pixel_RU == color_sand && pixel_L == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleR_L1 );
			else if ( pixel_LU == color_sand && pixel_D == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_split_RU1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_split_LU1 );
			else if ( pixel_LU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_split_LD1 );
			else if ( pixel_RU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_choke_R1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_choke_U1 );
			else if ( pixel_LU == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_choke_L1 );
			else if ( pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_strip_H1 );
			else if ( pixel_R == color_sand && pixel_L == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_sand && pixel_RU == color_sand && pixel_U == color_sand && pixel_LD == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_bend_RU1 );
			else if ( pixel_L == color_sand && pixel_LU == color_sand && pixel_U == color_sand && pixel_RD == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_bend_LU1 );
			else if ( pixel_L == color_sand && pixel_LD == color_sand && pixel_D == color_sand && pixel_RU == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_bend_LD1 );
			else if ( pixel_R == color_sand && pixel_RD == color_sand && pixel_D == color_sand && pixel_LU == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_sand && pixel_LD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_diagonal_R1 );	
			else if ( pixel_LU == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_sand 
						&& pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_straight_R1 );	
			else if ( pixel_U == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_straight_U1 );	
			else if ( pixel_L == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_straight_L1 );	
			else if ( pixel_D == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::grass_sand_border_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_sand && pixel_U == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_convex_RU1 );
			else if ( pixel_L == color_sand && pixel_U == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_convex_LU1 );
			else if ( pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_convex_LD1 );
			else if ( pixel_R == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_concave_RU1 );	
			else if ( pixel_LU == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_concave_LU1 );	
			else if ( pixel_LD == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_concave_LD1 );	
			else if ( pixel_RD == color_sand )
				map.SetTile(offset, CMap::grass_sand_border_concave_RD1 );		
				

			else
			map.SetTile(offset, CMap::grass_inland + 1 + map_random.NextRanged(4) );
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
		}	
		else if (pixel == color_rock) 
		{
			//ROCK SURROUNDED BY SAND
			//completely surrrounded island
			if 		( pixel_R == color_sand && pixel_U == color_sand && pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_sand && pixel_U == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_peninsula_R1 );
			else if ( pixel_R == color_sand && pixel_U == color_sand && pixel_L == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_peninsula_U1 );
			else if ( pixel_U == color_sand && pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_peninsula_L1 );
			else if ( pixel_L == color_sand && pixel_D == color_sand && pixel_R == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_sand && pixel_LU == color_sand && pixel_LD == color_sand
						&& pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_T_R1 );
			else if ( pixel_U == color_sand && pixel_RD == color_sand && pixel_LD == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_T_U1 );
			else if ( pixel_RU == color_sand && pixel_L == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_T_L1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_D == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_sand && pixel_LU == color_sand
						&& pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleL_R1 );
			else if ( pixel_U == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleL_U1 );
			else if ( pixel_L == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleL_L1 );
			else if ( pixel_RU == color_sand && pixel_D == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_sand && pixel_LD == color_sand 
						&& pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleR_R1 );
			else if ( pixel_U == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleR_U1 );
			else if ( pixel_RU == color_sand && pixel_L == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleR_L1 );
			else if ( pixel_LU == color_sand && pixel_D == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_split_RU1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_split_LU1 );
			else if ( pixel_LU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_split_LD1 );
			else if ( pixel_RU == color_sand && pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_choke_R1 );
			else if ( pixel_RU == color_sand && pixel_LU == color_sand 
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_choke_U1 );
			else if ( pixel_LU == color_sand && pixel_LD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_choke_L1 );
			else if ( pixel_LD == color_sand && pixel_RD == color_sand 
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_strip_H1 );
			else if ( pixel_R == color_sand && pixel_L == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_sand && pixel_RU == color_sand && pixel_U == color_sand && pixel_LD == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_bend_RU1 );
			else if ( pixel_L == color_sand && pixel_LU == color_sand && pixel_U == color_sand && pixel_RD == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_bend_LU1 );
			else if ( pixel_L == color_sand && pixel_LD == color_sand && pixel_D == color_sand && pixel_RU == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_bend_LD1 );
			else if ( pixel_R == color_sand && pixel_RD == color_sand && pixel_D == color_sand && pixel_LU == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_sand && pixel_LD == color_sand
						&& pixel_R != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_diagonal_R1 );	
			else if ( pixel_LU == color_sand && pixel_RD == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_sand 
						&& pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_straight_R1 );	
			else if ( pixel_U == color_sand
						&& pixel_R != color_sand && pixel_L != color_sand && pixel_LD != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_straight_U1 );	
			else if ( pixel_L == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_D != color_sand && pixel_RD != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_straight_L1 );	
			else if ( pixel_D == color_sand
						&& pixel_R != color_sand && pixel_RU != color_sand && pixel_U != color_sand && pixel_LU != color_sand && pixel_L != color_sand )
				map.SetTile(offset, CMap::rock_sand_border_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_sand && pixel_U == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_convex_RU1 );
			else if ( pixel_L == color_sand && pixel_U == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_convex_LU1 );
			else if ( pixel_L == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_convex_LD1 );
			else if ( pixel_R == color_sand && pixel_D == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_concave_RU1 );	
			else if ( pixel_LU == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_concave_LU1 );	
			else if ( pixel_LD == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_concave_LD1 );	
			else if ( pixel_RD == color_sand )
				map.SetTile(offset, CMap::rock_sand_border_concave_RD1 );		
				
			//ROCK SURROUNDED BY SHOAL
			//completely surrrounded island
			else if ( pixel_R == color_shoal && pixel_U == color_shoal && pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_shoal && pixel_U == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_peninsula_R1 );
			else if ( pixel_R == color_shoal && pixel_U == color_shoal && pixel_L == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_peninsula_U1 );
			else if ( pixel_U == color_shoal && pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_peninsula_L1 );
			else if ( pixel_L == color_shoal && pixel_D == color_shoal && pixel_R == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal
						&& pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_T_R1 );
			else if ( pixel_U == color_shoal && pixel_RD == color_shoal && pixel_LD == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_T_U1 );
			else if ( pixel_RU == color_shoal && pixel_L == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_T_L1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_shoal && pixel_LU == color_shoal
						&& pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleL_R1 );
			else if ( pixel_U == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleL_U1 );
			else if ( pixel_L == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleL_L1 );
			else if ( pixel_RU == color_shoal && pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_shoal && pixel_LD == color_shoal 
						&& pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleR_R1 );
			else if ( pixel_U == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleR_U1 );
			else if ( pixel_RU == color_shoal && pixel_L == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleR_L1 );
			else if ( pixel_LU == color_shoal && pixel_D == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_split_RU1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_split_LU1 );
			else if ( pixel_LU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_split_LD1 );
			else if ( pixel_RU == color_shoal && pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_choke_R1 );
			else if ( pixel_RU == color_shoal && pixel_LU == color_shoal 
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_choke_U1 );
			else if ( pixel_LU == color_shoal && pixel_LD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_choke_L1 );
			else if ( pixel_LD == color_shoal && pixel_RD == color_shoal 
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_strip_H1 );
			else if ( pixel_R == color_shoal && pixel_L == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_shoal && pixel_RU == color_shoal && pixel_U == color_shoal && pixel_LD == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_bend_RU1 );
			else if ( pixel_L == color_shoal && pixel_LU == color_shoal && pixel_U == color_shoal && pixel_RD == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_bend_LU1 );
			else if ( pixel_L == color_shoal && pixel_LD == color_shoal && pixel_D == color_shoal && pixel_RU == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_bend_LD1 );
			else if ( pixel_R == color_shoal && pixel_RD == color_shoal && pixel_D == color_shoal && pixel_LU == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_shoal && pixel_LD == color_shoal
						&& pixel_R != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_diagonal_R1 );	
			else if ( pixel_LU == color_shoal && pixel_RD == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_shoal 
						&& pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_straight_R1 );	
			else if ( pixel_U == color_shoal
						&& pixel_R != color_shoal && pixel_L != color_shoal && pixel_LD != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_straight_U1 );	
			else if ( pixel_L == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_D != color_shoal && pixel_RD != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_straight_L1 );	
			else if ( pixel_D == color_shoal
						&& pixel_R != color_shoal && pixel_RU != color_shoal && pixel_U != color_shoal && pixel_LU != color_shoal && pixel_L != color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_shoal && pixel_U == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_convex_RU1 );
			else if ( pixel_L == color_shoal && pixel_U == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_convex_LU1 );
			else if ( pixel_L == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_convex_LD1 );
			else if ( pixel_R == color_shoal && pixel_D == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_concave_RU1 );	
			else if ( pixel_LU == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_concave_LU1 );	
			else if ( pixel_LD == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_concave_LD1 );	
			else if ( pixel_RD == color_shoal )
				map.SetTile(offset, CMap::rock_shoal_border_concave_RD1 );
		
			//ROCK SURROUNDED BY WATER
			//completely surrrounded island
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_peninsula_R1 );
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::rock_shore_peninsula_U1 );
			else if ( pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_peninsula_L1 );
			else if ( pixel_L == color_water && pixel_D == color_water && pixel_R == color_water )
				map.SetTile(offset, CMap::rock_shore_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_water && pixel_LU == color_water && pixel_LD == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_T_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_T_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_T_L1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::rock_shore_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_water && pixel_LU == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleL_R1 );
			else if ( pixel_U == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleL_U1 );
			else if ( pixel_L == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleL_L1 );
			else if ( pixel_RU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_water && pixel_LD == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleR_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleR_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleR_L1 );
			else if ( pixel_LU == color_water && pixel_D == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::rock_shore_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_split_RU1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_split_LU1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_split_LD1 );
			else if ( pixel_RU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_choke_R1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_choke_U1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_choke_L1 );
			else if ( pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_strip_H1 );
			else if ( pixel_R == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::rock_shore_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_water && pixel_RU == color_water && pixel_U == color_water && pixel_LD == color_water )
				map.SetTile(offset, CMap::rock_shore_bend_RU1 );
			else if ( pixel_L == color_water && pixel_LU == color_water && pixel_U == color_water && pixel_RD == color_water )
				map.SetTile(offset, CMap::rock_shore_bend_LU1 );
			else if ( pixel_L == color_water && pixel_LD == color_water && pixel_D == color_water && pixel_RU == color_water )
				map.SetTile(offset, CMap::rock_shore_bend_LD1 );
			else if ( pixel_R == color_water && pixel_RD == color_water && pixel_D == color_water && pixel_LU == color_water )
				map.SetTile(offset, CMap::rock_shore_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_diagonal_R1 );	
			else if ( pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::rock_shore_straight_R1 );	
			else if ( pixel_U == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_straight_U1 );	
			else if ( pixel_L == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::rock_shore_straight_L1 );	
			else if ( pixel_D == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::rock_shore_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::rock_shore_convex_RU1 );
			else if ( pixel_L == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::rock_shore_convex_LU1 );
			else if ( pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_convex_LD1 );
			else if ( pixel_R == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::rock_shore_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_water )
				map.SetTile(offset, CMap::rock_shore_concave_RU1 );	
			else if ( pixel_LU == color_water )
				map.SetTile(offset, CMap::rock_shore_concave_LU1 );	
			else if ( pixel_LD == color_water )
				map.SetTile(offset, CMap::rock_shore_concave_LD1 );	
			else if ( pixel_RD == color_water )
				map.SetTile(offset, CMap::rock_shore_concave_RD1 );
			else
				map.SetTile(offset, CMap::rock_inland + map_random.NextRanged(5) );	
			
			map.AddTileFlag( offset, Tile::SOLID );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
		}
		else if (pixel == color_shoal) 
		{
			//completely surrrounded island
			if 		( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_island1 );
				
			//four way crossing
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_cross1 );		
		
			//peninsula shorelines
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_peninsula_R1 );
			else if ( pixel_R == color_water && pixel_U == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::shoal_shore_peninsula_U1 );
			else if ( pixel_U == color_water && pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_peninsula_L1 );
			else if ( pixel_L == color_water && pixel_D == color_water && pixel_R == color_water )
				map.SetTile(offset, CMap::shoal_shore_peninsula_D1 );
				
			//three way T crossings
			else if ( pixel_R == color_water && pixel_LU == color_water && pixel_LD == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_T_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_T_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_T_L1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::shoal_shore_T_D1 );
				
			//left handed panhandle
			else if ( pixel_R == color_water && pixel_LU == color_water
						&& pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleL_R1 );
			else if ( pixel_U == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleL_U1 );
			else if ( pixel_L == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleL_L1 );
			else if ( pixel_RU == color_water && pixel_D == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleL_D1 );
				
			//right handed panhandle
			else if ( pixel_R == color_water && pixel_LD == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleR_R1 );
			else if ( pixel_U == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleR_U1 );
			else if ( pixel_RU == color_water && pixel_L == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleR_L1 );
			else if ( pixel_LU == color_water && pixel_D == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::shoal_shore_panhandleR_D1 );
				
			//splitting strips
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_split_RU1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_split_LU1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_split_LD1 );
			else if ( pixel_RU == color_water && pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_split_RD1 );
				
			//choke points
			else if ( pixel_RU == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_choke_R1 );
			else if ( pixel_RU == color_water && pixel_LU == color_water 
						&& pixel_R != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_choke_U1 );
			else if ( pixel_LU == color_water && pixel_LD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_choke_L1 );
			else if ( pixel_LD == color_water && pixel_RD == color_water 
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_choke_D1 );
				
			//strip shorelines
			else if (pixel_U == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_strip_H1 );
			else if ( pixel_R == color_water && pixel_L == color_water )
				map.SetTile(offset, CMap::shoal_shore_strip_V1 );	

			//bend shorelines
			else if ( pixel_R == color_water && pixel_RU == color_water && pixel_U == color_water && pixel_LD == color_water )
				map.SetTile(offset, CMap::shoal_shore_bend_RU1 );
			else if ( pixel_L == color_water && pixel_LU == color_water && pixel_U == color_water && pixel_RD == color_water )
				map.SetTile(offset, CMap::shoal_shore_bend_LU1 );
			else if ( pixel_L == color_water && pixel_LD == color_water && pixel_D == color_water && pixel_RU == color_water )
				map.SetTile(offset, CMap::shoal_shore_bend_LD1 );
			else if ( pixel_R == color_water && pixel_RD == color_water && pixel_D == color_water && pixel_LU == color_water )
				map.SetTile(offset, CMap::shoal_shore_bend_RD1 );		

			//diagonal choke points
			else if ( pixel_RU == color_water && pixel_LD == color_water
						&& pixel_R != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_diagonal_R1 );	
			else if ( pixel_LU == color_water && pixel_RD == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_diagonal_L1 );				

			//straight edge shorelines
			else if ( pixel_R == color_water 
						&& pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water )
				map.SetTile(offset, CMap::shoal_shore_straight_R1 );	
			else if ( pixel_U == color_water
						&& pixel_R != color_water && pixel_L != color_water && pixel_LD != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_straight_U1 );	
			else if ( pixel_L == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_D != color_water && pixel_RD != color_water )
				map.SetTile(offset, CMap::shoal_shore_straight_L1 );	
			else if ( pixel_D == color_water
						&& pixel_R != color_water && pixel_RU != color_water && pixel_U != color_water && pixel_LU != color_water && pixel_L != color_water )
				map.SetTile(offset, CMap::shoal_shore_straight_D1 );	
				
			//convex shorelines
			else if ( pixel_R == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::shoal_shore_convex_RU1 );
			else if ( pixel_L == color_water && pixel_U == color_water )
				map.SetTile(offset, CMap::shoal_shore_convex_LU1 );
			else if ( pixel_L == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_convex_LD1 );
			else if ( pixel_R == color_water && pixel_D == color_water )
				map.SetTile(offset, CMap::shoal_shore_convex_RD1 );
				
			//concave shorelines		
			else if ( pixel_RU == color_water )
				map.SetTile(offset, CMap::shoal_shore_concave_RU1 );	
			else if ( pixel_LU == color_water )
				map.SetTile(offset, CMap::shoal_shore_concave_LU1 );	
			else if ( pixel_LD == color_water )
				map.SetTile(offset, CMap::shoal_shore_concave_LD1 );	
			else if ( pixel_RD == color_water )
				map.SetTile(offset, CMap::shoal_shore_concave_RD1 );		
			else
				map.SetTile(offset, CMap::shoal_inland + map_random.NextRanged(5) );	
			
			map.AddTileFlag( offset, Tile::BACKGROUND );
			map.AddTileFlag( offset, Tile::LIGHT_PASSES );
		}
	}
}
