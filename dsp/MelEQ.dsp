declare id "melmatcheq";
declare name "Mel-Match EQ";
declare category "Filter";
declare description "EQ using a 26 step Mel Frequency Band ";

import("stdfaust.lib");
rd = library("reducemaps.lib");

//frequency points (20.0, 102.0, 218.0, 351.0, 503.0, 678.0, 878.0, 1107.0, 1369.0, 1669.0, 2013.0, 2407.0, 2857.0, 3373.0,
// 3964.0, 4641.0, 5416.0, 6303.0, 7319.0, 8483.0, 9815.0, 10000.0, 13000.0, 15000.0, 17000.0, 20000.0));

geq = fi.filterbank(3, (51.0, 160.0, 284.5, 427.0, 590.5, 778.0, 992.5, 1238.0, 1519.0, 1841.0, 2210.0, 2632.0, 3115.0, 3668.5, 4302.5, 5028.5, 5859.5, 6811.0, 7901.0, 9149.0, 9907.5, 11500.0, 14000.0, 16000.0, 18500.0));

g1  = vslider("g1   [tooltip:gain (dB) below 20 Hz]"    , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g2  = vslider("g2   [tooltip:gain (dB) at 102 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g3  = vslider("g3   [tooltip:gain (dB) at 218 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g4  = vslider("g4   [tooltip:gain (dB) at 351 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g5  = vslider("g5   [tooltip:gain (dB) at 503 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g6  = vslider("g6   [tooltip:gain (dB) at 678 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g7  = vslider("g7   [tooltip:gain (dB) at 878 Hz]"      , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g8  = vslider("g8   [tooltip:gain (dB) at 1107 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g9  = vslider("g9   [tooltip:gain (dB) at 1369 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g10 = vslider("g10  [tooltip:gain (dB) at 1669 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g11 = vslider("g11  [tooltip:gain (dB) at 2013 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g12 = vslider("g12  [tooltip:gain (dB) at 2407 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g13 = vslider("g13  [tooltip:gain (dB) at 2857 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g14 = vslider("g14  [tooltip:gain (dB) at 3373 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g15 = vslider("g15  [tooltip:gain (dB) at 3964 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g16 = vslider("g16  [tooltip:gain (dB) at 4641 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g17 = vslider("g17  [tooltip:gain (dB) at 5416 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g18 = vslider("g18  [tooltip:gain (dB) at 6303 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g19 = vslider("g19  [tooltip:gain (dB) at 7319 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g20 = vslider("g20  [tooltip:gain (dB) at 8483 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g21 = vslider("g21  [tooltip:gain (dB) at 9815 Hz]"     , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g22 = vslider("g22  [tooltip:gain (dB) at 10000 Hz]"    , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g23 = vslider("g23  [tooltip:gain (dB) at 13000 Hz]"    , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g24 = vslider("g24  [tooltip:gain (dB) at 15000 Hz]"    , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g25 = vslider("g25  [tooltip:gain (dB) at 17000 Hz]"    , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);
g26 = vslider("g26  [tooltip:gain (dB) above 20000 Hz]" , 0, -30, 5.2, 0.1) : ba.db2linear : si.smooth(0.999);

v1(x)		= attach(x, envelop(x) : vbargraph("v1[nomidi:no]" , -70, +5));
v2(x)		= attach(x, envelop(x) : vbargraph("v2[nomidi:no]" , -70, +5));
v3(x)		= attach(x, envelop(x) : vbargraph("v3[nomidi:no]" , -70, +5));
v4(x)		= attach(x, envelop(x) : vbargraph("v4[nomidi:no]" , -70, +5));
v5(x)		= attach(x, envelop(x) : vbargraph("v5[nomidi:no]" , -70, +5));
v6(x)		= attach(x, envelop(x) : vbargraph("v6[nomidi:no]" , -70, +5));
v7(x)		= attach(x, envelop(x) : vbargraph("v7[nomidi:no]" , -70, +5));
v8(x)		= attach(x, envelop(x) : vbargraph("v8[nomidi:no]" , -70, +5));
v9(x)		= attach(x, envelop(x) : vbargraph("v9[nomidi:no]" , -70, +5));
v10(x)		= attach(x, envelop(x) : vbargraph("v10[nomidi:no]", -70, +5));
v11(x)		= attach(x, envelop(x) : vbargraph("v11[nomidi:no]", -70, +5));
v12(x)		= attach(x, envelop(x) : vbargraph("v12[nomidi:no]", -70, +5));
v13(x)		= attach(x, envelop(x) : vbargraph("v13[nomidi:no]", -70, +5));
v14(x)		= attach(x, envelop(x) : vbargraph("v14[nomidi:no]", -70, +5));
v15(x)		= attach(x, envelop(x) : vbargraph("v15[nomidi:no]", -70, +5));
v16(x)		= attach(x, envelop(x) : vbargraph("v16[nomidi:no]", -70, +5));
v17(x)		= attach(x, envelop(x) : vbargraph("v17[nomidi:no]", -70, +5));
v18(x)		= attach(x, envelop(x) : vbargraph("v18[nomidi:no]", -70, +5));
v19(x)		= attach(x, envelop(x) : vbargraph("v19[nomidi:no]", -70, +5));
v20(x)		= attach(x, envelop(x) : vbargraph("v20[nomidi:no]", -70, +5));
v21(x)		= attach(x, envelop(x) : vbargraph("v21[nomidi:no]", -70, +5));
v22(x)		= attach(x, envelop(x) : vbargraph("v22[nomidi:no]", -70, +5));
v23(x)		= attach(x, envelop(x) : vbargraph("v23[nomidi:no]", -70, +5));
v24(x)		= attach(x, envelop(x) : vbargraph("v24[nomidi:no]", -70, +5));
v25(x)		= attach(x, envelop(x) : vbargraph("v25[nomidi:no]", -70, +5));
v26(x)		= attach(x, envelop(x) : vbargraph("v26[nomidi:no]", -70, +5));

envelop         = abs : max ~ (1.0/ma.SR) : rd.maxn(4096) ;

wet = vslider("Morph[name:Morph][tooltip:percentage of processed signal in output signal]",  1.0, 0.0, 1.0, 0.1) : si.smooth(0.999);
dry = 1.0 - wet;
gain = vslider("gain[name:Gain][tooltip:gain (dB)]", 0, -40, 40, 0.1) : ba.db2linear : si.smooth(0.999);

process = _<:*(dry),(*(gain): geq : (*(g26):v26),(*(g25):v25),(*(g24):v24),(*(g23):v23),
                (*(g22):v22),(*(g21):v21),(*(g20):v20),(*(g19):v19),(*(g18):v18),
                (*(g17):v17),(*(g16):v16),(*(g15):v15),(*(g14):v14),(*(g13):v13),(*(g12):v12),
                (*(g11):v11),(*(g10):v10),(*(g9):v9),(*(g8):v8),(*(g7):v7),(*(g6):v6),
                (*(g5):v5),(*(g4):v4),(*(g3):v3),(*(g2):v2),(*(g1):v1) :>*(wet)):>_;
