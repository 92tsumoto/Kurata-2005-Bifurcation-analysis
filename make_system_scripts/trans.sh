#!/bin/sh
# PL-gnu.sh

i="1 2 3 4 5 6 7 8 9 10 \
11 12 13 14 15 16 17 18 19 20 \
21 22 23 24 25 26 27 28 29 30 \
31 32 33 34 35 36 37 38 39 40 \
41 42 43 44 45 46 47 48 49 50 \
51 52 53 54 55 56 57 58 59 60 \
61 62 63 64 65 66 67 68 69 70 \
71 72 73 74 75 76 77 78 79 80 \
81 82 83 84 85 86 87 88 89 90 \
91 92 93 94 95 96 97 98 99 100 \
101 102 103 104 105 106 107 108 109 110 \
111 112 113 114 115 116 117 118 119 120 \
121 122 123 124 125 126 127 128 129 130 \
131 132 133 134 135 136 137 138 139 140 \
141 142 143 144 145 146 147 148 149 150 \
151 152 153 154 155 156 157 158 159 160 \
161 162 163 164 165 166 167 168 169 170 \
171 172 173 174 175 176 177 178 179 180 \
181 182 183 184 185 186 187 188 189 190 \
191 192 193 194 195 196 197 198 199 200 \
201 202 203 204 205 206 207 208 209 210 \
211 212 213 214 215 216 217 218 219 220 \
221 222 223 224 225 226 227 228 229 230 \
231 232 233 234 235 236 237 238 239 240 \
241 242 243 244 245 246 247 248 249 250 \
251 252 253 254 255 256 257 258 259 260 \
261 262 263 264 265 266 267 268 269 270 \
271 272 273 274 275 276 277 278 279 280 \
281 282 283 284 285 286 287 288 289 290 \
291 292 293 294 295 296 297 298 299 300 \
"
a=1
for n in ${i}
do
echo "n=$n"
k=`expr $n - $a`
sed -i".org" -e "s/x($n)/x\[$k\]/g" test.txt
sed -i".org" -e "s/xdot($n)/f\[$k\]/g" test.txt
done
sed -i".org" -e "s/para(1)/var.CapHV/g" test.txt
sed -i".org" -e "s/para(2)/ical.Eca/g" test.txt
sed -i".org" -e "s/para(3)/var.Ek/g" test.txt
sed -i".org" -e "s/para(4)/F/g" test.txt
sed -i".org" -e "s/para(5)/var.FRT/g" test.txt
sed -i".org" -e "s/para(6)/ical.gca/g" test.txt
sed -i".org" -e "s/para(7)/icab.pcab/g" test.txt
sed -i".org" -e "s/para(8)/ik1.Gk1/g" test.txt
sed -i".org" -e "s/para(9)/ikr.Gkr/g" test.txt
sed -i".org" -e "s/para(10)/iks.Gks/g" test.txt
sed -i".org" -e "s/para(11)/jleak.pleak/g" test.txt
sed -i".org" -e "s/para(12)/ina.Gna/g" test.txt
sed -i".org" -e "s/para(13)/inab.pnab/g" test.txt
sed -i".org" -e "s/para(14)/inak.G/g" test.txt
sed -i".org" -e "s/para(15)/ipca.G/g" test.txt
sed -i".org" -e "s/para(16)/jrel.prel/g" test.txt
sed -i".org" -e "s/para(17)/ito.Gto/g" test.txt
sed -i".org" -e "s/para(18)/jup.pup/g" test.txt
sed -i".org" -e "s/para(19)/var.RTF/g" test.txt
sed -i".org" -e "s/para(20)/cai.c1/g" test.txt
sed -i".org" -e "s/para(21)/cai.c2/g" test.txt
sed -i".org" -e "s/para(22)/cai.c3/g" test.txt
sed -i".org" -e "s/para(23)/var.cao/g" test.txt
sed -i".org" -e "s/para(24)/var.concTc/g" test.txt
sed -i".org" -e "s/para(25)/var.conccm/g" test.txt
sed -i".org" -e "s/para(26)/var.conccq/g" test.txt
sed -i".org" -e "s/para(27)/ito.dVgq/g" test.txt
sed -i".org" -e "s/para(28)/ical.dc1/g" test.txt
sed -i".org" -e "s/para(29)/ical.dc2/g" test.txt
sed -i".org" -e "s/para(30)/ical.dc3/g" test.txt
sed -i".org" -e "s/para(31)/ical.dc4/g" test.txt
sed -i".org" -e "s/para(32)/ical.dc5/g" test.txt
sed -i".org" -e "s/para(33)/ical.dc6/g" test.txt
sed -i".org" -e "s/para(34)/ical.dc7/g" test.txt
sed -i".org" -e "s/para(35)/ical.dc8/g" test.txt
sed -i".org" -e "s/para(36)/ical.dc9/g" test.txt
sed -i".org" -e "s/para(37)/ical.kc1/g" test.txt
sed -i".org" -e "s/para(38)/ical.kc2/g" test.txt
sed -i".org" -e "s/para(39)/ical.kc3/g" test.txt
sed -i".org" -e "s/para(40)/ical.kc4/g" test.txt
sed -i".org" -e "s/para(41)/ical.kc5/g" test.txt
sed -i".org" -e "s/para(42)/ical.kc6/g" test.txt
sed -i".org" -e "s/para(43)/ical.kc7/g" test.txt
sed -i".org" -e "s/para(44)/ik1.c1/g" test.txt
sed -i".org" -e "s/para(45)/ik1.c2/g" test.txt
sed -i".org" -e "s/para(46)/ik1.c3/g" test.txt
sed -i".org" -e "s/para(47)/ik1.c4/g" test.txt
sed -i".org" -e "s/para(48)/ik1.c5/g" test.txt
sed -i".org" -e "s/para(49)/ik1.c6/g" test.txt
sed -i".org" -e "s/para(50)/ik1.c7/g" test.txt
sed -i".org" -e "s/para(51)/ik1.c8/g" test.txt
sed -i".org" -e "s/para(52)/ikr.c1/g" test.txt
sed -i".org" -e "s/para(53)/ikr.c2/g" test.txt
sed -i".org" -e "s/para(54)/ikr.c3/g" test.txt
sed -i".org" -e "s/para(55)/ikr.c4/g" test.txt
sed -i".org" -e "s/para(56)/ikr.c5/g" test.txt
sed -i".org" -e "s/para(57)/ikr.c6/g" test.txt
sed -i".org" -e "s/para(58)/ikr.c7/g" test.txt
sed -i".org" -e "s/para(59)/ikr.k1/g" test.txt
sed -i".org" -e "s/para(60)/ikr.k2/g" test.txt
sed -i".org" -e "s/para(61)/iks.c1/g" test.txt
sed -i".org" -e "s/para(62)/iks.c2/g" test.txt
sed -i".org" -e "s/para(63)/iks.c3/g" test.txt
sed -i".org" -e "s/para(64)/iks.c4/g" test.txt
sed -i".org" -e "s/para(65)/iks.c5/g" test.txt
sed -i".org" -e "s/para(66)/iks.c6/g" test.txt
sed -i".org" -e "s/para(67)/iks.k1/g" test.txt
sed -i".org" -e "s/para(68)/ina.hc1/g" test.txt
sed -i".org" -e "s/para(69)/ina.hc2/g" test.txt
sed -i".org" -e "s/para(70)/ina.hc3/g" test.txt
sed -i".org" -e "s/para(71)/ina.hc4/g" test.txt
sed -i".org" -e "s/para(72)/ina.hc5/g" test.txt
sed -i".org" -e "s/para(73)/ina.hc6/g" test.txt
sed -i".org" -e "s/para(74)/ina.hc7/g" test.txt
sed -i".org" -e "s/para(75)/inak.c1/g" test.txt
sed -i".org" -e "s/para(76)/inak.c2/g" test.txt
sed -i".org" -e "s/para(77)/inak.c3/g" test.txt
sed -i".org" -e "s/para(78)/inak.c4/g" test.txt
sed -i".org" -e "s/para(79)/inak.c5/g" test.txt
sed -i".org" -e "s/para(80)/ina.mc1/g" test.txt
sed -i".org" -e "s/para(81)/ina.mc2/g" test.txt
sed -i".org" -e "s/para(82)/ina.mc3/g" test.txt
sed -i".org" -e "s/para(83)/ina.mc4/g" test.txt
sed -i".org" -e "s/para(84)/ina.mc5/g" test.txt
sed -i".org" -e "s/para(85)/ina.u1/g" test.txt
sed -i".org" -e "s/para(86)/ina.u2/g" test.txt
sed -i".org" -e "s/para(87)/ito.c1/g" test.txt
sed -i".org" -e "s/para(88)/ito.c2/g" test.txt
sed -i".org" -e "s/para(89)/ito.c3/g" test.txt
sed -i".org" -e "s/para(90)/ito.c4/g" test.txt
sed -i".org" -e "s/para(91)/ito.c5/g" test.txt
sed -i".org" -e "s/para(92)/ito.c6/g" test.txt
sed -i".org" -e "s/para(93)/ito.c7/g" test.txt
sed -i".org" -e "s/para(94)/ito.c8/g" test.txt
sed -i".org" -e "s/para(95)/ito.c9/g" test.txt
sed -i".org" -e "s/para(96)/ito.k1/g" test.txt
sed -i".org" -e "s/para(97)/ito.q1/g" test.txt
sed -i".org" -e "s/para(98)/ito.q10/g" test.txt
sed -i".org" -e "s/para(99)/ito.q2/g" test.txt
sed -i".org" -e "s/para(100)/ito.q3/g" test.txt
sed -i".org" -e "s/para(101)/ito.q4/g" test.txt
sed -i".org" -e "s/para(102)/ito.q5/g" test.txt
sed -i".org" -e "s/para(103)/ito.q6/g" test.txt
sed -i".org" -e "s/para(104)/ito.q7/g" test.txt
sed -i".org" -e "s/para(105)/ito.q8/g" test.txt
sed -i".org" -e "s/para(106)/ito.q9/g" test.txt
sed -i".org" -e "s/para(107)/var.kbtc/g" test.txt
sed -i".org" -e "s/para(108)/var.kdcm/g" test.txt
sed -i".org" -e "s/para(109)/var.kdcq/g" test.txt
sed -i".org" -e "s/para(110)/var.ki/g" test.txt
sed -i".org" -e "s/para(111)/var.kktc/g" test.txt
sed -i".org" -e "s/para(112)/ical.kmmca/g" test.txt
sed -i".org" -e "s/para(113)/jup.kup/g" test.txt
sed -i".org" -e "s/para(114)/nai.c1/g" test.txt
sed -i".org" -e "s/para(115)/var.nao/g" test.txt
sed -i".org" -e "s/para(116)/ncx.c1/g" test.txt
sed -i".org" -e "s/para(117)/ncx.c2/g" test.txt
sed -i".org" -e "s/para(118)/ncx.c3/g" test.txt
sed -i".org" -e "s/para(119)/ncx.ksat/g" test.txt
sed -i".org" -e "s/para(120)/ncx.rncx/g" test.txt
sed -i".org" -e "s/para(121)/ipca.km/g" test.txt
sed -i".org" -e "s/para(122)/ito.pnato/g" test.txt
sed -i".org" -e "s/para(123)/var.prnak/g" test.txt
sed -i".org" -e "s/para(124)/ikr.rate/g" test.txt
sed -i".org" -e "s/para(125)/jtr.tau/g" test.txt
sed -i".org" -e "s/para(126)/jrel.taudf/g" test.txt
sed -i".org" -e "s/para(127)/jrel.taudr/g" test.txt
sed -i".org" -e "s/para(128)/var.uni/g" test.txt
sed -i".org" -e "s/para(129)/var.vi/g" test.txt
sed -i".org" -e "s/para(130)/var.vrel/g" test.txt
sed -i".org" -e "s/para(131)/var.vup/g" test.txt
sed -i".org" -e "s/para(132)/var.zca/g" test.txt
sed -i".org" -e "s/para(133)/var.zna/g" test.txt
sed -i".org" -e "s/para(134)/var.Istim/g" test.txt
sed -i".org" -e "s/para(135)/var.Istim2/g" test.txt
sed -i".org" -e "s/para(136)/var.omega/g" test.txt

