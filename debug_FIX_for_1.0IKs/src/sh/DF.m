%
% Jacobian matrix using at Newton's method
%
void jacobi(double x[])
{

A(1,1)=x(17)-1.0;
A(1,2)=x(33);
A(1,3)=x(49);
A(1,4)=x(65);
A(1,5)=x(81);
A(1,6)=x(97);
A(1,7)=x(113);
A(1,8)=x(129);
A(1,9)=x(145);
A(1,10)=x(161);
A(1,11)=x(177);
A(1,12)=x(193);
A(1,13)=x(209);
A(1,14)=x(225);
A(1,15)=x(241);
A(1,16)=x(257);
A(2,1)=x(18);
A(2,2)=x(34)-1.0;
A(2,3)=x(50);
A(2,4)=x(66);
A(2,5)=x(82);
A(2,6)=x(98);
A(2,7)=x(114);
A(2,8)=x(130);
A(2,9)=x(146);
A(2,10)=x(162);
A(2,11)=x(178);
A(2,12)=x(194);
A(2,13)=x(210);
A(2,14)=x(226);
A(2,15)=x(242);
A(2,16)=x(258);
A(3,1)=x(19);
A(3,2)=x(35);
A(3,3)=x(51)-1.0;
A(3,4)=x(67);
A(3,5)=x(83);
A(3,6)=x(99);
A(3,7)=x(115);
A(3,8)=x(131);
A(3,9)=x(147);
A(3,10)=x(163);
A(3,11)=x(179);
A(3,12)=x(195);
A(3,13)=x(211);
A(3,14)=x(227);
A(3,15)=x(243);
A(3,16)=x(259);
A(4,1)=x(20);
A(4,2)=x(36);
A(4,3)=x(52);
A(4,4)=x(68)-1.0;
A(4,5)=x(84);
A(4,6)=x(100);
A(4,7)=x(116);
A(4,8)=x(132);
A(4,9)=x(148);
A(4,10)=x(164);
A(4,11)=x(180);
A(4,12)=x(196);
A(4,13)=x(212);
A(4,14)=x(228);
A(4,15)=x(244);
A(4,16)=x(260);
A(5,1)=x(21);
A(5,2)=x(37);
A(5,3)=x(53);
A(5,4)=x(69);
A(5,5)=x(85)-1.0;
A(5,6)=x(101);
A(5,7)=x(117);
A(5,8)=x(133);
A(5,9)=x(149);
A(5,10)=x(165);
A(5,11)=x(181);
A(5,12)=x(197);
A(5,13)=x(213);
A(5,14)=x(229);
A(5,15)=x(245);
A(5,16)=x(261);
A(6,1)=x(22);
A(6,2)=x(38);
A(6,3)=x(54);
A(6,4)=x(70);
A(6,5)=x(86);
A(6,6)=x(102)-1.0;
A(6,7)=x(118);
A(6,8)=x(134);
A(6,9)=x(150);
A(6,10)=x(166);
A(6,11)=x(182);
A(6,12)=x(198);
A(6,13)=x(214);
A(6,14)=x(230);
A(6,15)=x(246);
A(6,16)=x(262);
A(7,1)=x(23);
A(7,2)=x(39);
A(7,3)=x(55);
A(7,4)=x(71);
A(7,5)=x(87);
A(7,6)=x(103);
A(7,7)=x(119)-1.0;
A(7,8)=x(135);
A(7,9)=x(151);
A(7,10)=x(167);
A(7,11)=x(183);
A(7,12)=x(199);
A(7,13)=x(215);
A(7,14)=x(231);
A(7,15)=x(247);
A(7,16)=x(263);
A(8,1)=x(24);
A(8,2)=x(40);
A(8,3)=x(56);
A(8,4)=x(72);
A(8,5)=x(88);
A(8,6)=x(104);
A(8,7)=x(120);
A(8,8)=x(136)-1.0;
A(8,9)=x(152);
A(8,10)=x(168);
A(8,11)=x(184);
A(8,12)=x(200);
A(8,13)=x(216);
A(8,14)=x(232);
A(8,15)=x(248);
A(8,16)=x(264);
A(9,1)=x(25);
A(9,2)=x(41);
A(9,3)=x(57);
A(9,4)=x(73);
A(9,5)=x(89);
A(9,6)=x(105);
A(9,7)=x(121);
A(9,8)=x(137);
A(9,9)=x(153)-1.0;
A(9,10)=x(169);
A(9,11)=x(185);
A(9,12)=x(201);
A(9,13)=x(217);
A(9,14)=x(233);
A(9,15)=x(249);
A(9,16)=x(265);
A(10,1)=x(26);
A(10,2)=x(42);
A(10,3)=x(58);
A(10,4)=x(74);
A(10,5)=x(90);
A(10,6)=x(106);
A(10,7)=x(122);
A(10,8)=x(138);
A(10,9)=x(154);
A(10,10)=x(170)-1.0;
A(10,11)=x(186);
A(10,12)=x(202);
A(10,13)=x(218);
A(10,14)=x(234);
A(10,15)=x(250);
A(10,16)=x(266);
A(11,1)=x(27);
A(11,2)=x(43);
A(11,3)=x(59);
A(11,4)=x(75);
A(11,5)=x(91);
A(11,6)=x(107);
A(11,7)=x(123);
A(11,8)=x(139);
A(11,9)=x(155);
A(11,10)=x(171);
A(11,11)=x(187)-1.0;
A(11,12)=x(203);
A(11,13)=x(219);
A(11,14)=x(235);
A(11,15)=x(251);
A(11,16)=x(267);
A(12,1)=x(28);
A(12,2)=x(44);
A(12,3)=x(60);
A(12,4)=x(76);
A(12,5)=x(92);
A(12,6)=x(108);
A(12,7)=x(124);
A(12,8)=x(140);
A(12,9)=x(156);
A(12,10)=x(172);
A(12,11)=x(188);
A(12,12)=x(204)-1.0;
A(12,13)=x(220);
A(12,14)=x(236);
A(12,15)=x(252);
A(12,16)=x(268);
A(13,1)=x(29);
A(13,2)=x(45);
A(13,3)=x(61);
A(13,4)=x(77);
A(13,5)=x(93);
A(13,6)=x(109);
A(13,7)=x(125);
A(13,8)=x(141);
A(13,9)=x(157);
A(13,10)=x(173);
A(13,11)=x(189);
A(13,12)=x(205);
A(13,13)=x(221)-1.0;
A(13,14)=x(237);
A(13,15)=x(253);
A(13,16)=x(269);
A(14,1)=x(30);
A(14,2)=x(46);
A(14,3)=x(62);
A(14,4)=x(78);
A(14,5)=x(94);
A(14,6)=x(110);
A(14,7)=x(126);
A(14,8)=x(142);
A(14,9)=x(158);
A(14,10)=x(174);
A(14,11)=x(190);
A(14,12)=x(206);
A(14,13)=x(222);
A(14,14)=x(238)-1.0;
A(14,15)=x(254);
A(14,16)=x(270);
A(15,1)=x(31);
A(15,2)=x(47);
A(15,3)=x(63);
A(15,4)=x(79);
A(15,5)=x(95);
A(15,6)=x(111);
A(15,7)=x(127);
A(15,8)=x(143);
A(15,9)=x(159);
A(15,10)=x(175);
A(15,11)=x(191);
A(15,12)=x(207);
A(15,13)=x(223);
A(15,14)=x(239);
A(15,15)=x(255)-1.0;
A(15,16)=x(271);
A(16,1)=x(32);
A(16,2)=x(48);
A(16,3)=x(64);
A(16,4)=x(80);
A(16,5)=x(96);
A(16,6)=x(112);
A(16,7)=x(128);
A(16,8)=x(144);
A(16,9)=x(160);
A(16,10)=x(176);
A(16,11)=x(192);
A(16,12)=x(208);
A(16,13)=x(224);
A(16,14)=x(240);
A(16,15)=x(256);
A(16,16)=x(272)-1.0;

}