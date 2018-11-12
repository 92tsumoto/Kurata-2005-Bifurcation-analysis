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
sed -i".org" -e "s/para(15)/ipca.G/g" test.txt
sed -i".org" -e "s/para(97)/ipca.km/g" test.txt
sed -i".org" -e "s/para(7)/icab.pcab/g" test.txt
sed -i".org" -e "s/para(13)/inab.pnab/g" test.txt
sed -i".org" -e "s/para(94)/var.nao/g" test.txt
sed -i".org" -e "s/para(12)/ina.Gna/g" test.txt
sed -i".org" -e "s/para(52)/ina.hc1/g" test.txt
sed -i".org" -e "s/para(53)/ina.hc2/g" test.txt
sed -i".org" -e "s/para(54)/ina.hc3/g" test.txt
sed -i".org" -e "s/para(55)/ina.hc4/g" test.txt
sed -i".org" -e "s/para(56)/ina.hc5/g" test.txt
sed -i".org" -e "s/para(57)/ina.hc6/g" test.txt
sed -i".org" -e "s/para(61)/ina.mc1/g" test.txt
sed -i".org" -e "s/para(62)/ina.mc2/g" test.txt
sed -i".org" -e "s/para(63)/ina.mc3/g" test.txt
sed -i".org" -e "s/para(64)/ina.mc4/g" test.txt
sed -i".org" -e "s/para(65)/ina.u1/g" test.txt
sed -i".org" -e "s/para(66)/ina.u2/g" test.txt
sed -i".org" -e "s/para(2)/ical.Eca/g" test.txt
sed -i".org" -e "s/para(6)/ical.gca/g" test.txt
sed -i".org" -e "s/para(24)/ical.dc1/g" test.txt
sed -i".org" -e "s/para(25)/ical.dc2/g" test.txt
sed -i".org" -e "s/para(26)/ical.dc3/g" test.txt
sed -i".org" -e "s/para(27)/ical.dc4/g" test.txt
sed -i".org" -e "s/para(28)/ical.dc5/g" test.txt
sed -i".org" -e "s/para(29)/ical.dc6/g" test.txt
sed -i".org" -e "s/para(30)/ical.dc7/g" test.txt
sed -i".org" -e "s/para(31)/ical.kc1/g" test.txt
sed -i".org" -e "s/para(32)/ical.kc2/g" test.txt
sed -i".org" -e "s/para(33)/ical.kc3/g" test.txt
sed -i".org" -e "s/para(34)/ical.kc4/g" test.txt
sed -i".org" -e "s/para(35)/ical.kc5/g" test.txt
sed -i".org" -e "s/para(36)/ical.kc6/g" test.txt
sed -i".org" -e "s/para(37)/ical.kc7/g" test.txt
sed -i".org" -e "s/para(92)/ical.kmmca/g" test.txt
sed -i".org" -e "s/para(67)/ito.c1/g" test.txt
sed -i".org" -e "s/para(68)/ito.c2/g" test.txt
sed -i".org" -e "s/para(69)/ito.c3/g" test.txt
sed -i".org" -e "s/para(70)/ito.c4/g" test.txt
sed -i".org" -e "s/para(71)/ito.c5/g" test.txt
sed -i".org" -e "s/para(72)/ito.c6/g" test.txt
sed -i".org" -e "s/para(73)/ito.c7/g" test.txt
sed -i".org" -e "s/para(74)/ito.c8/g" test.txt
sed -i".org" -e "s/para(75)/ito.c9/g" test.txt
sed -i".org" -e "s/para(76)/ito.k1/g" test.txt
sed -i".org" -e "s/para(77)/ito.q1/g" test.txt
sed -i".org" -e "s/para(78)/ito.q10/g" test.txt
sed -i".org" -e "s/para(79)/ito.q2/g" test.txt
sed -i".org" -e "s/para(80)/ito.q3/g" test.txt
sed -i".org" -e "s/para(81)/ito.q4/g" test.txt
sed -i".org" -e "s/para(82)/ito.q5/g" test.txt
sed -i".org" -e "s/para(83)/ito.q6/g" test.txt
sed -i".org" -e "s/para(84)/ito.q7/g" test.txt
sed -i".org" -e "s/para(85)/ito.q8/g" test.txt
sed -i".org" -e "s/para(86)/ito.q9/g" test.txt
sed -i".org" -e "s/para(23)/ito.dVgq/g" test.txt
sed -i".org" -e "s/para(98)/ito.pnato/g" test.txt
sed -i".org" -e "s/para(17)/ito.Gto/g" test.txt
sed -i".org" -e "s/para(3)/var.Ek/g" test.txt
sed -i".org" -e "s/para(9)/ikr.Gkr/g" test.txt
sed -i".org" -e "s/para(100)/ikr.rate/g" test.txt
sed -i".org" -e "s/para(43)/ikr.c1/g" test.txt
sed -i".org" -e "s/para(44)/ikr.c2/g" test.txt
sed -i".org" -e "s/para(45)/ikr.c3/g" test.txt
sed -i".org" -e "s/para(46)/ikr.c4/g" test.txt
sed -i".org" -e "s/para(47)/ikr.k1/g" test.txt
sed -i".org" -e "s/para(48)/ikr.k2/g" test.txt
sed -i".org" -e "s/para(8)/ik1.Gk1/g" test.txt
sed -i".org" -e "s/para(38)/ik1.c1/g" test.txt
sed -i".org" -e "s/para(39)/ik1.c2/g" test.txt
sed -i".org" -e "s/para(40)/ik1.c3/g" test.txt
sed -i".org" -e "s/para(41)/ik1.c4/g" test.txt
sed -i".org" -e "s/para(42)/ik1.c5/g" test.txt
sed -i".org" -e "s/para(38)/ik1.c1/g" test.txt
sed -i".org" -e "s/para(10)/iks.Gks/g" test.txt
sed -i".org" -e "s/para(49)/iks.c1/g" test.txt
sed -i".org" -e "s/para(50)/iks.c2/g" test.txt
sed -i".org" -e "s/para(90)/var.ki/g" test.txt
sed -i".org" -e "s/para(99)/var.prnak/g" test.txt
sed -i".org" -e "s/para(51)/iks.k1/g" test.txt
sed -i".org" -e "s/para(95)/ncx.c1/g" test.txt
sed -i".org" -e "s/para(96)/ncx.c2/g" test.txt
sed -i".org" -e "s/para(14)/inak.G/g" test.txt
sed -i".org" -e "s/para(58)/inak.c1/g" test.txt
sed -i".org" -e "s/para(59)/inak.c2/g" test.txt
sed -i".org" -e "s/para(60)/inak.c3/g" test.txt
sed -i".org" -e "s/para(87)/var.kbtc/g" test.txt
sed -i".org" -e "s/para(91)/var.kktc/g" test.txt
sed -i".org" -e "s/para(20)/var.concTc/g" test.txt
sed -i".org" -e "s/para(21)/var.conccm/g" test.txt
sed -i".org" -e "s/para(88)/var.kdcm/g" test.txt
sed -i".org" -e "s/para(18)/jup.pup/g" test.txt
sed -i".org" -e "s/para(93)/jup.kup/g" test.txt
sed -i".org" -e "s/para(11)/jleak.pleak/g" test.txt
sed -i".org" -e "s/para(16)/jrel.prel/g" test.txt
sed -i".org" -e "s/para(101)/jtr.tau/g" test.txt
sed -i".org" -e "s/para(102)/jrel.taudf/g" test.txt
sed -i".org" -e "s/para(103)/jrel.taudr/g" test.txt
sed -i".org" -e "s/para(22)/var.conccq/g" test.txt
sed -i".org" -e "s/para(89)/var.kdcq/g" test.txt
sed -i".org" -e "s/para(1)/var.CapHV/g" test.txt
sed -i".org" -e "s/para(4)/F/g" test.txt
sed -i".org" -e "s/para(5)/var.FRT/g" test.txt
sed -i".org" -e "s/para(19)/var.RTF/g" test.txt
sed -i".org" -e "s/para(104)/var.vi/g" test.txt
sed -i".org" -e "s/para(105)/var.vrel/g" test.txt
sed -i".org" -e "s/para(106)/var.vup/g" test.txt
sed -i".org" -e "s/para(107)/var.Istim/g" test.txt
sed -i".org" -e "s/para(108)/var.Istim2/g" test.txt
sed -i".org" -e "s/para(109)/var.omega/g" test.txt
sed -i".org" -e "s/x\[1\]\^3/x\[1\]\*x\[1\]\*x\[1\]/g" test.txt
sed -i".org" -e "s/x\[9\]\^3/x\[9\]\*x\[9\]\*x\[9\]/g" test.txt
sed -i".org" -e "s/x\[10\]\^3/x\[10\]\*x\[10\]\*x\[10\]/g" test.txt
sed -i".org" -e "s/x\[12\]\^3/x\[12\]\*x\[12\]\*x\[12\]/g" test.txt
sed -i".org" -e "s/x\[15\]\^3/x\[15\]\*x\[15\]\*x\[15\]/g" test.txt
sed -i".org" -e "s/x\[1\]\^2/x\[1\]\*x\[1\]/g" test.txt
sed -i".org" -e "s/x\[2\]\^2/x\[2\]\*x\[2\]/g" test.txt
sed -i".org" -e "s/x\[8\]\^2/x\[8\]\*x\[8\]/g" test.txt
sed -i".org" -e "s/x\[9\]\^2/x\[9\]\*x\[9\]/g" test.txt
sed -i".org" -e "s/x\[10\]\^2/x\[10\]\*x\[10\]/g" test.txt
sed -i".org" -e "s/x\[12\]\^2/x\[12\]\*x\[12\]/g" test.txt
sed -i".org" -e "s/x\[15\]\^2/x\[15\]\*x\[15\]/g" test.txt
sed -i".org" -e "s/10\^(1\/2)/sqrt(10)/g" test.txt
sed -i".org" -e "s/ical.kc4\^2/ical.kc4\*ical.kc4/g" test.txt
sed -i".org" -e "s/(1\/x\[15\])\^(1\/2)/sqrt(1\/x\[15\])/g" test.txt
sed -i".org" -e "s/(inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-(var.FRT\*x\[0\])\/10) + 1)\^2/(inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-(var.FRT\*x\[0\])\/10) + 1)\*(inak.c3\*exp(-var.FRT\*x\[0\]) + inak.c2\*exp(-(var.FRT\*x\[0\])\/10) + 1)/g" test.txt
sed -i".org" -e "s/(exp((ikr.k1 + x\[0\])\/ikr.k2) + 1)\^2/(exp((ikr.k1 + x\[0\])\/ikr.k2) + 1)\*(exp((ikr.k1 + x\[0\])\/ikr.k2) + 1)/g" test.txt
sed -i".org" -e "s/(exp(- ina.mc2\/10 - x\[0\]\/10) - 1)\^2/(exp(- ina.mc2\/10 - x\[0\]\/10) - 1)\*(exp(- ina.mc2\/10 - x\[0\]\/10) - 1)/g" test.txt
sed -i".org" -e "s/(ical.kc7 - x\[0\])\^2/(ical.kc7 - x\[0\])\*(ical.kc7 - x\[0\])/g" test.txt
sed -i".org" -e "s/(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)\^2/(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)\*(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)/g" test.txt
sed -i".org" -e "s/(x\[12\]\/ical.kmmca + 1)\^2/(x\[12\]\/ical.kmmca + 1)\*(x\[12\]\/ical.kmmca + 1)/g" test.txt
sed -i".org" -e "s/tanh(ina.hc1 + ina.hc2\*x\[0\])\^2/tanh(ina.hc1 + ina.hc2\*x\[0\])\*tanh(ina.hc1 + ina.hc2\*x\[0\])/g" test.txt
sed -i".org" -e "s/(var.kdcm + x\[12\])\^2/((var.kdcm + x\[12\])\*(var.kdcm + x\[12\]))/g" test.txt
sed -i".org" -e "s/(var.kdcq + x\[13\])\^2/((var.kdcq + x\[13\])\*(var.kdcq + x\[13\]))/g" test.txt
sed -i".org" -e "s/(exp(47\/59 - (5\*x\[0\])\/59) + 1)\^(1\/2)/sqrt(exp(47\/59 - (5\*x\[0\])\/59) + 1)/g" test.txt
sed -i".org" -e "s/(ipca.km + x\[12\])\^2/((ipca.km + x\[12\])\*(ipca.km + x\[12\]))/g" test.txt
sed -i".org" -e "s/((10\*sqrt(10)\*sqrt(1\/x\[15\]))\/x\[15\] + 1)\^2/((10\*sqrt(10)\*sqrt(1\/x\[15\]))\/x\[15\] + 1)\*((10\*sqrt(10)\*sqrt(1\/x\[15\]))\/x\[15\] + 1)/g" test.txt
sed -i".org" -e "s/tanh(ina.hc5\*(ina.hc6 + x\[0\]))\^2/tanh(ina.hc5\*(ina.hc6 + x\[0\]))\*tanh(ina.hc5\*(ina.hc6 + x\[0\]))/g" test.txt
sed -i".org" -e "s/(tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1)\^2/((tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1)\*(tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1))/g" test.txt
sed -i".org" -e "s/(ina.hc3 + (ina.hc4\*(tanh(ina.hc1 + ina.hc2\*x\[0\]) - 1))\/(tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1))\^2/(ina.hc3 + (ina.hc4\*(tanh(ina.hc1 + ina.hc2\*x\[0\]) - 1))\/(tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1))\*(ina.hc3 + (ina.hc4\*(tanh(ina.hc1 + ina.hc2\*x\[0\]) - 1))\/(tanh(ina.hc5\*(ina.hc6 + x\[0\])) - 1))/g" test.txt
sed -i".org" -e "s/(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1)\^2/(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1)\*(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1)/g" test.txt
sed -i".org" -e "s/(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)\^2/(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)\*(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)/g" test.txt
sed -i".org" -e "s/(exp(-(ical.dc1 + x\[0\])\/ical.dc2) + 1)\^2/(exp(-(ical.dc1 + x\[0\])\/ical.dc2) + 1)\*(exp(-(ical.dc1 + x\[0\])\/ical.dc2) + 1)/g" test.txt
sed -i".org" -e "s/(exp(x\[0\]\/5 + 1) + 1)\^2/(exp(x\[0\]\/5 + 1) + 1)\*(exp(x\[0\]\/5 + 1) + 1)/g" test.txt
sed -i".org" -e "s/(exp((ical.kc1 + x\[0\])\/ical.kc2) + 1)\^2/(exp((ical.kc1 + x\[0\])\/ical.kc2) + 1)\*(exp((ical.kc1 + x\[0\])\/ical.kc2) + 1)/g" test.txt
sed -i".org" -e "s/(exp(ito.c9\*(ito.c8 - x\[0\])) + 1)\^2/((exp(ito.c9\*(ito.c8 - x\[0\])) + 1)\*(exp(ito.c9\*(ito.c8 - x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(ito.c4\*(ito.c3 - x\[0\])) + 1)\^2/((exp(ito.c4\*(ito.c3 - x\[0\])) + 1)\*(exp(ito.c4\*(ito.c3 - x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(-ito.q10\*(ito.q8 + x\[0\])) + 1)\^2/((exp(-ito.q10\*(ito.q8 + x\[0\])) + 1)\*(exp(-ito.q10\*(ito.q8 + x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(-ito.q5\*(ito.q3 + x\[0\])) + 1)\^2/((exp(-ito.q5\*(ito.q3 + x\[0\])) + 1)\*(exp(-ito.q5\*(ito.q3 + x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1)\^2/((exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1)\*(exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1)\^2/((exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1)\*(exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp(- x\[0\]\/5 - 14\/5) - 1)\^2/(exp(- x\[0\]\/5 - 14\/5) - 1)\*(exp(- x\[0\]\/5 - 14\/5) - 1)/g" test.txt
sed -i".org" -e "s/(exp(-(ikr.c3 - x\[0\])\/ikr.c4) - 1)\^2/(exp(-(ikr.c3 - x\[0\])\/ikr.c4) - 1)\*(exp(-(ikr.c3 - x\[0\])\/ikr.c4) - 1)/g" test.txt
sed -i".org" -e "s/(exp(- (10\*x\[0\])\/77 - 20\/11) + 1)\^2/(exp(- (10\*x\[0\])\/77 - 20\/11) + 1)\*(exp(- (10\*x\[0\])\/77 - 20\/11) + 1)/g" test.txt
sed -i".org" -e "s/(exp(47\/59 - (5\*x\[0\])\/59) + 1)\^(3\/2)/(exp(47\/59 - (5\*x\[0\])\/59) + 1)\*sqrt(exp(47\/59 - (5\*x\[0\])\/59) + 1)/g" test.txt
sed -i".org" -e "s/(iks.c1 + iks.c2\/(exp(- (10\*x\[0\])\/113 - 220\/113) + 1))\^2/(iks.c1 + iks.c2\/(exp(- (10\*x\[0\])\/113 - 220\/113) + 1))\*(iks.c1 + iks.c2\/(exp(- (10\*x\[0\])\/113 - 220\/113) + 1))/g" test.txt
sed -i".org" -e "s/(exp(- (10\*x\[0\])\/113 - 220\/113) + 1)\^2/(exp(- (10\*x\[0\])\/113 - 220\/113) + 1)\*(exp(- (10\*x\[0\])\/113 - 220\/113) + 1)/g" test.txt
sed -i".org" -e "s/(jup.kup\*jup.kup + x\[12\]\*x\[12\])\^2/((jup.kup\*jup.kup + x\[12\]\*x\[12\])\*(jup.kup\*jup.kup + x\[12\]\*x\[12\]))/g" test.txt
sed -i".org" -e "s/((var.conccm\*var.kdcm)\/((var.kdcm + x\[12\])\*(var.kdcm + x\[12\])) + 1)\^2/((var.conccm\*var.kdcm)\/((var.kdcm + x\[12\])\*(var.kdcm + x\[12\])) + 1)\*((var.conccm\*var.kdcm)\/((var.kdcm + x\[12\])\*(var.kdcm + x\[12\])) + 1)/g" test.txt
sed -i".org" -e "s/(var.kdcm + x\[12\])\^3/(var.kdcm + x\[12\])\*(var.kdcm + x\[12\])\*(var.kdcm + x\[12\])/g" test.txt
sed -i".org" -e "s/((var.conccq\*var.kdcq)\/((var.kdcq + x\[13\])\*(var.kdcq + x\[13\])) + 1)\^2/((var.conccq\*var.kdcq)\/((var.kdcq + x\[13\])\*(var.kdcq + x\[13\])) + 1)\*((var.conccq\*var.kdcq)\/((var.kdcq + x\[13\])\*(var.kdcq + x\[13\])) + 1)/g" test.txt
sed -i".org" -e "s/(var.kdcq + x\[13\])\^3/(var.kdcq + x\[13\])\*(var.kdcq + x\[13\])\*(var.kdcq + x\[13\])/g" test.txt
sed -i".org" -e "s/jup.kup\^2/jup.kup\*jup.kup/g" test.txt
sed -i".org" -e "s/(jup.kup\*jup.kup + x\[12\]\*x\[12\])\^2/((jup.kup\*jup.kup + x\[12\]\*x\[12\])\*(jup.kup\*jup.kup + x\[12\]\*x\[12\]))/g" test.txt
sed -i".org" -e "s/(ina.mc3\*exp(-x\[0\]\/ina.mc4) - (ina.mc1\*(ina.mc2 + x\[0\]))\/(exp(- ina.mc2\/10 - x\[0\]\/10) - 1))\^2/(ina.mc3\*exp(-x\[0\]\/ina.mc4) - (ina.mc1\*(ina.mc2 + x\[0\]))\/(exp(- ina.mc2\/10 - x\[0\]\/10) - 1))\*(ina.mc3\*exp(-x\[0\]\/ina.mc4) - (ina.mc1\*(ina.mc2 + x\[0\]))\/(exp(- ina.mc2\/10 - x\[0\]\/10) - 1))/g" test.txt
sed -i".org" -e "s/((3\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\])) + exp(x\[0\]\/10 - var.Ek\/10 - 1))\*(exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])) + 1) + ik1.c5\*(exp(var.Ek\/2 - x\[0\]\/2) + 1))\^2/(((3\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\])) + exp(x\[0\]\/10 - var.Ek\/10 - 1))\*(exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])) + 1) + ik1.c5\*(exp(var.Ek\/2 - x\[0\]\/2) + 1))\*((3\*exp(ik1.c3\*(ik1.c4 - var.Ek + x\[0\])) + exp(x\[0\]\/10 - var.Ek\/10 - 1))\*(exp(-ik1.c1\*(var.Ek + ik1.c2 - x\[0\])) + 1) + ik1.c5\*(exp(var.Ek\/2 - x\[0\]\/2) + 1)))/g" test.txt
sed -i".org" -e "s/(((7\*ical.dc3)\/5 + 49\/(25\*(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)))\/(exp(x\[0\]\/5 + 1) + 1) + 1\/(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1))\^2/(((7\*ical.dc3)\/5 + 49\/(25\*(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)))\/(exp(x\[0\]\/5 + 1) + 1) + 1\/(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1))\*(((7\*ical.dc3)\/5 + 49\/(25\*(exp(-(ical.dc4 + x\[0\])\/ical.dc5) + 1)))\/(exp(x\[0\]\/5 + 1) + 1) + 1\/(exp((ical.dc6 - x\[0\])\/ical.dc7) + 1))/g" test.txt
sed -i".org" -e "s/((ito.c8\*x\[0\] + ito.c5\*exp(ito.c6\*(ito.c7 - x\[0\])))\/(exp(ito.c9\*(ito.c8 - x\[0\])) + 1) + (ito.c1\*exp(ito.c2\*(ito.c3 - x\[0\])))\/(exp(ito.c4\*(ito.c3 - x\[0\])) + 1))\^2/((ito.c8\*x\[0\] + ito.c5\*exp(ito.c6\*(ito.c7 - x\[0\])))\/(exp(ito.c9\*(ito.c8 - x\[0\])) + 1) + (ito.c1\*exp(ito.c2\*(ito.c3 - x\[0\])))\/(exp(ito.c4\*(ito.c3 - x\[0\])) + 1))\*((ito.c8\*x\[0\] + ito.c5\*exp(ito.c6\*(ito.c7 - x\[0\])))\/(exp(ito.c9\*(ito.c8 - x\[0\])) + 1) + (ito.c1\*exp(ito.c2\*(ito.c3 - x\[0\])))\/(exp(ito.c4\*(ito.c3 - x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1))\^2/((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1))\*((ito.q1\*exp(-ito.q2\*(ito.q3 - ito.dVgq + x\[0\])) - ito.q4\*(ito.dVgq - x\[0\]))\/(exp(-ito.q5\*(ito.q3 - ito.dVgq + x\[0\])) + 1) + (ito.q6\*exp(-ito.q7\*(ito.q8 - ito.dVgq + x\[0\])) - ito.q9\*(ito.dVgq - x\[0\]))\/(exp(-ito.q10\*(ito.q8 - ito.dVgq + x\[0\])) + 1))/g" test.txt
sed -i".org" -e "s/(exp((10\*icab.pcab\*(x\[0\] - (var.RTF\*log(2\/x\[12\]))\/2))\/9 - (20\*ncx.c1\*(2\*x\[15\]\*x\[15\]\*x\[15\]\*exp((7\*var.FRT\*x\[0\])\/20) - ncx.c2\*x\[12\]\*exp(-(13\*var.FRT\*x\[0\])\/20)))\/(9\*(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)) + (10\*ipca.G\*x\[12\])\/(9\*(ipca.km + x\[12\])) - (10\*ical.gca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(9\*(x\[12\]\/ical.kmmca + 1)) + 50\/9) + 1)\^2/((exp((10\*icab.pcab\*(x\[0\] - (var.RTF\*log(2\/x\[12\]))\/2))\/9 - (20\*ncx.c1\*(2\*x\[15\]\*x\[15\]\*x\[15\]\*exp((7\*var.FRT\*x\[0\])\/20) - ncx.c2\*x\[12\]\*exp(-(13\*var.FRT\*x\[0\])\/20)))\/(9\*(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)) + (10\*ipca.G\*x\[12\])\/(9\*(ipca.km + x\[12\])) - (10\*ical.gca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(9\*(x\[12\]\/ical.kmmca + 1)) + 50\/9) + 1)\*(exp((10\*icab.pcab\*(x\[0\] - (var.RTF\*log(2\/x\[12\]))\/2))\/9 - (20\*ncx.c1\*(2\*x\[15\]\*x\[15\]\*x\[15\]\*exp((7\*var.FRT\*x\[0\])\/20) - ncx.c2\*x\[12\]\*exp(-(13\*var.FRT\*x\[0\])\/20)))\/(9\*(exp(-(13\*var.FRT\*x\[0\])\/20)\/10 + 1)) + (10\*ipca.G\*x\[12\])\/(9\*(ipca.km + x\[12\])) - (10\*ical.gca\*x\[3\]\*x\[4\]\*(ical.Eca - x\[0\]))\/(9\*(x\[12\]\/ical.kmmca + 1)) + 50\/9) + 1))/g" test.txt
sed -i".org" -e "s/jup.kup\^2/jup.kup\*jup.kup/g" test.txt
