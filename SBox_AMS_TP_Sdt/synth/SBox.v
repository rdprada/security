//
// Verilog description for cell sbox, 
// Mon Dec 18 09:33:15 2017
//
// LeonardoSpectrum Level 3, 2010a.7 
//


module sbox ( m, k, c, clk, rst ) ;

    input [7:0]m ;
    input [7:0]k ;
    output [7:0]c ;
    input clk ;
    input rst ;

    wire nx0, nx2, nx4, nx6, nx8, nx12, nx14, nx16, nx22, nx24, nx26, nx28, nx32, 
         nx38, nx42, nx44, nx50, nx56, nx58, nx60, nx62, nx64, nx68, nx74, nx78, 
         nx80, nx86, nx92, nx94, nx96, nx100, nx106, nx108, nx114, nx120, nx126, 
         nx130, nx132, nx136, nx146, nx150, nx152, nx162, nx166, nx170, nx174, 
         nx178, nx184, nx190, nx198, nx200, nx208, nx214, nx218, nx222, nx226, 
         nx228, nx230, nx234, nx244, nx248, nx252, nx254, nx256, nx260, nx262, 
         nx264, nx266, nx270, nx278, nx280, nx284, nx290, nx294, nx298, nx302, 
         nx310, nx316, nx320, nx326, nx330, nx332, nx336, nx340, nx344, nx350, 
         nx354, nx362, nx364, nx366, nx376, nx378, nx380, nx384, nx388, nx392, 
         nx394, nx398, nx402, nx406, nx408, nx416, nx420, nx422, nx426, nx430, 
         nx432, nx434, nx436, nx440, nx446, nx450, nx452, nx458, nx464, nx470, 
         nx472, nx474, nx478, nx482, nx486, nx488, nx492, nx498, nx500, nx504, 
         nx508, nx510, nx514, nx516, nx522, nx526, nx530, nx532, nx536, nx546, 
         nx550, nx552, nx556, nx558, nx560, nx568, nx574, nx576, nx578, nx582, 
         nx592, nx600, nx604, nx606, nx610, nx614, nx616, nx618, nx620, nx622, 
         nx628, nx634, nx636, nx642, nx644, nx648, nx654, nx656, nx658, nx662, 
         nx666, nx670, nx672, nx678, nx680, nx682, nx684, nx690, nx696, nx700, 
         nx710, nx712, nx716, nx720, nx728, nx730, nx732, nx736, nx742, nx744, 
         nx752, nx754, nx756, nx758, nx764, nx768, nx774, nx782, nx786, nx788, 
         nx792, nx794, nx802, nx806, nx820, nx824, nx830, nx840, nx850, nx856, 
         nx868, nx874, nx882, nx888, nx896, nx908, nx912, nx920, nx924, nx928, 
         nx932, nx940, nx944, nx948, nx950, nx956, nx958, nx962, nx966, nx970, 
         nx976, nx984, nx986, nx990, nx998, nx1004, nx1012, nx1014, nx1018, 
         nx1026, nx1034, nx1038, nx1040, nx1048, nx1052, nx1054, nx1060, nx1066, 
         nx1072, nx1074, nx1076, nx1078, nx1088, nx1092, nx1100, nx1102, nx1104, 
         nx1110, nx1112, nx1116, nx1120, nx1124, nx1126, nx1128, nx1130, nx1136, 
         nx1144, nx1146, nx1148, nx1152, nx1156, nx1162, nx1164, nx1172, nx1176, 
         nx1178, nx1184, nx1188, nx1212, nx1224, nx1246, nx1248, nx1252, nx1256, 
         nx1260, nx1266, nx1270, nx1272, nx1278, nx1286, nx1296, nx1302, nx1306, 
         nx1310, nx1312, nx1322, nx1326, nx1330, nx1340, nx1346, nx1350, nx1354, 
         nx1368, nx1372, nx1374, nx1380, nx1384, nx1388, nx1398, nx1402, nx1406, 
         nx1412, nx1422, nx1426, nx1432, nx1438, nx1440, nx1446, nx1450, nx1456, 
         nx1462, nx1468, nx1472, nx1478, nx1498, nx1506, nx1522, nx1528, nx1532, 
         nx1536, nx1542, nx1548, nx1560, nx1564, nx1574, nx1578, nx1586, nx1590, 
         nx1596, nx1600, nx1610, nx1624, nx1632, nx1644, nx1650, nx1656, nx1670, 
         nx1684, nx1694, nx1704, nx1708, nx1710, nx1720, nx1722, nx1726, nx1738, 
         nx1750, nx1756, nx1760, nx1770, nx1774, nx1778, nx1796, nx1806, nx1812, 
         nx1830, nx1834, nx1840, nx1842, nx1854, nx1860, nx1868, nx1870, nx1874, 
         nx1888, nx1892, nx1902, nx1908, nx1920, nx1926, nx1934, nx1944, nx1946, 
         nx1954, nx1966, nx1968, nx1980, nx1986, nx1990, nx2004, nx2012, nx2028, 
         nx2032, nx2054, nx2068, nx2072, nx2076, nx2100, nx2104, nx2122, nx2130, 
         nx2136, nx2140, nx2148, nx2154, nx2178, nx2182, nx2192, nx2196, nx2220, 
         nx2232, nx2242, nx2246, nx2248, nx2266, nx2276, nx2280, nx2288, nx2304, 
         nx2314, nx2318, nx2320, nx2340, nx2352, nx2356, nx2372, nx2382, nx2408, 
         nx2410, nx2440, nx2444, nx2474, nx2504, nx2508, nx17421, nx17424, 
         nx17427, nx17430, nx17432, nx17442, nx17444, nx17455, nx17457, nx17460, 
         nx17463, nx17465, nx17467, nx17469, nx17472, nx17475, nx17478, nx17480, 
         nx17483, nx17490, nx17496, nx17500, nx17502, nx17508, nx17515, nx17518, 
         nx17520, nx17523, nx17526, nx17529, nx17532, nx17536, nx17539, nx17543, 
         nx17547, nx17550, nx17553, nx17555, nx17558, nx17561, nx17564, nx17571, 
         nx17574, nx17586, nx17589, nx17596, nx17599, nx17602, nx17606, nx17609, 
         nx17612, nx17615, nx17618, nx17622, nx17626, nx17629, nx17632, nx17635, 
         nx17637, nx17640, nx17643, nx17647, nx17650, nx17654, nx17657, nx17660, 
         nx17673, nx17675, nx17678, nx17682, nx17685, nx17688, nx17692, nx17695, 
         nx17698, nx17701, nx17704, nx17707, nx17710, nx17712, nx17715, nx17721, 
         nx17723, nx17726, nx17730, nx17737, nx17745, nx17747, nx17751, nx17753, 
         nx17756, nx17758, nx17761, nx17763, nx17767, nx17770, nx17775, nx17779, 
         nx17781, nx17784, nx17787, nx17790, nx17793, nx17796, nx17802, nx17805, 
         nx17808, nx17810, nx17814, nx17818, nx17820, nx17823, nx17828, nx17831, 
         nx17835, nx17837, nx17841, nx17843, nx17845, nx17848, nx17851, nx17853, 
         nx17857, nx17859, nx17863, nx17865, nx17868, nx17871, nx17874, nx17876, 
         nx17879, nx17881, nx17884, nx17887, nx17893, nx17898, nx17901, nx17904, 
         nx17907, nx17911, nx17914, nx17919, nx17921, nx17923, nx17927, nx17930, 
         nx17933, nx17936, nx17939, nx17942, nx17950, nx17958, nx17961, nx17964, 
         nx17966, nx17972, nx17976, nx17978, nx17982, nx17985, nx17990, nx17993, 
         nx17995, nx17998, nx18001, nx18005, nx18007, nx18009, nx18012, nx18014, 
         nx18019, nx18022, nx18025, nx18027, nx18030, nx18032, nx18034, nx18036, 
         nx18040, nx18044, nx18047, nx18050, nx18054, nx18057, nx18060, nx18062, 
         nx18065, nx18067, nx18072, nx18075, nx18077, nx18080, nx18085, nx18089, 
         nx18091, nx18095, nx18098, nx18103, nx18105, nx18110, nx18113, nx18116, 
         nx18120, nx18122, nx18124, nx18128, nx18131, nx18134, nx18139, nx18141, 
         nx18144, nx18148, nx18151, nx18153, nx18158, nx18162, nx18164, nx18167, 
         nx18170, nx18173, nx18176, nx18178, nx18183, nx18186, nx18188, nx18193, 
         nx18196, nx18198, nx18204, nx18206, nx18209, nx18212, nx18214, nx18217, 
         nx18224, nx18228, nx18233, nx18235, nx18239, nx18241, nx18244, nx18247, 
         nx18250, nx18255, nx18260, nx18263, nx18266, nx18272, nx18277, nx18280, 
         nx18282, nx18287, nx18290, nx18293, nx18295, nx18300, nx18303, nx18306, 
         nx18308, nx18311, nx18314, nx18316, nx18319, nx18322, nx18324, nx18329, 
         nx18331, nx18334, nx18337, nx18339, nx18342, nx18345, nx18347, nx18351, 
         nx18353, nx18356, nx18359, nx18361, nx18365, nx18369, nx18372, nx18375, 
         nx18379, nx18381, nx18384, nx18387, nx18389, nx18392, nx18396, nx18401, 
         nx18403, nx18407, nx18409, nx18414, nx18417, nx18420, nx18423, nx18427, 
         nx18430, nx18432, nx18437, nx18440, nx18443, nx18446, nx18449, nx18452, 
         nx18455, nx18459, nx18462, nx18465, nx18468, nx18471, nx18473, nx18476, 
         nx18478, nx18486, nx18489, nx18492, nx18495, nx18499, nx18503, nx18508, 
         nx18513, nx18516, nx18525, nx18528, nx18530, nx18535, nx18541, nx18545, 
         nx18548, nx18550, nx18555, nx18557, nx18560, nx18563, nx18565, nx18568, 
         nx18571, nx18574, nx18582, nx18586, nx18589, nx18592, nx18595, nx18600, 
         nx18607, nx18610, nx18613, nx18615, nx18617, nx18621, nx18626, nx18629, 
         nx18632, nx18635, nx18637, nx18640, nx18643, nx18646, nx18648, nx18650, 
         nx18654, nx18658, nx18660, nx18663, nx18666, nx18671, nx18675, nx18679, 
         nx18682, nx18686, nx18689, nx18691, nx18694, nx18698, nx18700, nx18707, 
         nx18710, nx18713, nx18715, nx18717, nx18721, nx18725, nx18728, nx18730, 
         nx18734, nx18737, nx18740, nx18742, nx18749, nx18751, nx18753, nx18760, 
         nx18764, nx17446, nx18787;
    wire [7:0] \$dummy ;




    DFC1 reg_reg_0 (.Q (c[0]), .QN (\$dummy [0]), .C (clk), .D (nx806), .RN (
         nx17893)) ;
    CLKIN1 ix807 (.Q (nx806), .A (nx17421)) ;
    NOR40 ix17422 (.Q (nx17421), .A (nx802), .B (nx690), .C (nx568), .D (nx392)
          ) ;
    NAND41 ix803 (.Q (nx802), .A (nx17424), .B (nx17480), .C (nx17526), .D (
           nx17555)) ;
    NOR40 ix17425 (.Q (nx17424), .A (nx794), .B (nx792), .C (nx788), .D (nx786)
          ) ;
    NAND21 ix17431 (.Q (nx17430), .A (nx17432), .B (nx8)) ;
    XNR21 ix17433 (.Q (nx17432), .A (m[0]), .B (k[0])) ;
    NAND22 ix17443 (.Q (nx17442), .A (nx17444), .B (nx18787)) ;
    XNR22 ix17445 (.Q (nx17444), .A (m[6]), .B (k[6])) ;
    NAND21 ix17456 (.Q (nx17455), .A (nx14), .B (nx17457)) ;
    XNR21 ix17458 (.Q (nx17457), .A (m[3]), .B (k[3])) ;
    NOR21 ix789 (.Q (nx788), .A (nx17460), .B (nx17442)) ;
    NAND21 ix17461 (.Q (nx17460), .A (nx364), .B (nx32)) ;
    NOR21 ix365 (.Q (nx364), .A (nx17463), .B (nx17467)) ;
    NAND21 ix17464 (.Q (nx17463), .A (nx17432), .B (nx17465)) ;
    XNR21 ix17466 (.Q (nx17465), .A (m[1]), .B (k[1])) ;
    NAND21 ix17468 (.Q (nx17467), .A (nx17469), .B (nx16)) ;
    XNR21 ix17470 (.Q (nx17469), .A (m[2]), .B (k[2])) ;
    NOR21 ix33 (.Q (nx32), .A (nx17472), .B (nx28)) ;
    XNR21 ix17473 (.Q (nx17472), .A (m[4]), .B (k[4])) ;
    NOR21 ix787 (.Q (nx786), .A (nx17475), .B (nx17442)) ;
    NAND21 ix17476 (.Q (nx17475), .A (nx24), .B (nx32)) ;
    NOR21 ix25 (.Q (nx24), .A (nx17430), .B (nx17478)) ;
    NAND21 ix17479 (.Q (nx17478), .A (nx17469), .B (nx17457)) ;
    NOR40 ix17481 (.Q (nx17480), .A (nx782), .B (nx758), .C (nx754), .D (nx752)
          ) ;
    NAND21 ix783 (.Q (nx782), .A (nx17483), .B (nx17502)) ;
    AOI221 ix17484 (.Q (nx17483), .A (nx402), .B (nx146), .C (nx18787), .D (
           nx774)) ;
    NAND21 ix17491 (.Q (nx17490), .A (nx17472), .B (nx28)) ;
    NOR21 ix775 (.Q (nx774), .A (nx0), .B (nx17496)) ;
    NAND21 ix17497 (.Q (nx17496), .A (nx60), .B (nx56)) ;
    NOR21 ix61 (.Q (nx60), .A (nx17430), .B (nx17467)) ;
    XNR21 ix17501 (.Q (nx17500), .A (m[5]), .B (k[5])) ;
    NAND21 ix17509 (.Q (nx17508), .A (nx17500), .B (nx17444)) ;
    NOR21 ix755 (.Q (nx754), .A (nx17515), .B (nx17520)) ;
    NAND21 ix17516 (.Q (nx17515), .A (nx108), .B (nx56)) ;
    NOR21 ix109 (.Q (nx108), .A (nx17518), .B (nx17478)) ;
    NAND21 ix17519 (.Q (nx17518), .A (nx6), .B (nx17465)) ;
    NOR21 ix753 (.Q (nx752), .A (nx17523), .B (nx17520)) ;
    NAND21 ix17524 (.Q (nx17523), .A (nx44), .B (nx32)) ;
    NOR21 ix45 (.Q (nx44), .A (nx17518), .B (nx17467)) ;
    NOR40 ix17527 (.Q (nx17526), .A (nx744), .B (nx742), .C (nx736), .D (nx730)
          ) ;
    NAND21 ix17530 (.Q (nx17529), .A (nx17472), .B (nx17500)) ;
    NOR40 ix743 (.Q (nx742), .A (nx28), .B (nx0), .C (nx18787), .D (nx17532)) ;
    NAND21 ix17533 (.Q (nx17532), .A (nx17472), .B (nx190)) ;
    NOR21 ix191 (.Q (nx190), .A (nx17463), .B (nx17478)) ;
    NAND21 ix737 (.Q (nx736), .A (nx17536), .B (nx17543)) ;
    NAND21 ix17537 (.Q (nx17536), .A (nx618), .B (nx198)) ;
    NOR21 ix619 (.Q (nx618), .A (nx17472), .B (nx17539)) ;
    NAND21 ix17540 (.Q (nx17539), .A (nx96), .B (nx42)) ;
    NOR21 ix97 (.Q (nx96), .A (nx17432), .B (nx17465)) ;
    NOR21 ix731 (.Q (nx730), .A (nx18787), .B (nx17547)) ;
    NAND21 ix17548 (.Q (nx17547), .A (nx17444), .B (nx436)) ;
    NOR21 ix437 (.Q (nx436), .A (nx17550), .B (nx17553)) ;
    NAND21 ix17551 (.Q (nx17550), .A (nx96), .B (nx50)) ;
    NOR21 ix51 (.Q (nx50), .A (nx17469), .B (nx17457)) ;
    NOR40 ix17556 (.Q (nx17555), .A (nx720), .B (nx716), .C (nx712), .D (nx700)
          ) ;
    NOR21 ix721 (.Q (nx720), .A (nx17496), .B (nx17558)) ;
    NOR21 ix717 (.Q (nx716), .A (nx17561), .B (nx17558)) ;
    NAND21 ix17562 (.Q (nx17561), .A (nx364), .B (nx56)) ;
    NAND21 ix713 (.Q (nx712), .A (nx17564), .B (nx17571)) ;
    NOR21 ix255 (.Q (nx254), .A (nx17539), .B (nx17490)) ;
    NAND21 ix17572 (.Q (nx17571), .A (nx532), .B (nx146)) ;
    NOR21 ix533 (.Q (nx532), .A (nx17574), .B (nx17553)) ;
    NAND21 ix17575 (.Q (nx17574), .A (nx96), .B (nx22)) ;
    NAND41 ix691 (.Q (nx690), .A (nx17586), .B (nx17609), .C (nx17637), .D (
           nx17654)) ;
    NOR40 ix17587 (.Q (nx17586), .A (nx684), .B (nx672), .C (nx670), .D (nx666)
          ) ;
    NAND21 ix685 (.Q (nx684), .A (nx17589), .B (nx17596)) ;
    NOR22 ix75 (.Q (nx74), .A (nx17444), .B (nx2)) ;
    NAND21 ix17597 (.Q (nx17596), .A (nx678), .B (nx74)) ;
    NOR21 ix679 (.Q (nx678), .A (nx17599), .B (nx17553)) ;
    NAND21 ix17600 (.Q (nx17599), .A (nx96), .B (nx78)) ;
    NOR21 ix673 (.Q (nx672), .A (nx17475), .B (nx17602)) ;
    NAND22 ix17603 (.Q (nx17602), .A (nx17444), .B (nx2)) ;
    NOR21 ix671 (.Q (nx670), .A (nx17561), .B (nx17520)) ;
    NOR21 ix667 (.Q (nx666), .A (nx17606), .B (nx17520)) ;
    NAND21 ix17607 (.Q (nx17606), .A (nx162), .B (nx56)) ;
    NOR21 ix163 (.Q (nx162), .A (nx17518), .B (nx17455)) ;
    NOR40 ix17610 (.Q (nx17609), .A (nx662), .B (nx648), .C (nx644), .D (nx642)
          ) ;
    OAI211 ix663 (.Q (nx662), .A (nx17612), .B (nx17602), .C (nx17615)) ;
    NAND21 ix17613 (.Q (nx17612), .A (nx266), .B (nx56)) ;
    NOR21 ix267 (.Q (nx266), .A (nx17463), .B (nx17455)) ;
    NOR21 ix17616 (.Q (nx17615), .A (nx658), .B (nx656)) ;
    NOR21 ix657 (.Q (nx656), .A (nx17622), .B (nx17602)) ;
    NAND21 ix17623 (.Q (nx17622), .A (nx190), .B (nx62)) ;
    NOR21 ix63 (.Q (nx62), .A (nx17472), .B (nx17500)) ;
    NOR21 ix649 (.Q (nx648), .A (nx17626), .B (nx17558)) ;
    NAND21 ix17627 (.Q (nx17626), .A (nx60), .B (nx32)) ;
    NOR21 ix645 (.Q (nx644), .A (nx17629), .B (nx17558)) ;
    NAND21 ix17630 (.Q (nx17629), .A (nx17500), .B (nx126)) ;
    NOR21 ix127 (.Q (nx126), .A (nx26), .B (nx17632)) ;
    NAND21 ix17633 (.Q (nx17632), .A (nx120), .B (nx50)) ;
    NOR40 ix17638 (.Q (nx17637), .A (nx636), .B (nx622), .C (nx616), .D (nx614)
          ) ;
    NAND21 ix637 (.Q (nx636), .A (nx17640), .B (nx17643)) ;
    NAND21 ix17644 (.Q (nx17643), .A (nx100), .B (nx146)) ;
    NOR21 ix101 (.Q (nx100), .A (nx17539), .B (nx17529)) ;
    NOR21 ix623 (.Q (nx622), .A (nx17444), .B (nx17647)) ;
    NAND21 ix17648 (.Q (nx17647), .A (nx28), .B (nx618)) ;
    NOR21 ix617 (.Q (nx616), .A (nx17650), .B (nx17520)) ;
    NAND21 ix17651 (.Q (nx17650), .A (nx80), .B (nx56)) ;
    NOR21 ix81 (.Q (nx80), .A (nx17430), .B (nx17455)) ;
    NOR40 ix17655 (.Q (nx17654), .A (nx610), .B (nx582), .C (nx576), .D (nx574)
          ) ;
    NAND21 ix611 (.Q (nx610), .A (nx17657), .B (nx17660)) ;
    NAND21 ix17658 (.Q (nx17657), .A (nx350), .B (nx146)) ;
    NOR21 ix351 (.Q (nx350), .A (nx17550), .B (nx17490)) ;
    AOI211 ix583 (.Q (nx582), .A (nx17673), .B (nx17675), .C (nx17602)) ;
    NAND21 ix17674 (.Q (nx17673), .A (nx162), .B (nx92)) ;
    NAND21 ix17676 (.Q (nx17675), .A (nx266), .B (nx92)) ;
    NOR21 ix577 (.Q (nx576), .A (nx17678), .B (nx17602)) ;
    NAND21 ix17679 (.Q (nx17678), .A (nx24), .B (nx92)) ;
    NOR21 ix575 (.Q (nx574), .A (nx17675), .B (nx17520)) ;
    NAND41 ix569 (.Q (nx568), .A (nx17682), .B (nx17695), .C (nx17723), .D (
           nx17758)) ;
    NOR40 ix17683 (.Q (nx17682), .A (nx560), .B (nx558), .C (nx552), .D (nx550)
          ) ;
    NOR21 ix561 (.Q (nx560), .A (nx17602), .B (nx17685)) ;
    NOR21 ix17686 (.Q (nx17685), .A (nx100), .B (nx94)) ;
    NOR21 ix95 (.Q (nx94), .A (nx17688), .B (nx17529)) ;
    NAND21 ix17689 (.Q (nx17688), .A (nx38), .B (nx50)) ;
    NOR40 ix17696 (.Q (nx17695), .A (nx546), .B (nx536), .C (nx530), .D (nx522)
          ) ;
    NAND21 ix547 (.Q (nx546), .A (nx17698), .B (nx17704)) ;
    NAND21 ix17699 (.Q (nx17698), .A (nx298), .B (nx4)) ;
    NOR21 ix299 (.Q (nx298), .A (nx17574), .B (nx17701)) ;
    NOR22 ix5 (.Q (nx4), .A (nx17444), .B (nx18787)) ;
    NAND21 ix17705 (.Q (nx17704), .A (nx178), .B (nx218)) ;
    NOR21 ix179 (.Q (nx178), .A (nx17707), .B (nx17553)) ;
    NAND21 ix17708 (.Q (nx17707), .A (nx12), .B (nx50)) ;
    AOI211 ix537 (.Q (nx536), .A (nx17710), .B (nx17712), .C (nx17520)) ;
    NAND21 ix17713 (.Q (nx17712), .A (nx108), .B (nx32)) ;
    AOI211 ix531 (.Q (nx530), .A (nx17715), .B (nx17515), .C (nx17442)) ;
    NOR21 ix523 (.Q (nx522), .A (nx17721), .B (nx17442)) ;
    NAND21 ix17722 (.Q (nx17721), .A (nx364), .B (nx62)) ;
    NOR40 ix17724 (.Q (nx17723), .A (nx516), .B (nx492), .C (nx458), .D (nx450)
          ) ;
    NAND21 ix517 (.Q (nx516), .A (nx17726), .B (nx17730)) ;
    AOI211 ix17727 (.Q (nx17726), .A (nx510), .B (nx4), .C (nx508)) ;
    NOR21 ix511 (.Q (nx510), .A (nx17688), .B (nx17553)) ;
    NOR21 ix509 (.Q (nx508), .A (nx17606), .B (nx17558)) ;
    OAI211 ix17731 (.Q (nx17730), .A (nx500), .B (nx94), .C (nx4)) ;
    NOR21 ix501 (.Q (nx500), .A (nx17707), .B (nx17529)) ;
    NOR21 ix489 (.Q (nx488), .A (nx17737), .B (nx17442)) ;
    NAND21 ix17738 (.Q (nx17737), .A (nx17500), .B (nx482)) ;
    NOR21 ix483 (.Q (nx482), .A (nx26), .B (nx17574)) ;
    NOR21 ix479 (.Q (nx478), .A (nx17678), .B (nx17442)) ;
    OAI211 ix459 (.Q (nx458), .A (nx17745), .B (nx17558), .C (nx17747)) ;
    NAND21 ix17746 (.Q (nx17745), .A (nx44), .B (nx62)) ;
    NAND21 ix17748 (.Q (nx17747), .A (nx380), .B (nx4)) ;
    NOR21 ix381 (.Q (nx380), .A (nx17707), .B (nx17701)) ;
    OAI211 ix451 (.Q (nx450), .A (nx17751), .B (nx17558), .C (nx17753)) ;
    NAND21 ix17752 (.Q (nx17751), .A (nx108), .B (nx62)) ;
    NAND21 ix17754 (.Q (nx17753), .A (nx270), .B (nx4)) ;
    NOR21 ix271 (.Q (nx270), .A (nx17500), .B (nx17756)) ;
    NAND21 ix17757 (.Q (nx17756), .A (nx266), .B (nx26)) ;
    NOR40 ix17759 (.Q (nx17758), .A (nx440), .B (nx430), .C (nx422), .D (nx398)
          ) ;
    OAI211 ix441 (.Q (nx440), .A (nx17761), .B (nx17520), .C (nx17763)) ;
    NAND21 ix17764 (.Q (nx17763), .A (nx432), .B (nx146)) ;
    NOR21 ix433 (.Q (nx432), .A (nx17550), .B (nx17701)) ;
    AOI211 ix431 (.Q (nx430), .A (nx17767), .B (nx17635), .C (nx17442)) ;
    NAND21 ix17768 (.Q (nx17767), .A (nx162), .B (nx32)) ;
    NAND21 ix423 (.Q (nx422), .A (nx17770), .B (nx17775)) ;
    AOI211 ix17776 (.Q (nx17775), .A (nx408), .B (nx74), .C (nx406)) ;
    OAI211 ix407 (.Q (nx406), .A (nx17779), .B (nx17520), .C (nx17781)) ;
    NAND21 ix17780 (.Q (nx17779), .A (nx44), .B (nx56)) ;
    NAND21 ix17782 (.Q (nx17781), .A (nx254), .B (nx74)) ;
    NAND21 ix17788 (.Q (nx17787), .A (nx60), .B (nx92)) ;
    NAND41 ix393 (.Q (nx392), .A (nx17790), .B (nx17848), .C (nx17871), .D (
           nx17876)) ;
    NOR40 ix17791 (.Q (nx17790), .A (nx388), .B (nx320), .C (nx310), .D (nx294)
          ) ;
    NAND41 ix389 (.Q (nx388), .A (nx17793), .B (nx17796), .C (nx17802), .D (
           nx17810)) ;
    OAI211 ix17794 (.Q (nx17793), .A (nx380), .B (nx228), .C (nx74)) ;
    NOR21 ix229 (.Q (nx228), .A (nx17688), .B (nx17701)) ;
    NOR21 ix17803 (.Q (nx17802), .A (nx354), .B (nx344)) ;
    OAI221 ix355 (.Q (nx354), .A (nx17618), .B (nx17558), .C (nx17805), .D (
           nx17520)) ;
    NAND21 ix17806 (.Q (nx17805), .A (nx190), .B (nx32)) ;
    OAI211 ix345 (.Q (nx344), .A (nx17751), .B (nx17520), .C (nx17808)) ;
    NAND21 ix17809 (.Q (nx17808), .A (nx298), .B (nx74)) ;
    AOI211 ix17811 (.Q (nx17810), .A (nx332), .B (nx74), .C (nx330)) ;
    NOR21 ix333 (.Q (nx332), .A (nx17599), .B (nx17490)) ;
    NOR21 ix331 (.Q (nx330), .A (nx2), .B (nx17814)) ;
    NAND21 ix17815 (.Q (nx17814), .A (nx0), .B (nx222)) ;
    NOR21 ix223 (.Q (nx222), .A (nx17707), .B (nx17490)) ;
    OAI221 ix321 (.Q (nx320), .A (nx17818), .B (nx17442), .C (nx17820), .D (
           nx17520)) ;
    NAND21 ix17819 (.Q (nx17818), .A (nx24), .B (nx56)) ;
    NAND21 ix17821 (.Q (nx17820), .A (nx108), .B (nx92)) ;
    OAI2111 ix311 (.Q (nx310), .A (nx17678), .B (nx17558), .C (nx17823), .D (
            nx17828)) ;
    NAND21 ix17829 (.Q (nx17828), .A (nx298), .B (nx218)) ;
    NAND31 ix295 (.Q (nx294), .A (nx17831), .B (nx17843), .C (nx17845)) ;
    AOI2111 ix17832 (.Q (nx17831), .A (nx58), .B (nx218), .C (nx284), .D (nx278)
            ) ;
    NOR21 ix59 (.Q (nx58), .A (nx17688), .B (nx17490)) ;
    NAND21 ix17836 (.Q (nx17835), .A (nx162), .B (nx62)) ;
    NAND21 ix17838 (.Q (nx17837), .A (nx244), .B (nx74)) ;
    NOR21 ix245 (.Q (nx244), .A (nx17599), .B (nx17701)) ;
    OAI221 ix279 (.Q (nx278), .A (nx18787), .B (nx17841), .C (nx17835), .D (
           nx17602)) ;
    NAND21 ix17842 (.Q (nx17841), .A (nx17444), .B (nx270)) ;
    AOI221 ix17846 (.Q (nx17845), .A (nx244), .B (nx218), .C (nx248), .D (nx4)
           ) ;
    NOR21 ix249 (.Q (nx248), .A (nx17500), .B (nx17532)) ;
    NOR40 ix17849 (.Q (nx17848), .A (nx234), .B (nx226), .C (nx208), .D (nx174)
          ) ;
    AOI211 ix235 (.Q (nx234), .A (nx17851), .B (nx17853), .C (nx17442)) ;
    NAND21 ix17852 (.Q (nx17851), .A (nx24), .B (nx62)) ;
    OAI211 ix227 (.Q (nx226), .A (nx17857), .B (nx17442), .C (nx17859)) ;
    NAND21 ix17860 (.Q (nx17859), .A (nx214), .B (nx218)) ;
    NOR21 ix215 (.Q (nx214), .A (nx17550), .B (nx17529)) ;
    IMUX21 ix209 (.Q (nx208), .A (nx17863), .B (nx17865), .S (nx18787)) ;
    NAND21 ix17864 (.Q (nx17863), .A (nx0), .B (nx178)) ;
    NOR21 ix175 (.Q (nx174), .A (nx17868), .B (nx18787)) ;
    AOI221 ix17872 (.Q (nx17871), .A (nx94), .B (nx146), .C (nx150), .D (nx18787
           )) ;
    NOR31 ix151 (.Q (nx150), .A (nx17874), .B (nx17500), .C (nx0)) ;
    NAND21 ix17875 (.Q (nx17874), .A (nx26), .B (nx80)) ;
    AOI2111 ix17877 (.Q (nx17876), .A (nx4), .B (nx68), .C (nx136), .D (nx106)
            ) ;
    NAND41 ix69 (.Q (nx68), .A (nx17879), .B (nx17881), .C (nx17523), .D (
           nx17475)) ;
    NAND21 ix17880 (.Q (nx17879), .A (nx60), .B (nx62)) ;
    AOI211 ix137 (.Q (nx136), .A (nx17884), .B (nx17887), .C (nx18787)) ;
    NAND21 ix17885 (.Q (nx17884), .A (nx126), .B (nx130)) ;
    NOR21 ix131 (.Q (nx130), .A (nx17500), .B (nx0)) ;
    AOI211 ix107 (.Q (nx106), .A (nx17685), .B (nx17784), .C (nx17520)) ;
    CLKIN1 ix17894 (.Q (nx17893), .A (rst)) ;
    DFC1 reg_reg_1 (.Q (c[1]), .QN (\$dummy [1]), .C (clk), .D (nx1188), .RN (
         nx17893)) ;
    CLKIN1 ix1189 (.Q (nx1188), .A (nx17898)) ;
    NOR40 ix17899 (.Q (nx17898), .A (nx1184), .B (nx1100), .C (nx1026), .D (
          nx956)) ;
    NAND41 ix1185 (.Q (nx1184), .A (nx17901), .B (nx17911), .C (nx17923), .D (
           nx17933)) ;
    NOR40 ix17902 (.Q (nx17901), .A (nx1178), .B (nx752), .C (nx1164), .D (
          nx1162)) ;
    NAND21 ix1179 (.Q (nx1178), .A (nx17904), .B (nx17907)) ;
    NAND21 ix17905 (.Q (nx17904), .A (nx18787), .B (nx1172)) ;
    NOR21 ix1173 (.Q (nx1172), .A (nx0), .B (nx17805)) ;
    NAND21 ix17908 (.Q (nx17907), .A (nx500), .B (nx146)) ;
    NOR21 ix1165 (.Q (nx1164), .A (nx17787), .B (nx17520)) ;
    NOR21 ix1163 (.Q (nx1162), .A (nx17756), .B (nx17508)) ;
    NOR40 ix17912 (.Q (nx17911), .A (nx1156), .B (nx1152), .C (nx1148), .D (
          nx330)) ;
    NOR21 ix1157 (.Q (nx1156), .A (nx2), .B (nx17914)) ;
    NAND21 ix17915 (.Q (nx17914), .A (nx482), .B (nx756)) ;
    NOR21 ix757 (.Q (nx756), .A (nx17500), .B (nx17444)) ;
    NOR21 ix1153 (.Q (nx1152), .A (nx17626), .B (nx17520)) ;
    NAND21 ix1149 (.Q (nx1148), .A (nx17919), .B (nx17921)) ;
    NAND21 ix17922 (.Q (nx17921), .A (nx270), .B (nx74)) ;
    NOR40 ix17924 (.Q (nx17923), .A (nx1136), .B (nx730), .C (nx1130), .D (nx656
          )) ;
    AOI211 ix1137 (.Q (nx1136), .A (nx17561), .B (nx17779), .C (nx17602)) ;
    NAND21 ix1131 (.Q (nx1130), .A (nx17927), .B (nx17930)) ;
    NOR40 ix17934 (.Q (nx17933), .A (nx1120), .B (nx716), .C (nx1104), .D (
          nx1102)) ;
    NAND31 ix1121 (.Q (nx1120), .A (nx17936), .B (nx17939), .C (nx17942)) ;
    NAND21 ix17937 (.Q (nx17936), .A (nx882), .B (nx4)) ;
    NOR21 ix883 (.Q (nx882), .A (nx17632), .B (nx17553)) ;
    NAND21 ix17940 (.Q (nx17939), .A (nx86), .B (nx4)) ;
    NOR21 ix87 (.Q (nx86), .A (nx28), .B (nx17874)) ;
    NOR21 ix1105 (.Q (nx1104), .A (nx17650), .B (nx17558)) ;
    NAND41 ix1101 (.Q (nx1100), .A (nx17950), .B (nx17966), .C (nx17978), .D (
           nx17985)) ;
    NOR40 ix17951 (.Q (nx17950), .A (nx1092), .B (nx446), .C (nx1088), .D (nx452
          )) ;
    NOR21 ix1093 (.Q (nx1092), .A (nx17835), .B (nx17558)) ;
    OAI211 ix1089 (.Q (nx1088), .A (nx17673), .B (nx17520), .C (nx17958)) ;
    NAND21 ix17959 (.Q (nx17958), .A (nx18787), .B (nx696)) ;
    NOR21 ix697 (.Q (nx696), .A (nx0), .B (nx17961)) ;
    NAND21 ix17962 (.Q (nx17961), .A (nx80), .B (nx92)) ;
    NOR40 ix17967 (.Q (nx17966), .A (nx680), .B (nx1078), .C (nx1074), .D (
          nx1072)) ;
    NOR21 ix1079 (.Q (nx1078), .A (nx17972), .B (nx17520)) ;
    NAND21 ix17973 (.Q (nx17972), .A (nx364), .B (nx92)) ;
    NOR21 ix1075 (.Q (nx1074), .A (nx17961), .B (nx17520)) ;
    AOI311 ix1073 (.Q (nx1072), .A (nx17612), .B (nx17976), .C (nx17460), .D (
           nx17520)) ;
    NOR40 ix17979 (.Q (nx17978), .A (nx1060), .B (nx1054), .C (nx1052), .D (
          nx672)) ;
    NAND21 ix1061 (.Q (nx1060), .A (nx17859), .B (nx17781)) ;
    AOI211 ix1053 (.Q (nx1052), .A (nx17460), .B (nx17523), .C (nx17602)) ;
    NOR40 ix17986 (.Q (nx17985), .A (nx1040), .B (nx1038), .C (nx152), .D (
          nx1034)) ;
    NOR21 ix1039 (.Q (nx1038), .A (nx0), .B (nx17745)) ;
    NAND31 ix1035 (.Q (nx1034), .A (nx17993), .B (nx17643), .C (nx17995)) ;
    NAND21 ix17994 (.Q (nx17993), .A (nx482), .B (nx130)) ;
    NAND41 ix1027 (.Q (nx1026), .A (nx17998), .B (nx18009), .C (nx18019), .D (
           nx18022)) ;
    NOR40 ix17999 (.Q (nx17998), .A (nx1018), .B (nx600), .C (nx1014), .D (nx614
          )) ;
    NOR21 ix1019 (.Q (nx1018), .A (nx18001), .B (nx17520)) ;
    NAND21 ix18002 (.Q (nx18001), .A (nx44), .B (nx92)) ;
    NOR21 ix601 (.Q (nx600), .A (nx0), .B (nx17606)) ;
    NAND21 ix1015 (.Q (nx1014), .A (nx18005), .B (nx18007)) ;
    NOR31 ix18010 (.Q (nx18009), .A (nx606), .B (nx1004), .C (nx302)) ;
    NAND21 ix607 (.Q (nx606), .A (nx18012), .B (nx18014)) ;
    NAND21 ix18013 (.Q (nx18012), .A (nx18787), .B (nx600)) ;
    NAND21 ix18015 (.Q (nx18014), .A (nx18787), .B (nx592)) ;
    NOR21 ix593 (.Q (nx592), .A (nx0), .B (nx17650)) ;
    NOR21 ix1005 (.Q (nx1004), .A (nx17712), .B (nx17558)) ;
    NOR21 ix303 (.Q (nx302), .A (nx17851), .B (nx17602)) ;
    NOR31 ix18020 (.Q (nx18019), .A (nx576), .B (nx574), .C (nx998)) ;
    NOR21 ix999 (.Q (nx998), .A (nx17737), .B (nx17520)) ;
    NOR40 ix18023 (.Q (nx18022), .A (nx558), .B (nx582), .C (nx990), .D (nx984)
          ) ;
    NAND31 ix991 (.Q (nx990), .A (nx17704), .B (nx18025), .C (nx18027)) ;
    NAND21 ix18028 (.Q (nx18027), .A (nx100), .B (nx4)) ;
    NAND41 ix985 (.Q (nx984), .A (nx18030), .B (nx18032), .C (nx18034), .D (
           nx18036)) ;
    NAND21 ix18033 (.Q (nx18032), .A (nx2), .B (nx622)) ;
    NAND21 ix18035 (.Q (nx18034), .A (nx678), .B (nx4)) ;
    NOR31 ix18037 (.Q (nx18036), .A (nx362), .B (nx970), .C (nx966)) ;
    OAI211 ix971 (.Q (nx970), .A (nx17626), .B (nx17442), .C (nx17502)) ;
    OAI211 ix967 (.Q (nx966), .A (nx17675), .B (nx17442), .C (nx18040)) ;
    AOI211 ix18041 (.Q (nx18040), .A (nx94), .B (nx146), .C (nx958)) ;
    NOR21 ix959 (.Q (nx958), .A (nx17629), .B (nx17442)) ;
    NAND41 ix957 (.Q (nx956), .A (nx18044), .B (nx18072), .C (nx18091), .D (
           nx18095)) ;
    NOR40 ix18045 (.Q (nx18044), .A (nx950), .B (nx932), .C (nx924), .D (nx920)
          ) ;
    NAND21 ix951 (.Q (nx950), .A (nx18047), .B (nx18050)) ;
    AOI211 ix18048 (.Q (nx18047), .A (nx436), .B (nx74), .C (nx944)) ;
    AOI211 ix945 (.Q (nx944), .A (nx17818), .B (nx17515), .C (nx17520)) ;
    OAI211 ix18051 (.Q (nx18050), .A (nx244), .B (nx262), .C (nx146)) ;
    OAI221 ix933 (.Q (nx932), .A (nx18787), .B (nx18054), .C (nx17618), .D (
           nx17558)) ;
    NAND21 ix18055 (.Q (nx18054), .A (nx126), .B (nx756)) ;
    NAND21 ix925 (.Q (nx924), .A (nx18057), .B (nx18062)) ;
    NAND21 ix18058 (.Q (nx18057), .A (nx2), .B (nx200)) ;
    NOR21 ix201 (.Q (nx200), .A (nx17532), .B (nx18060)) ;
    NAND21 ix18061 (.Q (nx18060), .A (nx17500), .B (nx0)) ;
    NAND21 ix18063 (.Q (nx18062), .A (nx380), .B (nx218)) ;
    OAI2111 ix921 (.Q (nx920), .A (nx2), .B (nx18065), .C (nx17793), .D (nx18067
            )) ;
    NAND21 ix18066 (.Q (nx18065), .A (nx0), .B (nx432)) ;
    NOR40 ix18073 (.Q (nx18072), .A (nx908), .B (nx896), .C (nx344), .D (nx888)
          ) ;
    NAND31 ix909 (.Q (nx908), .A (nx18075), .B (nx18077), .C (nx18080)) ;
    AOI211 ix18076 (.Q (nx18075), .A (nx532), .B (nx4), .C (nx648)) ;
    OAI211 ix18078 (.Q (nx18077), .A (nx86), .B (nx394), .C (nx146)) ;
    NOR40 ix18081 (.Q (nx18080), .A (nx488), .B (nx478), .C (nx474), .D (nx470)
          ) ;
    NOR21 ix475 (.Q (nx474), .A (nx17673), .B (nx17442)) ;
    NOR40 ix471 (.Q (nx470), .A (nx28), .B (nx0), .C (nx2), .D (nx17532)) ;
    OAI221 ix897 (.Q (nx896), .A (nx17442), .B (nx18085), .C (nx17685), .D (
           nx17520)) ;
    NOR21 ix18086 (.Q (nx18085), .A (nx380), .B (nx426)) ;
    NOR21 ix427 (.Q (nx426), .A (nx17632), .B (nx17701)) ;
    NOR40 ix18092 (.Q (nx18091), .A (nx320), .B (nx874), .C (nx868), .D (nx234)
          ) ;
    AOI211 ix875 (.Q (nx874), .A (nx17818), .B (nx17515), .C (nx17602)) ;
    OAI221 ix869 (.Q (nx868), .A (nx2), .B (nx17887), .C (nx17496), .D (nx17444)
           ) ;
    NOR40 ix18096 (.Q (nx18095), .A (nx856), .B (nx830), .C (nx824), .D (nx820)
          ) ;
    AOI311 ix857 (.Q (nx856), .A (nx18065), .B (nx18098), .C (nx17868), .D (
           nx18787)) ;
    AOI311 ix831 (.Q (nx830), .A (nx17737), .B (nx17427), .C (nx17673), .D (
           nx17558)) ;
    AOI211 ix825 (.Q (nx824), .A (nx17745), .B (nx17805), .C (nx17520)) ;
    AOI311 ix821 (.Q (nx820), .A (nx17612), .B (nx18103), .C (nx18105), .D (
           nx17442)) ;
    NOR31 ix18106 (.Q (nx18105), .A (nx620), .B (nx248), .C (nx214)) ;
    DFC1 reg_reg_2 (.Q (c[2]), .QN (\$dummy [2]), .C (clk), .D (nx1478), .RN (
         nx17893)) ;
    NAND41 ix1479 (.Q (nx1478), .A (nx18110), .B (nx18183), .C (nx18198), .D (
           nx18214)) ;
    NOR40 ix18111 (.Q (nx18110), .A (nx1472), .B (nx1450), .C (nx1422), .D (
          nx1398)) ;
    NAND41 ix1473 (.Q (nx1472), .A (nx18113), .B (nx18120), .C (nx18122), .D (
           nx18124)) ;
    NOR40 ix18114 (.Q (nx18113), .A (nx1468), .B (nx764), .C (nx1462), .D (nx788
          )) ;
    NAND21 ix1469 (.Q (nx1468), .A (nx18040), .B (nx18116)) ;
    NAND21 ix18117 (.Q (nx18116), .A (nx556), .B (nx146)) ;
    NOR21 ix557 (.Q (nx556), .A (nx17599), .B (nx17529)) ;
    NOR21 ix1463 (.Q (nx1462), .A (nx17523), .B (nx17442)) ;
    NAND21 ix18123 (.Q (nx18122), .A (nx882), .B (nx146)) ;
    NOR31 ix18125 (.Q (nx18124), .A (nx754), .B (nx1152), .C (nx170)) ;
    NAND41 ix1451 (.Q (nx1450), .A (nx18128), .B (nx18062), .C (nx18139), .D (
           nx18141)) ;
    NOR40 ix18129 (.Q (nx18128), .A (nx1446), .B (nx1440), .C (nx1438), .D (
          nx1146)) ;
    NAND21 ix1447 (.Q (nx1446), .A (nx18131), .B (nx17808)) ;
    NAND21 ix18132 (.Q (nx18131), .A (nx228), .B (nx74)) ;
    NOR21 ix1441 (.Q (nx1440), .A (nx18787), .B (nx18134)) ;
    NOR21 ix1147 (.Q (nx1146), .A (nx18001), .B (nx17602)) ;
    NOR31 ix18142 (.Q (nx18141), .A (nx498), .B (nx1426), .C (nx1128)) ;
    NOR21 ix1427 (.Q (nx1426), .A (nx18001), .B (nx17558)) ;
    NOR21 ix1129 (.Q (nx1128), .A (nx18787), .B (nx18148)) ;
    NAND21 ix18149 (.Q (nx18148), .A (nx0), .B (nx556)) ;
    NAND41 ix1423 (.Q (nx1422), .A (nx18151), .B (nx17936), .C (nx18153), .D (
           nx18158)) ;
    NOR31 ix18154 (.Q (nx18153), .A (nx446), .B (nx720), .C (nx1412)) ;
    NOR40 ix18159 (.Q (nx18158), .A (nx478), .B (nx1406), .C (nx1402), .D (nx696
          )) ;
    NOR21 ix1407 (.Q (nx1406), .A (nx17820), .B (nx17442)) ;
    NAND21 ix1403 (.Q (nx1402), .A (nx18162), .B (nx18164)) ;
    NAND21 ix18165 (.Q (nx18164), .A (nx510), .B (nx74)) ;
    NAND41 ix1399 (.Q (nx1398), .A (nx17781), .B (nx18167), .C (nx18170), .D (
           nx18173)) ;
    NOR31 ix18171 (.Q (nx18170), .A (nx1052), .B (nx672), .C (nx1388)) ;
    NOR21 ix1389 (.Q (nx1388), .A (nx17629), .B (nx17602)) ;
    NOR40 ix18174 (.Q (nx18173), .A (nx1384), .B (nx1374), .C (nx1372), .D (
          nx1368)) ;
    NAND31 ix1385 (.Q (nx1384), .A (nx18176), .B (nx17990), .C (nx18178)) ;
    NAND21 ix18177 (.Q (nx18176), .A (nx426), .B (nx218)) ;
    NAND21 ix18179 (.Q (nx18178), .A (nx332), .B (nx218)) ;
    NOR21 ix1375 (.Q (nx1374), .A (nx17678), .B (nx17520)) ;
    NOR21 ix1373 (.Q (nx1372), .A (nx2), .B (nx17993)) ;
    NOR40 ix18184 (.Q (nx18183), .A (nx606), .B (nx614), .C (nx1354), .D (nx1350
          )) ;
    NAND31 ix1355 (.Q (nx1354), .A (nx18186), .B (nx18188), .C (nx17657)) ;
    NAND21 ix18187 (.Q (nx18186), .A (nx556), .B (nx218)) ;
    NOR21 ix579 (.Q (nx578), .A (nx17675), .B (nx17602)) ;
    NAND41 ix1351 (.Q (nx1350), .A (nx18193), .B (nx18025), .C (nx18196), .D (
           nx18027)) ;
    NOR21 ix18194 (.Q (nx18193), .A (nx1346), .B (nx560)) ;
    NOR21 ix1347 (.Q (nx1346), .A (nx17675), .B (nx17558)) ;
    NOR40 ix18199 (.Q (nx18198), .A (nx976), .B (nx1330), .C (nx1326), .D (
          nx1322)) ;
    AOI211 ix1331 (.Q (nx1330), .A (nx17737), .B (nx17820), .C (nx17602)) ;
    NAND31 ix1327 (.Q (nx1326), .A (nx18030), .B (nx18032), .C (nx17698)) ;
    NAND41 ix1323 (.Q (nx1322), .A (nx18204), .B (nx18206), .C (nx18209), .D (
           nx18212)) ;
    NOR31 ix18205 (.Q (nx18204), .A (nx440), .B (nx932), .C (nx530)) ;
    NOR21 ix18207 (.Q (nx18206), .A (nx1310), .B (nx1092)) ;
    AOI211 ix1311 (.Q (nx1310), .A (nx17745), .B (nx17721), .C (nx17520)) ;
    AOI211 ix18210 (.Q (nx18209), .A (nx1076), .B (nx218), .C (nx742)) ;
    OAI211 ix18213 (.Q (nx18212), .A (nx532), .B (nx472), .C (nx74)) ;
    NOR40 ix18215 (.Q (nx18214), .A (nx1296), .B (nx1260), .C (nx1224), .D (
          nx1212)) ;
    NAND41 ix1297 (.Q (nx1296), .A (nx18075), .B (nx18077), .C (nx18217), .D (
           nx18224)) ;
    NOR31 ix18218 (.Q (nx18217), .A (nx336), .B (nx888), .C (nx1286)) ;
    NOR40 ix18225 (.Q (nx18224), .A (nx310), .B (nx1278), .C (nx1272), .D (
          nx1266)) ;
    AOI211 ix1279 (.Q (nx1278), .A (nx17523), .B (nx17712), .C (nx17558)) ;
    NAND21 ix1273 (.Q (nx1272), .A (nx17831), .B (nx18228)) ;
    AOI211 ix1267 (.Q (nx1266), .A (nx17737), .B (nx17879), .C (nx17558)) ;
    NAND41 ix1261 (.Q (nx1260), .A (nx18233), .B (nx18235), .C (nx18239), .D (
           nx18241)) ;
    AOI211 ix18236 (.Q (nx18235), .A (nx4), .B (nx1248), .C (nx1246)) ;
    NAND21 ix1249 (.Q (nx1248), .A (nx17961), .B (nx17673)) ;
    OAI211 ix1247 (.Q (nx1246), .A (nx17475), .B (nx17558), .C (nx17939)) ;
    IMUX21 ix18240 (.Q (nx18239), .A (nx600), .B (nx1110), .S (nx18787)) ;
    NAND21 ix18242 (.Q (nx18241), .A (nx592), .B (nx2)) ;
    OAI211 ix1225 (.Q (nx1224), .A (nx17787), .B (nx17558), .C (nx18244)) ;
    IMUX21 ix18245 (.Q (nx18244), .A (nx408), .B (nx58), .S (nx74)) ;
    OAI2111 ix1213 (.Q (nx1212), .A (nx17442), .B (nx18247), .C (nx18250), .D (
            nx18255)) ;
    NOR40 ix18248 (.Q (nx18247), .A (nx228), .B (nx262), .C (nx340), .D (nx332)
          ) ;
    OAI211 ix18251 (.Q (nx18250), .A (nx1038), .B (nx850), .C (nx2)) ;
    OAI211 ix18256 (.Q (nx18255), .A (nx366), .B (nx222), .C (nx218)) ;
    DFC1 reg_reg_3 (.Q (c[3]), .QN (\$dummy [3]), .C (clk), .D (nx1760), .RN (
         nx17893)) ;
    CLKIN1 ix1761 (.Q (nx1760), .A (nx18260)) ;
    NOR40 ix18261 (.Q (nx18260), .A (nx1756), .B (nx1704), .C (nx1650), .D (
          nx1596)) ;
    NAND41 ix1757 (.Q (nx1756), .A (nx18263), .B (nx18272), .C (nx18282), .D (
           nx18295)) ;
    NOR40 ix18264 (.Q (nx18263), .A (nx1750), .B (nx788), .C (nx786), .D (nx1176
          )) ;
    NAND21 ix1751 (.Q (nx1750), .A (nx17907), .B (nx18266)) ;
    NOR40 ix18273 (.Q (nx18272), .A (nx526), .B (nx1456), .C (nx768), .D (nx1738
          )) ;
    NOR21 ix527 (.Q (nx526), .A (nx17515), .B (nx17442)) ;
    NOR21 ix769 (.Q (nx768), .A (nx2), .B (nx18277)) ;
    NAND21 ix18278 (.Q (nx18277), .A (nx618), .B (nx464)) ;
    NAND31 ix1739 (.Q (nx1738), .A (nx18280), .B (nx17808), .C (nx17814)) ;
    NOR40 ix18283 (.Q (nx18282), .A (nx742), .B (nx378), .C (nx912), .D (nx1726)
          ) ;
    NOR21 ix913 (.Q (nx912), .A (nx17879), .B (nx17520)) ;
    NAND31 ix1727 (.Q (nx1726), .A (nx18287), .B (nx18290), .C (nx18293)) ;
    AOI211 ix18291 (.Q (nx18290), .A (nx678), .B (nx218), .C (nx1048)) ;
    NOR21 ix1049 (.Q (nx1048), .A (nx17523), .B (nx17602)) ;
    NAND21 ix18294 (.Q (nx18293), .A (nx532), .B (nx218)) ;
    NOR40 ix18296 (.Q (nx18295), .A (nx1710), .B (nx1440), .C (nx730), .D (
          nx1708)) ;
    NOR21 ix1711 (.Q (nx1710), .A (nx17751), .B (nx17602)) ;
    NAND31 ix1709 (.Q (nx1708), .A (nx18062), .B (nx17930), .C (nx17841)) ;
    NAND41 ix1705 (.Q (nx1704), .A (nx18300), .B (nx18308), .C (nx18316), .D (
           nx18324)) ;
    NOR40 ix18301 (.Q (nx18300), .A (nx508), .B (nx1112), .C (nx200), .D (nx1694
          )) ;
    NOR21 ix1113 (.Q (nx1112), .A (nx18787), .B (nx18303)) ;
    NAND21 ix18304 (.Q (nx18303), .A (nx0), .B (nx214)) ;
    NAND31 ix1695 (.Q (nx1694), .A (nx17753), .B (nx18306), .C (nx18151)) ;
    NOR40 ix18309 (.Q (nx18308), .A (nx700), .B (nx488), .C (nx1406), .D (nx1684
          )) ;
    NAND31 ix1685 (.Q (nx1684), .A (nx18311), .B (nx18314), .C (nx17571)) ;
    NOR40 ix18312 (.Q (nx18311), .A (nx1066), .B (nx680), .C (nx752), .D (nx170)
          ) ;
    NOR21 ix1067 (.Q (nx1066), .A (nx17460), .B (nx17520)) ;
    NOR40 ix18317 (.Q (nx18316), .A (nx1670), .B (nx578), .C (nx406), .D (nx666)
          ) ;
    NAND31 ix1671 (.Q (nx1670), .A (nx18319), .B (nx18164), .C (nx18322)) ;
    NAND21 ix18323 (.Q (nx18322), .A (nx882), .B (nx74)) ;
    NOR40 ix18325 (.Q (nx18324), .A (nx1380), .B (nx654), .C (nx672), .D (nx1656
          )) ;
    NOR21 ix655 (.Q (nx654), .A (nx17612), .B (nx17602)) ;
    NAND31 ix1657 (.Q (nx1656), .A (nx18329), .B (nx17828), .C (nx18331)) ;
    NAND21 ix18330 (.Q (nx18329), .A (nx2), .B (nx150)) ;
    NAND21 ix18332 (.Q (nx18331), .A (nx350), .B (nx218)) ;
    NAND41 ix1651 (.Q (nx1650), .A (nx18334), .B (nx18342), .C (nx18353), .D (
           nx18361)) ;
    NOR40 ix18335 (.Q (nx18334), .A (nx1644), .B (nx1374), .C (nx604), .D (nx628
          )) ;
    NAND31 ix1645 (.Q (nx1644), .A (nx18337), .B (nx17995), .C (nx18339)) ;
    NAND21 ix18338 (.Q (nx18337), .A (nx244), .B (nx4)) ;
    NAND21 ix18340 (.Q (nx18339), .A (nx228), .B (nx218)) ;
    NOR40 ix18343 (.Q (nx18342), .A (nx1632), .B (nx1004), .C (nx1012), .D (
          nx1624)) ;
    NAND31 ix1633 (.Q (nx1632), .A (nx18345), .B (nx17640), .C (nx18347)) ;
    NAND21 ix18346 (.Q (nx18345), .A (nx500), .B (nx74)) ;
    NOR21 ix1013 (.Q (nx1012), .A (nx17767), .B (nx17602)) ;
    OAI211 ix1625 (.Q (nx1624), .A (nx2), .B (nx17536), .C (nx18351)) ;
    NOR40 ix18354 (.Q (nx18353), .A (nx560), .B (nx574), .C (nx998), .D (nx1610)
          ) ;
    NAND31 ix1611 (.Q (nx1610), .A (nx18027), .B (nx18356), .C (nx18359)) ;
    NAND21 ix18360 (.Q (nx18359), .A (nx500), .B (nx218)) ;
    NOR40 ix18362 (.Q (nx18361), .A (nx1330), .B (nx986), .C (nx1340), .D (
          nx1600)) ;
    NOR21 ix987 (.Q (nx986), .A (nx17779), .B (nx17558)) ;
    OAI211 ix1341 (.Q (nx1340), .A (nx18787), .B (nx17863), .C (nx18365)) ;
    NAND21 ix18366 (.Q (nx18365), .A (nx436), .B (nx4)) ;
    NAND31 ix1601 (.Q (nx1600), .A (nx17698), .B (nx18034), .C (nx17704)) ;
    NAND41 ix1597 (.Q (nx1596), .A (nx18369), .B (nx18381), .C (nx18389), .D (
           nx18403)) ;
    NOR40 ix18370 (.Q (nx18369), .A (nx1590), .B (nx504), .C (nx1578), .D (
          nx1574)) ;
    NAND31 ix1591 (.Q (nx1590), .A (nx18047), .B (nx18372), .C (nx18032)) ;
    OAI211 ix18373 (.Q (nx18372), .A (nx58), .B (nx332), .C (nx146)) ;
    NAND21 ix18376 (.Q (nx18375), .A (nx94), .B (nx4)) ;
    AOI211 ix1579 (.Q (nx1578), .A (nx17972), .B (nx18001), .C (nx17558)) ;
    OAI211 ix1575 (.Q (nx1574), .A (nx17618), .B (nx17520), .C (nx18379)) ;
    NOR40 ix18382 (.Q (nx18381), .A (nx430), .B (nx458), .C (nx932), .D (nx1564)
          ) ;
    NAND31 ix1565 (.Q (nx1564), .A (nx18384), .B (nx18387), .C (nx18212)) ;
    OAI311 ix18388 (.Q (nx18387), .A (nx510), .B (nx882), .C (nx394), .D (nx218)
           ) ;
    NOR40 ix18390 (.Q (nx18389), .A (nx1548), .B (nx1536), .C (nx1266), .D (
          nx1522)) ;
    OAI311 ix1549 (.Q (nx1548), .A (nx18060), .B (nx18787), .C (nx17756), .D (
           nx18392)) ;
    OAI211 ix1537 (.Q (nx1536), .A (nx17622), .B (nx17558), .C (nx18396)) ;
    AOI211 ix18397 (.Q (nx18396), .A (nx316), .B (nx4), .C (nx1528)) ;
    OAI221 ix1529 (.Q (nx1528), .A (nx18787), .B (nx17536), .C (nx17515), .D (
           nx17558)) ;
    OAI2111 ix1523 (.Q (nx1522), .A (nx17993), .B (nx18787), .C (nx18401), .D (
            nx17843)) ;
    NAND21 ix18402 (.Q (nx18401), .A (nx18787), .B (nx1162)) ;
    AOI2111 ix18404 (.Q (nx18403), .A (nx416), .B (nx4), .C (nx1506), .D (nx1498
            )) ;
    OAI221 ix1507 (.Q (nx1506), .A (nx17818), .B (nx17602), .C (nx17673), .D (
           nx17442)) ;
    OAI2111 ix1499 (.Q (nx1498), .A (nx17835), .B (nx17520), .C (nx18407), .D (
            nx18409)) ;
    NAND21 ix18408 (.Q (nx18407), .A (nx244), .B (nx17444)) ;
    NAND31 ix18410 (.Q (nx18409), .A (nx17444), .B (nx432), .C (nx2)) ;
    DFC1 reg_reg_4 (.Q (c[4]), .QN (\$dummy [4]), .C (clk), .D (nx1990), .RN (
         nx17893)) ;
    CLKIN1 ix1991 (.Q (nx1990), .A (nx18414)) ;
    NOR40 ix18415 (.Q (nx18414), .A (nx1986), .B (nx1944), .C (nx1902), .D (
          nx1860)) ;
    NAND41 ix1987 (.Q (nx1986), .A (nx18417), .B (nx18423), .C (nx18432), .D (
           nx18437)) ;
    NOR40 ix18418 (.Q (nx18417), .A (nx1980), .B (nx330), .C (nx758), .D (nx1164
          )) ;
    NAND21 ix1981 (.Q (nx1980), .A (nx18122), .B (nx18420)) ;
    NOR40 ix18424 (.Q (nx18423), .A (nx912), .B (nx1144), .C (nx1968), .D (nx850
          )) ;
    NAND21 ix1969 (.Q (nx1968), .A (nx18427), .B (nx18430)) ;
    OAI211 ix18431 (.Q (nx18430), .A (nx86), .B (nx532), .C (nx218)) ;
    NOR40 ix18433 (.Q (nx18432), .A (nx132), .B (nx732), .C (nx1954), .D (nx264)
          ) ;
    NOR21 ix733 (.Q (nx732), .A (nx17779), .B (nx17602)) ;
    NAND21 ix1955 (.Q (nx1954), .A (nx18057), .B (nx18139)) ;
    NOR21 ix265 (.Q (nx264), .A (nx17835), .B (nx17602)) ;
    NOR40 ix18438 (.Q (nx18437), .A (nx498), .B (nx1426), .C (nx1946), .D (nx508
          )) ;
    NAND21 ix1947 (.Q (nx1946), .A (nx18306), .B (nx18440)) ;
    NAND21 ix18441 (.Q (nx18440), .A (nx332), .B (nx4)) ;
    NAND41 ix1945 (.Q (nx1944), .A (nx18443), .B (nx18446), .C (nx18449), .D (
           nx18455)) ;
    NOR40 ix18444 (.Q (nx18443), .A (nx1406), .B (nx446), .C (nx1934), .D (nx478
          )) ;
    OAI211 ix1935 (.Q (nx1934), .A (nx17737), .B (nx17442), .C (nx17763)) ;
    NOR40 ix18447 (.Q (nx18446), .A (nx1078), .B (nx1074), .C (nx1926), .D (
          nx680)) ;
    NAND21 ix1927 (.Q (nx1926), .A (nx18178), .B (nx18319)) ;
    NOR40 ix18450 (.Q (nx18449), .A (nx1920), .B (nx1368), .C (nx648), .D (
          nx1040)) ;
    NAND21 ix1921 (.Q (nx1920), .A (nx18452), .B (nx18331)) ;
    NOR40 ix18456 (.Q (nx18455), .A (nx616), .B (nx1624), .C (nx1018), .D (
          nx1908)) ;
    NAND31 ix1909 (.Q (nx1908), .A (nx17657), .B (nx17660), .C (nx17823)) ;
    NAND41 ix1903 (.Q (nx1902), .A (nx18459), .B (nx18462), .C (nx18468), .D (
           nx18473)) ;
    NOR40 ix18460 (.Q (nx18459), .A (nx574), .B (nx998), .C (nx1892), .D (nx576)
          ) ;
    NAND21 ix1893 (.Q (nx1892), .A (nx18186), .B (nx18188)) ;
    NOR40 ix18463 (.Q (nx18462), .A (nx1888), .B (nx1340), .C (nx552), .D (
          nx1346)) ;
    NAND21 ix1889 (.Q (nx1888), .A (nx18359), .B (nx18465)) ;
    NOR40 ix18469 (.Q (nx18468), .A (nx1310), .B (nx986), .C (nx1874), .D (nx966
          )) ;
    NAND21 ix1875 (.Q (nx1874), .A (nx18050), .B (nx18471)) ;
    NOR40 ix18474 (.Q (nx18473), .A (nx1870), .B (nx1532), .C (nx458), .D (
          nx1246)) ;
    NAND21 ix1871 (.Q (nx1870), .A (nx18476), .B (nx18478)) ;
    OAI211 ix18477 (.Q (nx18476), .A (nx262), .B (nx244), .C (nx74)) ;
    AOI211 ix18479 (.Q (nx18478), .A (nx86), .B (nx74), .C (nx170)) ;
    NAND41 ix1861 (.Q (nx1860), .A (nx18486), .B (nx18492), .C (nx18508), .D (
           nx18513)) ;
    NOR40 ix18487 (.Q (nx18486), .A (nx1854), .B (nx354), .C (nx888), .D (nx384)
          ) ;
    NAND21 ix1855 (.Q (nx1854), .A (nx18489), .B (nx17775)) ;
    OAI211 ix18490 (.Q (nx18489), .A (nx228), .B (nx58), .C (nx4)) ;
    NOR40 ix18493 (.Q (nx18492), .A (nx874), .B (nx1560), .C (nx1842), .D (
          nx1278)) ;
    OAI211 ix1561 (.Q (nx1560), .A (nx17881), .B (nx17520), .C (nx18495)) ;
    NAND21 ix18496 (.Q (nx18495), .A (nx18787), .B (nx840)) ;
    NOR31 ix841 (.Q (nx840), .A (nx17874), .B (nx17500), .C (nx17444)) ;
    NAND21 ix1843 (.Q (nx1842), .A (nx18499), .B (nx18503)) ;
    AOI2111 ix18500 (.Q (nx18499), .A (nx178), .B (nx146), .C (nx1834), .D (
            nx710)) ;
    AOI211 ix1835 (.Q (nx1834), .A (nx17787), .B (nx17805), .C (nx17558)) ;
    OAI221 ix711 (.Q (nx710), .A (nx2), .B (nx17884), .C (nx17982), .D (nx17442)
           ) ;
    NOR40 ix18509 (.Q (nx18508), .A (nx226), .B (nx1812), .C (nx1806), .D (
          nx1256)) ;
    OAI211 ix1813 (.Q (nx1812), .A (nx17972), .B (nx17442), .C (nx18287)) ;
    OAI221 ix1807 (.Q (nx1806), .A (nx18277), .B (nx18787), .C (nx17444), .D (
           nx17635)) ;
    AOI211 ix1257 (.Q (nx1256), .A (nx17612), .B (nx17561), .C (nx17442)) ;
    NOR40 ix18514 (.Q (nx18513), .A (nx1796), .B (nx1778), .C (nx1774), .D (
          nx1770)) ;
    OAI211 ix1797 (.Q (nx1796), .A (nx17841), .B (nx2), .C (nx18516)) ;
    AOI221 ix18517 (.Q (nx18516), .A (nx58), .B (nx17444), .C (nx18787), .D (
           nx928)) ;
    AOI211 ix1779 (.Q (nx1778), .A (nx17961), .B (nx17820), .C (nx17558)) ;
    AOI211 ix1775 (.Q (nx1774), .A (nx17692), .B (nx17712), .C (nx17520)) ;
    AOI311 ix1771 (.Q (nx1770), .A (nx17964), .B (nx17818), .C (nx17767), .D (
           nx17442)) ;
    DFC1 reg_reg_5 (.Q (c[5]), .QN (\$dummy [5]), .C (clk), .D (nx2182), .RN (
         nx17893)) ;
    CLKIN1 ix2183 (.Q (nx2182), .A (nx18525)) ;
    NOR40 ix18526 (.Q (nx18525), .A (nx2178), .B (nx2140), .C (nx2100), .D (
          nx2054)) ;
    NAND41 ix2179 (.Q (nx2178), .A (nx18528), .B (nx18530), .C (nx18535), .D (
           nx18541)) ;
    NOR40 ix18529 (.Q (nx18528), .A (nx794), .B (nx958), .C (nx944), .D (nx788)
          ) ;
    NOR40 ix18531 (.Q (nx18530), .A (nx1146), .B (nx280), .C (nx1440), .D (
          nx1048)) ;
    NOR40 ix18536 (.Q (nx18535), .A (nx256), .B (nx498), .C (nx2154), .D (nx452)
          ) ;
    NOR40 ix18542 (.Q (nx18541), .A (nx1066), .B (nx434), .C (nx1388), .D (nx406
          )) ;
    NAND31 ix2141 (.Q (nx2140), .A (nx18545), .B (nx18557), .C (nx18560)) ;
    NOR40 ix18546 (.Q (nx18545), .A (nx2136), .B (nx2122), .C (nx604), .D (
          nx1372)) ;
    NAND41 ix2137 (.Q (nx2136), .A (nx17615), .B (nx18548), .C (nx18337), .D (
           nx18550)) ;
    NAND21 ix18549 (.Q (nx18548), .A (nx254), .B (nx218)) ;
    NOR40 ix18551 (.Q (nx18550), .A (nx1040), .B (nx642), .C (nx1124), .D (
          nx1432)) ;
    NOR21 ix1125 (.Q (nx1124), .A (nx17647), .B (nx17602)) ;
    NOR21 ix1433 (.Q (nx1432), .A (nx17879), .B (nx17602)) ;
    NAND21 ix2123 (.Q (nx2122), .A (nx18555), .B (nx17643)) ;
    OAI211 ix18556 (.Q (nx18555), .A (nx214), .B (nx532), .C (nx146)) ;
    NOR40 ix18558 (.Q (nx18557), .A (nx1018), .B (nx1374), .C (nx614), .D (nx634
          )) ;
    NOR21 ix635 (.Q (nx634), .A (nx17629), .B (nx17520)) ;
    NOR40 ix18561 (.Q (nx18560), .A (nx616), .B (nx1624), .C (nx2104), .D (
          nx1012)) ;
    NAND21 ix2105 (.Q (nx2104), .A (nx18563), .B (nx18565)) ;
    AOI221 ix18566 (.Q (nx18565), .A (nx678), .B (nx146), .C (nx18787), .D (
           nx1162)) ;
    NAND41 ix2101 (.Q (nx2100), .A (nx18568), .B (nx18574), .C (nx18582), .D (
           nx18592)) ;
    NOR40 ix18569 (.Q (nx18568), .A (nx1868), .B (nx530), .C (nx924), .D (nx1574
          )) ;
    NAND21 ix18572 (.Q (nx18571), .A (nx18787), .B (nx166)) ;
    NOR21 ix167 (.Q (nx166), .A (nx17444), .B (nx17767)) ;
    NOR40 ix18575 (.Q (nx18574), .A (nx1302), .B (nx450), .C (nx1542), .D (
          nx1312)) ;
    OAI221 ix1543 (.Q (nx1542), .A (nx17820), .B (nx17558), .C (nx17721), .D (
           nx17602)) ;
    NOR40 ix18583 (.Q (nx18582), .A (nx384), .B (nx420), .C (nx2076), .D (nx2068
          )) ;
    AOI211 ix421 (.Q (nx420), .A (nx17612), .B (nx17460), .C (nx17558)) ;
    OAI211 ix2077 (.Q (nx2076), .A (nx17635), .B (nx17558), .C (nx18586)) ;
    OAI211 ix18587 (.Q (nx18586), .A (nx222), .B (nx248), .C (nx218)) ;
    OAI2111 ix2069 (.Q (nx2068), .A (nx17647), .B (nx17442), .C (nx18589), .D (
            nx18014)) ;
    NAND21 ix18590 (.Q (nx18589), .A (nx486), .B (nx218)) ;
    NOR40 ix18593 (.Q (nx18592), .A (nx1528), .B (nx896), .C (nx874), .D (nx1560
          )) ;
    NAND31 ix2055 (.Q (nx2054), .A (nx18595), .B (nx18600), .C (nx18607)) ;
    NOR40 ix18596 (.Q (nx18595), .A (nx1840), .B (nx1278), .C (nx310), .D (
          nx1812)) ;
    NOR40 ix18601 (.Q (nx18600), .A (nx1270), .B (nx1266), .C (nx1252), .D (
          nx252)) ;
    OAI211 ix1271 (.Q (nx1270), .A (nx18089), .B (nx17442), .C (nx17483)) ;
    NOR40 ix18608 (.Q (nx18607), .A (nx1256), .B (nx226), .C (nx2032), .D (
          nx2028)) ;
    OAI211 ix2033 (.Q (nx2032), .A (nx17692), .B (nx17602), .C (nx18610)) ;
    OAI2111 ix2029 (.Q (nx2028), .A (nx18787), .B (nx18613), .C (nx18615), .D (
            nx18617)) ;
    NOR40 ix18614 (.Q (nx18613), .A (nx326), .B (nx592), .C (nx1162), .D (nx1172
          )) ;
    AOI221 ix18616 (.Q (nx18615), .A (nx340), .B (nx74), .C (nx394), .D (nx17444
           )) ;
    AOI221 ix18618 (.Q (nx18617), .A (nx4), .B (nx2004), .C (nx18787), .D (
           nx2012)) ;
    NAND21 ix2005 (.Q (nx2004), .A (nx17972), .B (nx17710)) ;
    OAI2111 ix2013 (.Q (nx2012), .A (nx17756), .B (nx18060), .C (nx18621), .D (
            nx18148)) ;
    DFC1 reg_reg_6 (.Q (c[6]), .QN (\$dummy [6]), .C (clk), .D (nx2356), .RN (
         nx17893)) ;
    CLKIN1 ix2357 (.Q (nx2356), .A (nx18626)) ;
    NOR40 ix18627 (.Q (nx18626), .A (nx2352), .B (nx2318), .C (nx2280), .D (
          nx2246)) ;
    NAND41 ix2353 (.Q (nx2352), .A (nx18629), .B (nx18632), .C (nx18635), .D (
           nx18637)) ;
    NOR40 ix18630 (.Q (nx18629), .A (nx962), .B (nx792), .C (nx786), .D (nx1172)
          ) ;
    NOR40 ix18633 (.Q (nx18632), .A (nx2340), .B (nx754), .C (nx1164), .D (nx526
          )) ;
    NAND21 ix2341 (.Q (nx2340), .A (nx17547), .B (nx18420)) ;
    NOR40 ix18636 (.Q (nx18635), .A (nx280), .B (nx1156), .C (nx1136), .D (
          nx1438)) ;
    NOR40 ix18638 (.Q (nx18637), .A (nx264), .B (nx1710), .C (nx2320), .D (
          nx1128)) ;
    NAND21 ix2321 (.Q (nx2320), .A (nx18640), .B (nx17939)) ;
    NAND21 ix18641 (.Q (nx18640), .A (nx254), .B (nx4)) ;
    NAND41 ix2319 (.Q (nx2318), .A (nx18643), .B (nx18654), .C (nx18658), .D (
           nx18660)) ;
    NOR40 ix18644 (.Q (nx18643), .A (nx2314), .B (nx1078), .C (nx1074), .D (
          nx2304)) ;
    NAND41 ix2315 (.Q (nx2314), .A (nx18646), .B (nx18054), .C (nx18648), .D (
           nx18650)) ;
    NAND21 ix18649 (.Q (nx18648), .A (nx472), .B (nx74)) ;
    NOR40 ix18651 (.Q (nx18650), .A (nx700), .B (nx1406), .C (nx2148), .D (nx492
          )) ;
    NOR21 ix2149 (.Q (nx2148), .A (nx17675), .B (nx17442)) ;
    NAND31 ix2305 (.Q (nx2304), .A (nx18164), .B (nx18322), .C (nx18311)) ;
    NOR21 ix18655 (.Q (nx18654), .A (nx682), .B (nx184)) ;
    NOR21 ix683 (.Q (nx682), .A (nx17612), .B (nx17520)) ;
    NOR21 ix185 (.Q (nx184), .A (nx2), .B (nx17863)) ;
    NOR31 ix18659 (.Q (nx18658), .A (nx578), .B (nx670), .C (nx666)) ;
    NOR40 ix18661 (.Q (nx18660), .A (nx2288), .B (nx654), .C (nx1052), .D (nx672
          )) ;
    NAND21 ix2289 (.Q (nx2288), .A (nx17859), .B (nx18663)) ;
    NAND31 ix2281 (.Q (nx2280), .A (nx18666), .B (nx18671), .C (nx18675)) ;
    NOR40 ix18667 (.Q (nx18666), .A (nx2276), .B (nx2130), .C (nx152), .D (
          nx2266)) ;
    NAND41 ix2277 (.Q (nx2276), .A (nx18548), .B (nx18178), .C (nx17828), .D (
           nx17615)) ;
    NAND31 ix2267 (.Q (nx2266), .A (nx18555), .B (nx18337), .C (nx17995)) ;
    NOR40 ix18672 (.Q (nx18671), .A (nx536), .B (nx1586), .C (nx2072), .D (nx920
          )) ;
    NOR40 ix18676 (.Q (nx18675), .A (nx514), .B (nx1578), .C (nx2248), .D (nx430
          )) ;
    NAND21 ix2249 (.Q (nx2248), .A (nx18209), .B (nx18679)) ;
    NAND41 ix2247 (.Q (nx2246), .A (nx18682), .B (nx18694), .C (nx18698), .D (
           nx18700)) ;
    NOR40 ix18683 (.Q (nx18682), .A (nx2242), .B (nx376), .C (nx1286), .D (
          nx2232)) ;
    NAND41 ix2243 (.Q (nx2242), .A (nx17775), .B (nx18077), .C (nx17770), .D (
           nx18075)) ;
    OAI311 ix377 (.Q (nx376), .A (nx17721), .B (nx74), .C (nx17444), .D (nx18686
           )) ;
    OAI211 ix18687 (.Q (nx18686), .A (nx298), .B (nx340), .C (nx146)) ;
    NAND31 ix2233 (.Q (nx2232), .A (nx18689), .B (nx18387), .C (nx18691)) ;
    NOR40 ix18695 (.Q (nx18694), .A (nx1840), .B (nx1830), .C (nx2220), .D (
          nx1548)) ;
    OAI211 ix1831 (.Q (nx1830), .A (nx17715), .B (nx17520), .C (nx18565)) ;
    MUX22 ix2221 (.Q (nx2220), .A (nx696), .B (nx774), .S (nx18787)) ;
    OAI211 ix18699 (.Q (nx18698), .A (nx1038), .B (nx840), .C (nx2)) ;
    AOI2111 ix18701 (.Q (nx18700), .A (nx230), .B (nx74), .C (nx2196), .D (
            nx2192)) ;
    AOI211 ix2197 (.Q (nx2196), .A (nx17520), .B (nx17602), .C (nx18144)) ;
    AOI211 ix2193 (.Q (nx2192), .A (nx17515), .B (nx17715), .C (nx17558)) ;
    DFC1 reg_reg_7 (.Q (c[7]), .QN (\$dummy [7]), .C (clk), .D (nx2508), .RN (
         nx17893)) ;
    CLKIN1 ix2509 (.Q (nx2508), .A (nx18707)) ;
    NOR40 ix18708 (.Q (nx18707), .A (nx2504), .B (nx2474), .C (nx2440), .D (
          nx2408)) ;
    NAND41 ix2505 (.Q (nx2504), .A (nx18710), .B (nx18713), .C (nx18715), .D (
           nx18717)) ;
    NOR40 ix18711 (.Q (nx18710), .A (nx794), .B (nx792), .C (nx114), .D (nx1176)
          ) ;
    NOR21 ix115 (.Q (nx114), .A (nx0), .B (nx17712)) ;
    NOR40 ix18714 (.Q (nx18713), .A (nx788), .B (nx786), .C (nx728), .D (nx1462)
          ) ;
    NOR40 ix18716 (.Q (nx18715), .A (nx1164), .B (nx1126), .C (nx752), .D (
          nx1110)) ;
    NOR40 ix18718 (.Q (nx18717), .A (nx1144), .B (nx1152), .C (nx1966), .D (
          nx1146)) ;
    NAND41 ix2475 (.Q (nx2474), .A (nx18721), .B (nx18725), .C (nx18728), .D (
           nx18730)) ;
    NOR40 ix18722 (.Q (nx18721), .A (nx1722), .B (nx1720), .C (nx1440), .D (
          nx1136)) ;
    NOR21 ix1723 (.Q (nx1722), .A (nx17626), .B (nx17602)) ;
    NOR40 ix18726 (.Q (nx18725), .A (nx1710), .B (nx656), .C (nx1116), .D (
          nx1124)) ;
    NOR40 ix18729 (.Q (nx18728), .A (nx1104), .B (nx1102), .C (nx716), .D (
          nx1412)) ;
    NOR40 ix18731 (.Q (nx18730), .A (nx966), .B (nx720), .C (nx2444), .D (nx970)
          ) ;
    NAND21 ix2445 (.Q (nx2444), .A (nx18372), .B (nx18471)) ;
    NAND41 ix2441 (.Q (nx2440), .A (nx18734), .B (nx18737), .C (nx18740), .D (
           nx18742)) ;
    NOR40 ix18735 (.Q (nx18734), .A (nx940), .B (nx362), .C (nx1868), .D (nx536)
          ) ;
    NOR40 ix18738 (.Q (nx18737), .A (nx1574), .B (nx948), .C (nx924), .D (nx920)
          ) ;
    NOR40 ix18741 (.Q (nx18740), .A (nx504), .B (nx1578), .C (nx932), .D (nx514)
          ) ;
    NOR40 ix18743 (.Q (nx18742), .A (nx458), .B (nx450), .C (nx2410), .D (nx1306
          )) ;
    NAND21 ix2411 (.Q (nx2410), .A (nx18691), .B (nx18206)) ;
    NAND41 ix2409 (.Q (nx2408), .A (nx18749), .B (nx18751), .C (nx18753), .D (
           nx18760)) ;
    NOR40 ix18750 (.Q (nx18749), .A (nx336), .B (nx2076), .C (nx896), .D (nx344)
          ) ;
    NOR40 ix18752 (.Q (nx18751), .A (nx1536), .B (nx1830), .C (nx320), .D (
          nx1270)) ;
    NOR40 ix18754 (.Q (nx18753), .A (nx260), .B (nx252), .C (nx1252), .D (nx290)
          ) ;
    OAI211 ix261 (.Q (nx260), .A (nx17851), .B (nx17558), .C (nx18640)) ;
    AOI2111 ix18761 (.Q (nx18760), .A (nx254), .B (nx146), .C (nx2382), .D (
            nx2372)) ;
    OAI221 ix2383 (.Q (nx2382), .A (nx17884), .B (nx18787), .C (nx17673), .D (
           nx17602)) ;
    OAI211 ix2373 (.Q (nx2372), .A (nx17779), .B (nx17520), .C (nx18764)) ;
    OAI211 ix18765 (.Q (nx18764), .A (nx64), .B (nx882), .C (nx17444)) ;
    CLKIN1 ix2155 (.Q (nx2154), .A (nx18650)) ;
    CLKIN1 ix2131 (.Q (nx2130), .A (nx18550)) ;
    CLKIN1 ix2073 (.Q (nx2072), .A (nx18586)) ;
    CLKIN1 ix18692 (.Q (nx18691), .A (nx2068)) ;
    CLKIN1 ix1967 (.Q (nx1966), .A (nx18430)) ;
    CLKIN1 ix1869 (.Q (nx1868), .A (nx18478)) ;
    CLKIN1 ix1841 (.Q (nx1840), .A (nx18499)) ;
    CLKIN1 ix18504 (.Q (nx18503), .A (nx1830)) ;
    CLKIN1 ix18288 (.Q (nx18287), .A (nx1722)) ;
    CLKIN1 ix1721 (.Q (nx1720), .A (nx18290)) ;
    CLKIN1 ix1587 (.Q (nx1586), .A (nx18372)) ;
    CLKIN1 ix18385 (.Q (nx18384), .A (nx1560)) ;
    CLKIN1 ix18393 (.Q (nx18392), .A (nx1542)) ;
    CLKIN1 ix1533 (.Q (nx1532), .A (nx18396)) ;
    CLKIN1 ix18421 (.Q (nx18420), .A (nx1462)) ;
    CLKIN1 ix1457 (.Q (nx1456), .A (nx18122)) ;
    CLKIN1 ix1439 (.Q (nx1438), .A (nx18293)) ;
    CLKIN1 ix18140 (.Q (nx18139), .A (nx1432)) ;
    CLKIN1 ix1413 (.Q (nx1412), .A (nx18440)) ;
    CLKIN1 ix18664 (.Q (nx18663), .A (nx1388)) ;
    CLKIN1 ix1381 (.Q (nx1380), .A (nx18178)) ;
    CLKIN1 ix1369 (.Q (nx1368), .A (nx18555)) ;
    CLKIN1 ix18357 (.Q (nx18356), .A (nx1346)) ;
    CLKIN1 ix18197 (.Q (nx18196), .A (nx1340)) ;
    CLKIN1 ix1313 (.Q (nx1312), .A (nx18206)) ;
    CLKIN1 ix1307 (.Q (nx1306), .A (nx18209)) ;
    CLKIN1 ix1303 (.Q (nx1302), .A (nx18212)) ;
    CLKIN1 ix1287 (.Q (nx1286), .A (nx18489)) ;
    CLKIN1 ix18229 (.Q (nx18228), .A (nx1270)) ;
    CLKIN1 ix18234 (.Q (nx18233), .A (nx1256)) ;
    CLKIN1 ix1253 (.Q (nx1252), .A (nx18235)) ;
    CLKIN1 ix1177 (.Q (nx1176), .A (nx17904)) ;
    CLKIN1 ix18121 (.Q (nx18120), .A (nx1164)) ;
    CLKIN1 ix18380 (.Q (nx18379), .A (nx1156)) ;
    CLKIN1 ix18352 (.Q (nx18351), .A (nx1152)) ;
    CLKIN1 ix17920 (.Q (nx17919), .A (nx1146)) ;
    CLKIN1 ix1145 (.Q (nx1144), .A (nx17921)) ;
    CLKIN1 ix17928 (.Q (nx17927), .A (nx1128)) ;
    CLKIN1 ix1127 (.Q (nx1126), .A (nx18148)) ;
    CLKIN1 ix17931 (.Q (nx17930), .A (nx1124)) ;
    CLKIN1 ix1117 (.Q (nx1116), .A (nx17936)) ;
    CLKIN1 ix17943 (.Q (nx17942), .A (nx1112)) ;
    CLKIN1 ix1111 (.Q (nx1110), .A (nx18303)) ;
    CLKIN1 ix18152 (.Q (nx18151), .A (nx1104)) ;
    CLKIN1 ix1103 (.Q (nx1102), .A (nx18365)) ;
    CLKIN1 ix18647 (.Q (nx18646), .A (nx1092)) ;
    CLKIN1 ix1077 (.Q (nx1076), .A (nx17972)) ;
    CLKIN1 ix18315 (.Q (nx18314), .A (nx1074)) ;
    CLKIN1 ix1055 (.Q (nx1054), .A (nx18548)) ;
    CLKIN1 ix1041 (.Q (nx1040), .A (nx18339)) ;
    CLKIN1 ix18453 (.Q (nx18452), .A (nx1038)) ;
    CLKIN1 ix18348 (.Q (nx18347), .A (nx1018)) ;
    CLKIN1 ix18006 (.Q (nx18005), .A (nx1012)) ;
    CLKIN1 ix18026 (.Q (nx18025), .A (nx986)) ;
    CLKIN1 ix977 (.Q (nx976), .A (nx18034)) ;
    CLKIN1 ix18564 (.Q (nx18563), .A (nx970)) ;
    CLKIN1 ix963 (.Q (nx962), .A (nx18040)) ;
    CLKIN1 ix18267 (.Q (nx18266), .A (nx958)) ;
    CLKIN1 ix949 (.Q (nx948), .A (nx18047)) ;
    CLKIN1 ix941 (.Q (nx940), .A (nx18050)) ;
    CLKIN1 ix929 (.Q (nx928), .A (nx18054)) ;
    CLKIN1 ix18068 (.Q (nx18067), .A (nx912)) ;
    CLKIN1 ix889 (.Q (nx888), .A (nx18387)) ;
    CLKIN1 ix17977 (.Q (nx17976), .A (nx882)) ;
    CLKIN1 ix851 (.Q (nx850), .A (nx18065)) ;
    CLKIN1 ix18099 (.Q (nx18098), .A (nx840)) ;
    CLKIN1 ix795 (.Q (nx794), .A (nx17907)) ;
    CLKIN1 ix793 (.Q (nx792), .A (nx18116)) ;
    CLKIN1 ix18135 (.Q (nx18134), .A (nx774)) ;
    CLKIN1 ix17503 (.Q (nx17502), .A (nx768)) ;
    CLKIN1 ix765 (.Q (nx764), .A (nx18277)) ;
    CLKIN1 ix759 (.Q (nx758), .A (nx17914)) ;
    CLKIN1 ix745 (.Q (nx744), .A (nx18001)) ;
    CLKIN1 ix17544 (.Q (nx17543), .A (nx732)) ;
    CLKIN1 ix18428 (.Q (nx18427), .A (nx730)) ;
    CLKIN1 ix729 (.Q (nx728), .A (nx17547)) ;
    CLKIN1 ix18307 (.Q (nx18306), .A (nx716)) ;
    CLKIN1 ix17565 (.Q (nx17564), .A (nx710)) ;
    CLKIN1 ix701 (.Q (nx700), .A (nx17958)) ;
    CLKIN1 ix17590 (.Q (nx17589), .A (nx682)) ;
    CLKIN1 ix681 (.Q (nx680), .A (nx17596)) ;
    CLKIN1 ix18168 (.Q (nx18167), .A (nx670)) ;
    CLKIN1 ix18163 (.Q (nx18162), .A (nx666)) ;
    CLKIN1 ix659 (.Q (nx658), .A (nx18331)) ;
    CLKIN1 ix17996 (.Q (nx17995), .A (nx644)) ;
    CLKIN1 ix643 (.Q (nx642), .A (nx18176)) ;
    CLKIN1 ix17641 (.Q (nx17640), .A (nx634)) ;
    CLKIN1 ix629 (.Q (nx628), .A (nx17643)) ;
    CLKIN1 ix18622 (.Q (nx18621), .A (nx622)) ;
    CLKIN1 ix621 (.Q (nx620), .A (nx17647)) ;
    CLKIN1 ix18008 (.Q (nx18007), .A (nx616)) ;
    CLKIN1 ix615 (.Q (nx614), .A (nx18345)) ;
    CLKIN1 ix17661 (.Q (nx17660), .A (nx606)) ;
    CLKIN1 ix605 (.Q (nx604), .A (nx18012)) ;
    CLKIN1 ix18189 (.Q (nx18188), .A (nx582)) ;
    CLKIN1 ix18466 (.Q (nx18465), .A (nx560)) ;
    CLKIN1 ix559 (.Q (nx558), .A (nx18186)) ;
    CLKIN1 ix553 (.Q (nx552), .A (nx18027)) ;
    CLKIN1 ix551 (.Q (nx550), .A (nx18359)) ;
    CLKIN1 ix17711 (.Q (nx17710), .A (nx532)) ;
    CLKIN1 ix18472 (.Q (nx18471), .A (nx530)) ;
    CLKIN1 ix18031 (.Q (nx18030), .A (nx522)) ;
    CLKIN1 ix515 (.Q (nx514), .A (nx17726)) ;
    CLKIN1 ix18090 (.Q (nx18089), .A (nx510)) ;
    CLKIN1 ix505 (.Q (nx504), .A (nx17730)) ;
    CLKIN1 ix17428 (.Q (nx17427), .A (nx500)) ;
    CLKIN1 ix499 (.Q (nx498), .A (nx18375)) ;
    CLKIN1 ix493 (.Q (nx492), .A (nx18080)) ;
    CLKIN1 ix487 (.Q (nx486), .A (nx17737)) ;
    CLKIN1 ix473 (.Q (nx472), .A (nx17673)) ;
    CLKIN1 ix465 (.Q (nx464), .A (nx17508)) ;
    CLKIN1 ix453 (.Q (nx452), .A (nx17747)) ;
    CLKIN1 ix447 (.Q (nx446), .A (nx17753)) ;
    CLKIN1 ix18680 (.Q (nx18679), .A (nx440)) ;
    CLKIN1 ix17762 (.Q (nx17761), .A (nx436)) ;
    CLKIN1 ix435 (.Q (nx434), .A (nx17763)) ;
    CLKIN1 ix17636 (.Q (nx17635), .A (nx426)) ;
    CLKIN1 ix17771 (.Q (nx17770), .A (nx420)) ;
    CLKIN1 ix417 (.Q (nx416), .A (nx17612)) ;
    CLKIN1 ix409 (.Q (nx408), .A (nx17622)) ;
    CLKIN1 ix403 (.Q (nx402), .A (nx17779)) ;
    CLKIN1 ix399 (.Q (nx398), .A (nx18077)) ;
    CLKIN1 ix395 (.Q (nx394), .A (nx17787)) ;
    CLKIN1 ix385 (.Q (nx384), .A (nx17793)) ;
    CLKIN1 ix17965 (.Q (nx17964), .A (nx380)) ;
    CLKIN1 ix379 (.Q (nx378), .A (nx18131)) ;
    CLKIN1 ix17797 (.Q (nx17796), .A (nx376)) ;
    CLKIN1 ix367 (.Q (nx366), .A (nx17721)) ;
    CLKIN1 ix363 (.Q (nx362), .A (nx18686)) ;
    CLKIN1 ix18690 (.Q (nx18689), .A (nx354)) ;
    CLKIN1 ix17619 (.Q (nx17618), .A (nx350)) ;
    CLKIN1 ix341 (.Q (nx340), .A (nx17751)) ;
    CLKIN1 ix337 (.Q (nx336), .A (nx17810)) ;
    CLKIN1 ix327 (.Q (nx326), .A (nx17814)) ;
    CLKIN1 ix317 (.Q (nx316), .A (nx17818)) ;
    CLKIN1 ix17824 (.Q (nx17823), .A (nx302)) ;
    CLKIN1 ix291 (.Q (nx290), .A (nx17831)) ;
    CLKIN1 ix285 (.Q (nx284), .A (nx18476)) ;
    CLKIN1 ix281 (.Q (nx280), .A (nx17837)) ;
    CLKIN1 ix263 (.Q (nx262), .A (nx17835)) ;
    CLKIN1 ix17844 (.Q (nx17843), .A (nx260)) ;
    CLKIN1 ix257 (.Q (nx256), .A (nx18640)) ;
    CLKIN1 ix17983 (.Q (nx17982), .A (nx254)) ;
    CLKIN1 ix253 (.Q (nx252), .A (nx17845)) ;
    CLKIN1 ix17716 (.Q (nx17715), .A (nx248)) ;
    CLKIN1 ix18611 (.Q (nx18610), .A (nx234)) ;
    CLKIN1 ix231 (.Q (nx230), .A (nx17851)) ;
    CLKIN1 ix17854 (.Q (nx17853), .A (nx228)) ;
    CLKIN1 ix17858 (.Q (nx17857), .A (nx222)) ;
    INV3 ix219 (.Q (nx218), .A (nx17602)) ;
    CLKIN1 ix17866 (.Q (nx17865), .A (nx200)) ;
    CLKIN1 ix199 (.Q (nx198), .A (nx18060)) ;
    CLKIN1 ix18320 (.Q (nx18319), .A (nx184)) ;
    CLKIN1 ix18104 (.Q (nx18103), .A (nx178)) ;
    CLKIN1 ix171 (.Q (nx170), .A (nx18571)) ;
    CLKIN1 ix17869 (.Q (nx17868), .A (nx166)) ;
    CLKIN1 ix153 (.Q (nx152), .A (nx18329)) ;
    CLKIN1 ix17991 (.Q (nx17990), .A (nx150)) ;
    CLKIN1 ix147 (.Q (nx146), .A (nx17442)) ;
    CLKIN1 ix133 (.Q (nx132), .A (nx17884)) ;
    CLKIN1 ix121 (.Q (nx120), .A (nx17463)) ;
    CLKIN1 ix17888 (.Q (nx17887), .A (nx114)) ;
    CLKIN1 ix17693 (.Q (nx17692), .A (nx100)) ;
    CLKIN1 ix18145 (.Q (nx18144), .A (nx94)) ;
    CLKIN1 ix93 (.Q (nx92), .A (nx17529)) ;
    CLKIN1 ix17785 (.Q (nx17784), .A (nx86)) ;
    CLKIN1 ix79 (.Q (nx78), .A (nx17455)) ;
    INV3 ix17521 (.Q (nx17520), .A (nx74)) ;
    CLKIN1 ix65 (.Q (nx64), .A (nx17879)) ;
    CLKIN1 ix17702 (.Q (nx17701), .A (nx62)) ;
    CLKIN1 ix17882 (.Q (nx17881), .A (nx58)) ;
    CLKIN1 ix57 (.Q (nx56), .A (nx17490)) ;
    CLKIN1 ix43 (.Q (nx42), .A (nx17467)) ;
    CLKIN1 ix39 (.Q (nx38), .A (nx17518)) ;
    CLKIN1 ix17554 (.Q (nx17553), .A (nx32)) ;
    CLKIN1 ix29 (.Q (nx28), .A (nx17500)) ;
    CLKIN1 ix27 (.Q (nx26), .A (nx17472)) ;
    CLKIN1 ix23 (.Q (nx22), .A (nx17478)) ;
    CLKIN1 ix17 (.Q (nx16), .A (nx17457)) ;
    CLKIN1 ix15 (.Q (nx14), .A (nx17469)) ;
    CLKIN1 ix13 (.Q (nx12), .A (nx17430)) ;
    CLKIN1 ix9 (.Q (nx8), .A (nx17465)) ;
    CLKIN1 ix7 (.Q (nx6), .A (nx17432)) ;
    INV3 ix17559 (.Q (nx17558), .A (nx4)) ;
    CLKIN1 ix3 (.Q (nx2), .A (nx17446)) ;
    CLKIN1 ix1 (.Q (nx0), .A (nx17444)) ;
    NAND21 ix369 (.Q (nx18280), .A (nx366), .B (nx74)) ;
    XNR22 ix17447 (.Q (nx17446), .A (m[7]), .B (k[7])) ;
    BUF2 ix18788 (.Q (nx18787), .A (nx17446)) ;
endmodule