sed -i".org" -e "s/x\[8\]\^2/x\[8\]\*x\[8\]/g" test.txt
sed -i".org" -e "s/x\[15\]\^3/x\[15\]\*x\[15\]\*x\[15\]/g" test.txt
sed -i".org" -e "s/x\[1\]\^3/x\[1\]\*x\[1\]\*x\[1\]/g" test.txt
sed -i".org" -e "s/x\[2\]\^2/x\[2\]\*x\[2\]/g" test.txt
sed -i".org" -e "s/(inak.c4\/x\[15\])\^(1\/2)/sqrt(inak.c4\/x\[15\])/g" test.txt
sed -i".org" -e "s/ical.kc4\^2/ical.kc4\*ical.kc4/g" test.txt
sed -i".org" -e "s/(ical.kc7 - x\[0\])\^2/(ical.kc7 - x\[0\])\*(ical.kc7 - x\[0\])/g" test.txt
sed -i".org" -e "s/(var.uni + exp((iks.c3 - x\[0\])\/iks.c4))\^(1\/2)/sqrt(var.uni + exp((iks.c3 - x\[0\])\/iks.c4))/g" test.txt
sed -i".org" -e "s/x\[12\]\^2/x\[12\]\*x\[12\]/g" test.txt
sed -i".org" -e "s/jup.kup\^2/jup.kup\*jup.kup/g" test.txt
sed -i".org" -e "s/x\[9\]\^3/x\[9\]\*x\[9\]\*x\[9\]/g" test.txt
sed -i".org" -e "s/x\[10\]\^3/x\[10\]\*x\[10\]\*x\[10\]/g" test.txt
sed -i".org" -e "s/(var.kdcq + x\[13\])\^2/(var.kdcq + x\[13\])\*(var.kdcq + x\[13\])/g" test.txt
sed -i".org" -e "s/(var.kdcm + x\[12\])\^2/(var.kdcm + x\[12\])\*(var.kdcm + x\[12\])/g" test.txt
sed -i".org" -e "s/(var.uni + inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-var.FRT\*inak.c5\*x\[0\]))\^2/(var.uni + inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-var.FRT\*inak.c5\*x\[0\]))\*(var.uni + inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-var.FRT\*inak.c5\*x\[0\]))/g" test.txt
sed -i".org" -e "s/((var.uni + exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])))\*(exp(-ik1.c5\*(var.Ek + ik1.c7 - x\[0\])) + ik1.c8\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\]))) + ik1.c5\*(var.uni + exp(ik1.c6\*(var.Ek - x\[0\]))))\^2/(((var.uni + exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])))\*(exp(-ik1.c5\*(var.Ek + ik1.c7 - x\[0\])) + ik1.c8\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\]))) + ik1.c5\*(var.uni + exp(ik1.c6\*(var.Ek - x\[0\]))))\*((var.uni + exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])))\*(exp(-ik1.c5\*(var.Ek + ik1.c7 - x\[0\])) + ik1.c8\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\]))) + ik1.c5\*(var.uni + exp(ik1.c6\*(var.Ek - x\[0\])))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((ikr.k1 + x\[0\])\/ikr.k2))\^2/(var.uni + exp((ikr.k1 + x\[0\])\/ikr.k2))\*(var.uni + exp((ikr.k1 + x\[0\])\/ikr.k2))/g" test.txt
sed -i".org" -e "s/(var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\]))\^2/((var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\]))\*(var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\])))/g" test.txt
sed -i".org" -e "s/x\[15\]\^2/(x\[15\]\*x\[15\])/g" test.txt
sed -i".org" -e "s/inak.c4\^2/inak.c4\*inak.c4/g" test.txt
sed -i".org" -e "s/(var.uni + (inak.c4\*sqrt(inak.c4\/x\[15\]))\/x\[15\])\^2/(var.uni + (inak.c4\*sqrt(inak.c4\/x\[15\]))\/x\[15\])\*(var.uni + (inak.c4\*sqrt(inak.c4\/x\[15\]))\/x\[15\])/g" test.txt
sed -i".org" -e "s/(ipca.km + x\[12\])\^2/((ipca.km + x\[12\])\*(ipca.km + x\[12\]))/g" test.txt
sed -i".org" -e "s/(ical.kmmca + x\[12\])\^2/((ical.kmmca + x\[12\])\*(ical.kmmca + x\[12\]))/g" test.txt
sed -i".org" -e "s/x\[1\]\^2/x\[1\]\*x\[1\]/g" test.txt
sed -i".org" -e "s/(var.uni - exp(-(ina.mc2 + x\[0\])\/ina.mc5))\^2/(var.uni - exp(-(ina.mc2 + x\[0\])\/ina.mc5))\*(var.uni - exp(-(ina.mc2 + x\[0\])\/ina.mc5))/g" test.txt
sed -i".org" -e "s/tanh(ina.hc1 + ina.hc2\*x\[0\])\^2 - 1/tanh(ina.hc1 + ina.hc2\*x\[0\])\*tanh(ina.hc1 + ina.hc2\*x\[0\]) - 1.0/g" test.txt
sed -i".org" -e "s/tanh(ina.hc5\*(ina.hc6 + x\[0\]))\^2 - 1/tanh(ina.hc5\*(ina.hc6 + x\[0\]))\*tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1.0/g" test.txt
sed -i".org" -e "s/(var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\])))\^2/((var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\])))\*(var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(ina.hc3 + (ina.hc4\*(var.uni - tanh(ina.hc1 + ina.hc2\*x\[0\])))\/(var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\]))))\^2/(ina.hc3 + (ina.hc4\*(var.uni - tanh(ina.hc1 + ina.hc2\*x\[0\])))\/(var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\]))))\*(ina.hc3 + (ina.hc4\*(var.uni - tanh(ina.hc1 + ina.hc2\*x\[0\])))\/(var.uni - tanh(ina.hc5\*(ina.hc6 + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7))\^2/(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7))\*(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9))\^2/(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9))\*(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9))/g" test.txt
sed -i".org" -e "s/ical.dc8\^2/ical.dc8\*ical.dc8/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))\^2/(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))\*(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))/g" test.txt
sed -i".org" -e "s/(var.uni\/(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7)) + (ical.dc8\*(ical.dc3 + ical.dc8\/(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))))\/(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9)))\^2/(var.uni\/(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7)) + (ical.dc8\*(ical.dc3 + ical.dc8\/(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))))\/(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9)))\*(var.uni\/(var.uni + exp((ical.dc6 - x\[0\])\/ical.dc7)) + (ical.dc8\*(ical.dc3 + ical.dc8\/(var.uni + exp(-(ical.dc4 + x\[0\])\/ical.dc5))))\/(var.uni + exp((ical.dc9 + x\[0\])\/ical.dc9)))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-(ical.dc1 + x\[0\])\/ical.dc2))\^2/(var.uni + exp(-(ical.dc1 + x\[0\])\/ical.dc2))\*(var.uni + exp(-(ical.dc1 + x\[0\])\/ical.dc2))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((ical.kc1 + x\[0\])\/ical.kc2))\^2/(var.uni + exp((ical.kc1 + x\[0\])\/ical.kc2))\*(var.uni + exp((ical.kc1 + x\[0\])\/ical.kc2))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(ito.c9\*(ito.c8 - x\[0\])))\^2/((var.uni + exp(ito.c9\*(ito.c8 - x\[0\])))\*(var.uni + exp(ito.c9\*(ito.c8 - x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(ito.c4\*(ito.c3 - x\[0\])))\^2/((var.uni + exp(ito.c4\*(ito.c3 - x\[0\])))\*(var.uni + exp(ito.c4\*(ito.c3 - x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])))\^2/((var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])))\*(var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])))\^2/((var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])))\*(var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\]))))/g" test.txt
sed -i".org" -e "s/((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\]))) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\]))))\^2/((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\]))) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\]))))\*((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\]))) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(var.uni + exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-ito.q5\*(ito.q3 + x\[0\])))\^2/((var.uni + exp(-ito.q5\*(ito.q3 + x\[0\])))\*(var.uni + exp(-ito.q5\*(ito.q3 + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-ito.q10\*(ito.q8 + x\[0\])))\^2/((var.uni + exp(-ito.q10\*(ito.q8 + x\[0\])))\*(var.uni + exp(-ito.q10\*(ito.q8 + x\[0\]))))/g" test.txt
sed -i".org" -e "s/(var.uni - exp(-(ikr.c5 + x\[0\])\/ikr.c7))\^2/(var.uni - exp(-(ikr.c5 + x\[0\])\/ikr.c7))\*(var.uni - exp(-(ikr.c5 + x\[0\])\/ikr.c7))/g" test.txt
sed -i".org" -e "s/(var.uni - exp(-(ikr.c3 - x\[0\])\/ikr.c4))\^2/(var.uni - exp(-(ikr.c3 - x\[0\])\/ikr.c4))\*(var.uni - exp(-(ikr.c3 - x\[0\])\/ikr.c4))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-(ikr.c5 + x\[0\])\/ikr.c6))\^2/(var.uni + exp(-(ikr.c5 + x\[0\])\/ikr.c6))\*(var.uni + exp(-(ikr.c5 + x\[0\])\/ikr.c6))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((iks.c3 - x\[0\])\/iks.c4))\^(3\/2)/(var.uni + exp((iks.c3 - x\[0\])\/iks.c4))\*sqrt(var.uni + exp((iks.c3 - x\[0\])\/iks.c4))/g" test.txt
sed -i".org" -e "s/(iks.c1 + iks.c2\/(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6)))\^2/(iks.c1 + iks.c2\/(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6)))\*(iks.c1 + iks.c2\/(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6)))/g" test.txt
sed -i".org" -e "s/(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6))\^2/(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6))\*(var.uni + exp(-(iks.c5 + x\[0\])\/iks.c6))/g" test.txt
sed -i".org" -e "s/(var.uni + exp((cai.c2 + icab.pcab\*(x\[0\] - (var.RTF\*log(var.cao\/x\[12\]))\/var.zca) + (ipca.G\*x\[12\])\/(ipca.km + x\[12\]) + (cai.c1\*ncx.c1\*(ncx.c2\*x\[12\]\*exp(var.FRT\*ncx.c3\*x\[0\]) - var.cao\*x\[15\]\*x\[15\]\*x\[15\]\*exp(var.FRT\*ncx.rncx\*x\[0\])))\/(var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\])) - (ical.gca\*ical.kmmca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(ical.kmmca + x\[12\]))\/cai.c3))\^2/(var.uni + exp((cai.c2 + icab.pcab\*(x\[0\] - (var.RTF\*log(var.cao\/x\[12\]))\/var.zca) + (ipca.G\*x\[12\])\/(ipca.km + x\[12\]) + (cai.c1\*ncx.c1\*(ncx.c2\*x\[12\]\*exp(var.FRT\*ncx.c3\*x\[0\]) - var.cao\*x\[15\]\*x\[15\]\*x\[15\]\*exp(var.FRT\*ncx.rncx\*x\[0\])))\/(var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\])) - (ical.gca\*ical.kmmca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(ical.kmmca + x\[12\]))\/cai.c3))\*(var.uni + exp((cai.c2 + icab.pcab\*(x\[0\] - (var.RTF\*log(var.cao\/x\[12\]))\/var.zca) + (ipca.G\*x\[12\])\/(ipca.km + x\[12\]) + (cai.c1\*ncx.c1\*(ncx.c2\*x\[12\]\*exp(var.FRT\*ncx.c3\*x\[0\]) - var.cao\*x\[15\]\*x\[15\]\*x\[15\]\*exp(var.FRT\*ncx.rncx\*x\[0\])))\/(var.uni + ncx.ksat\*exp(var.FRT\*ncx.c3\*x\[0\])) - (ical.gca\*ical.kmmca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(ical.kmmca + x\[12\]))\/cai.c3))/g" test.txt
sed -i".org" -e "s/x\[12\]\^3/x\[12\]\*x\[12\]\*x\[12\]/g" test.txt
sed -i".org" -e "s/(jup.kup\*jup.kup + x\[12\]\*x\[12\])\^2/((jup.kup\*jup.kup + x\[12\]\*x\[12\])\*(jup.kup\*jup.kup + x\[12\]\*x\[12\]))/g" test.txt
sed -i".org" -e "s/(var.conccm\*var.kdcm + (var.kdcm + x\[12\])\*(var.kdcm + x\[12\]))\^2/(var.conccm\*var.kdcm + (var.kdcm + x\[12\])\*(var.kdcm + x\[12\]))\*(var.conccm\*var.kdcm + (var.kdcm + x\[12\])\*(var.kdcm + x\[12\]))/g" test.txt
sed -i".org" -e "s/x\[9\]\^2/x\[9\]\*x\[9\]/g" test.txt
sed -i".org" -e "s/x\[10\]\^2/x\[10\]\*x\[10\]/g" test.txt
sed -i".org" -e "s/(var.conccq\*var.kdcq + (var.kdcq + x\[13\])\*(var.kdcq + x\[13\]))\^2/(var.conccq\*var.kdcq + (var.kdcq + x\[13\])\*(var.kdcq + x\[13\]))\*(var.conccq\*var.kdcq + (var.kdcq + x\[13\])\*(var.kdcq + x\[13\]))/g" test.txt
#sed -i".org" -e "s/ical.dc8\^2/ical.dc8\*ical.dc8/g" test.txt


