%
% Derivative of parameters.
%
function A1=dFdP_eq(para,x)
global subptype

switch subptype
case 31
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(134)*para(137)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(13)*(x(1) - para(19)*log(para(115)/x(16))) + para(12)*x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16)))) - (para(114)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) + (para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))))/(para(4)*para(134)*para(138));

case 32
	A1(1,1)=(para(6)*para(112)*para(127)*x(4)*x(5))/(para(112) + x(13));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(((para(1)*para(6)*para(112)*para(127)*x(4)*x(5))/(para(4)*para(137)*(para(112) + x(13))) - (para(6)*para(16)*para(112)*para(127)*para(135)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2))*(para(108) + x(13))^2)/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(6)*para(16)*para(112)*para(127)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 33
	A1(1,1)=(para(9)*para(124)*x(8))/(para(133) + exp((para(59) + x(1))/para(60))) + (para(8)*para(48)*para(126)*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1))))) + (para(8)*para(48)*para(49)*para(126)*exp(para(49)*(para(3) - x(1)))*(para(3) - x(1)))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1))))) + (para(8)*para(48)*para(126)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*((para(48)*exp(-para(48)*(para(3) + para(50) - x(1))) + para(46)*para(51)*exp(para(46)*(para(47) - para(3) + x(1))))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1)))) - para(48)*para(49)*exp(para(49)*(para(3) - x(1))) + para(44)*exp(-para(44)*(para(3) + para(45) - x(1)))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1))))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 34
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(para(1)*(para(108) + x(13))^2*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)^2*para(134)*para(137)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*(para(13)*(x(1) - para(19)*log(para(115)/x(16))) + para(12)*x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16)))) - (para(114)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) + (para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))))))/(para(4)^2*para(134)*para(138));

case 35
	A1(1,1)=(para(116)*para(129)*(para(117)*para(118)*x(1)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*para(120)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(14)*para(75)*para(128)*(para(77)*x(1)*exp(-para(5)*x(1)) + para(76)*para(79)*x(1)*exp(-para(5)*para(79)*x(1))))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2) - (para(116)*para(118)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*((para(20)*para(116)*para(129)*(para(117)*para(118)*x(1)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*para(120)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(20)*para(116)*para(118)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(4)*para(137)) - (para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*((para(20)*para(116)*para(129)*(para(117)*para(118)*x(1)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*para(120)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(20)*para(116)*para(118)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2)*(x(13) - x(14)))/(para(22)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*((para(20)*para(116)*para(129)*(para(117)*para(118)*x(1)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*para(120)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(20)*para(116)*para(118)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2)*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=-(para(1)*((para(14)*para(75)*para(114)*para(128)*(para(77)*x(1)*exp(-para(5)*x(1)) + para(76)*para(79)*x(1)*exp(-para(5)*para(79)*x(1))))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2) - (para(114)*para(116)*para(129)*(para(117)*para(118)*x(1)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*para(120)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) + (para(114)*para(116)*para(118)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(4)*para(134)*para(138));

case 36
	A1(1,1)=(para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(4)*para(137)*(para(112) + x(13))) - (para(16)*para(112)*para(127)*para(135)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(2) - x(1))*(x(13) - x(14)))/(para(22)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(16)*para(112)*para(127)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(2) - x(1))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 37
	A1(1,1)=(para(19)*log(para(23)/x(13)))/para(137) - x(1);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)))/(para(4)*para(137)) - (para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(1) - (para(19)*log(para(23)/x(13)))/para(137))*(x(13) - x(14)))/(para(22)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(1) - (para(19)*log(para(23)/x(13)))/para(137))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 38
	A1(1,1)=(para(48)*para(126)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 39
	A1(1,1)=(para(124)*x(8)*(para(3) - x(1)))/(para(133) + exp((para(59) + x(1))/para(60)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 310
	A1(1,1)=-para(125)*x(9)^2*(x(1) - para(19)*log(para(67)/(para(110) + para(123)*x(16))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 311
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(para(136)*(para(108) + x(13))^2*(x(13) - x(15)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=x(13) - x(15);
	A1(16,1)=0;

case 312
	A1(1,1)=-x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16)))))/(para(4)*para(134)*para(138));

case 313
	A1(1,1)=para(19)*log(para(115)/x(16)) - x(1);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*(x(1) - para(19)*log(para(115)/x(16))))/(para(4)*para(134)*para(138));

case 314
	A1(1,1)=-(para(75)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(75)*para(114)*para(128))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));

case 315
	A1(1,1)=-x(13)/(para(121) + x(13));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*x(13))/(para(4)*para(137)*(para(121) + x(13))) - (para(16)*para(135)*x(10)^3*x(11)^3*x(13)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*(para(121) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*x(10)^3*x(11)^3*x(13)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(121) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 316
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(para(135)*x(10)^3*x(11)^3*(para(108) + x(13))^2*(x(13) - x(14)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))));
	A1(14,1)=(x(10)^3*x(11)^3*(para(109) + x(14))^2*(x(13) - x(14)))/((para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))));
	A1(15,1)=0;
	A1(16,1)=0;

case 317
	A1(1,1)=-x(6)*x(7)*(x(1) - para(19)*log(para(96)/(para(110) + para(122)*x(16))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 318
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(para(136)*x(13)^2*(para(108) + x(13))^2)/(para(134)*(para(113)^2 + x(13)^2)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=x(13)^2/(para(113)^2 + x(13)^2);
	A1(16,1)=0;

case 319
	A1(1,1)=para(13)*log(para(115)/x(16)) + (para(7)*log(para(23)/x(13)))/para(137) + para(12)*x(2)^3*x(3)^2*log(para(85)/(para(86) + x(16))) + para(17)*x(6)*x(7)*log(para(96)/(para(110) + para(122)*x(16))) + para(10)*para(125)*x(9)^2*log(para(67)/(para(110) + para(123)*x(16)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(((para(1)*para(7)*log(para(23)/x(13)))/(para(4)*para(137)^2) - (para(7)*para(16)*para(135)*x(10)^3*x(11)^3*log(para(23)/x(13))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*para(137)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2))*(para(108) + x(13))^2)/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(7)*para(16)*x(10)^3*x(11)^3*log(para(23)/x(13))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*para(137)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*(para(13)*log(para(115)/x(16)) + para(12)*x(2)^3*x(3)^2*log(para(85)/(para(86) + x(16)))))/(para(4)*para(134)*para(138));

case 320
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))) - (para(16)*para(116)*para(129)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*para(116)*para(129)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 321
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(108) + x(13))^2*(x(13) - x(14)))/(para(22)*para(134)*(para(25)*para(108) + (para(108) + x(13))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(14,1)=-(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 322
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(108) + x(13))^2*(x(13) - x(14))*(para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(22)^2*para(134)*(para(25)*para(108) + (para(108) + x(13))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(14,1)=(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14))*(para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(22)^2*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 323
	A1(1,1)=(para(7)*para(19))/(para(23)*para(137)) - (para(116)*para(129)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*((para(7)*para(19))/(para(23)*para(137)) + (para(20)*para(116)*para(129)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))))/(para(4)*para(137)) - (para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*((para(7)*para(19))/(para(23)*para(137)) + (para(20)*para(116)*para(129)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))))*(x(13) - x(14)))/(para(22)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*((para(7)*para(19))/(para(23)*para(137)) + (para(20)*para(116)*para(129)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(114)*para(116)*para(129)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1))));

case 324
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*(para(107)*x(12) - para(111)*x(13)*(para(133) - x(12))))/(para(25)*para(108) + (para(108) + x(13))^2);
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 325
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(para(108)*(para(108) + x(13))^2*((para(11)*para(136)*(x(13) - x(15)) + (para(1)*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(137)) + (para(18)*para(136)*x(13)^2)/(para(113)^2 + x(13)^2) + (para(16)*para(135)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))))/para(134) - para(24)*(para(107)*x(12) - para(111)*x(13)*(para(133) - x(12)))))/(para(25)*para(108) + (para(108) + x(13))^2)^2;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 326
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=(para(109)*(para(109) + x(14))^2*((x(14) - x(15))/para(130) - (para(16)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))))/(para(26)*para(109) + (para(109) + x(14))^2)^2;
	A1(15,1)=0;
	A1(16,1)=0;

case 327
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=-((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*((para(101) - para(97)*para(99)*exp(-para(99)*(para(100) - para(27) + x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - ((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*((para(101) - para(97)*para(99)*exp(-para(99)*(para(100) - para(27) + x(1))))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(106) - para(103)*para(104)*exp(-para(104)*(para(105) - para(27) + x(1))))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))) + (para(102)*exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2 + (para(98)*exp(-para(98)*(para(105) - para(27) + x(1)))*(para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1))))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))^2))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2) + (para(102)*exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 328
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(para(133)*exp(-(para(28) + x(1))/para(29)))/(para(29)*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))*(para(133) + exp(-(para(28) + x(1))/para(29)))^2);
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=(para(133)*exp(-(para(28) + x(1))/para(29)))/(para(29)*para(132)*(para(133) + exp(-(para(28) + x(1))/para(29)))^2);
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 329
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=-(para(133)*exp(-(para(28) + x(1))/para(29))*(para(28) + x(1)))/(para(29)^2*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))*(para(133) + exp(-(para(28) + x(1))/para(29)))^2);
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=-(para(133)*exp(-(para(28) + x(1))/para(29))*(para(28) + x(1)))/(para(29)^2*para(132)*(para(133) + exp(-(para(28) + x(1))/para(29)))^2);
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 330
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(para(35)*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/((para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2*(para(133) + exp((para(36) + x(1))/para(36))));
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 331
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(para(35)^2*exp(-(para(31) + x(1))/para(32))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/(para(32)*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2*(para(133) + exp(-(para(31) + x(1))/para(32)))^2*(para(133) + exp((para(36) + x(1))/para(36))));
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 332
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=-(para(35)^2*exp(-(para(31) + x(1))/para(32))*(para(31) + x(1))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/(para(32)^2*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2*(para(133) + exp(-(para(31) + x(1))/para(32)))^2*(para(133) + exp((para(36) + x(1))/para(36))));
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 333
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=-(para(133)*exp((para(33) - x(1))/para(34))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/(para(34)*(para(133) + exp((para(33) - x(1))/para(34)))^2*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2);
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 334
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(para(133)*exp((para(33) - x(1))/para(34))*(para(33) - x(1))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/(para(34)^2*(para(133) + exp((para(33) - x(1))/para(34)))^2*(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2);
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 335
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(((para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32))))/(para(133) + exp((para(36) + x(1))/para(36))) + para(35)/((para(133) + exp(-(para(31) + x(1))/para(32)))*(para(133) + exp((para(36) + x(1))/para(36)))))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 336
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=(para(35)*exp((para(36) + x(1))/para(36))*((para(36) + x(1))/para(36)^2 - 1/para(36))*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32))))*(x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))))/((para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2*(para(133) + exp((para(36) + x(1))/para(36)))^2);
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 337
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=-(para(133)*exp((para(37) + x(1))/para(38))*(para(42) + para(39)*exp(-para(40)^2*(para(43) - x(1))^2)))/(para(38)*para(41)*(para(133) + exp((para(37) + x(1))/para(38)))^2);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=-(para(133)*exp((para(37) + x(1))/para(38)))/(para(38)*para(131)*(para(133) + exp((para(37) + x(1))/para(38)))^2);
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 338
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=(para(133)*exp((para(37) + x(1))/para(38))*(para(42) + para(39)*exp(-para(40)^2*(para(43) - x(1))^2))*(para(37) + x(1)))/(para(38)^2*para(41)*(para(133) + exp((para(37) + x(1))/para(38)))^2);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=(para(133)*exp((para(37) + x(1))/para(38))*(para(37) + x(1)))/(para(38)^2*para(131)*(para(133) + exp((para(37) + x(1))/para(38)))^2);
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 339
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=-(exp(-para(40)^2*(para(43) - x(1))^2)*(x(5) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))))/para(41);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 340
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=(2*para(39)*para(40)*exp(-para(40)^2*(para(43) - x(1))^2)*(para(43) - x(1))^2*(x(5) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))))/para(41);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 341
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=((para(42) + para(39)*exp(-para(40)^2*(para(43) - x(1))^2))*(x(5) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))))/para(41)^2;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 342
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=-(x(5) - para(133)/(para(133) + exp((para(37) + x(1))/para(38))))/para(41);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 343
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=(para(39)*para(40)^2*exp(-para(40)^2*(para(43) - x(1))^2)*(2*para(43) - 2*x(1))*(x(5) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))))/para(41);
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 344
	A1(1,1)=(para(8)*para(48)*para(126)*exp(-para(44)*(para(3) + para(45) - x(1)))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1))))*(para(3) + para(45) - x(1)))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 345
	A1(1,1)=(para(8)*para(44)*para(48)*para(126)*exp(-para(44)*(para(3) + para(45) - x(1)))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 346
	A1(1,1)=-(para(8)*para(48)*para(51)*para(126)*exp(para(46)*(para(47) - para(3) + x(1)))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*(para(47) - para(3) + x(1)))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 347
	A1(1,1)=-(para(8)*para(46)*para(48)*para(51)*para(126)*exp(para(46)*(para(47) - para(3) + x(1)))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 348
	A1(1,1)=(para(8)*para(126)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1))))) - (para(8)*para(48)*para(126)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*(para(133) + exp(para(49)*(para(3) - x(1))) - exp(-para(48)*(para(3) + para(50) - x(1)))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(para(3) + para(50) - x(1))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 349
	A1(1,1)=(para(8)*para(48)*para(126)*exp(para(49)*(para(3) - x(1)))*(para(3) - x(1))^2)/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1))))) - (para(8)*para(48)^2*para(126)*exp(para(49)*(para(3) - x(1)))*(para(3) - x(1))^2*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 350
	A1(1,1)=(para(8)*para(48)^2*para(126)*exp(-para(48)*(para(3) + para(50) - x(1)))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 351
	A1(1,1)=-(para(8)*para(48)*para(126)*exp(para(46)*(para(47) - para(3) + x(1)))*(para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 352
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-((para(56) + x(1))*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))))/(para(133) - exp(-(para(56) + x(1))/para(58)));
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 353
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-((para(54) - x(1))*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))))/(para(133) - exp(-(para(54) - x(1))/para(55)));
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 354
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-(para(53)/(para(133) - exp(-(para(54) - x(1))/para(55))) - (para(53)*exp(-(para(54) - x(1))/para(55))*(para(54) - x(1)))/(para(55)*(para(133) - exp(-(para(54) - x(1))/para(55)))^2))*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57))));
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 355
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-(para(53)*exp(-(para(54) - x(1))/para(55))*(para(54) - x(1))^2*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))))/(para(55)^2*(para(133) - exp(-(para(54) - x(1))/para(55)))^2);
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 356
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=(para(133)*exp(-(para(56) + x(1))/para(57))*((para(53)*(para(54) - x(1)))/(para(133) - exp(-(para(54) - x(1))/para(55))) + (para(52)*(para(56) + x(1)))/(para(133) - exp(-(para(56) + x(1))/para(58)))))/(para(57)*(para(133) + exp(-(para(56) + x(1))/para(57)))^2) - (x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57))))*(para(52)/(para(133) - exp(-(para(56) + x(1))/para(58))) - (para(52)*exp(-(para(56) + x(1))/para(58))*(para(56) + x(1)))/(para(58)*(para(133) - exp(-(para(56) + x(1))/para(58)))^2));
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 357
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-(para(133)*exp(-(para(56) + x(1))/para(57))*((para(53)*(para(54) - x(1)))/(para(133) - exp(-(para(54) - x(1))/para(55))) + (para(52)*(para(56) + x(1)))/(para(133) - exp(-(para(56) + x(1))/para(58))))*(para(56) + x(1)))/(para(57)^2*(para(133) + exp(-(para(56) + x(1))/para(57)))^2);
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 358
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=-(para(52)*exp(-(para(56) + x(1))/para(58))*(para(56) + x(1))^2*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))))/(para(58)^2*(para(133) - exp(-(para(56) + x(1))/para(58)))^2);
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 359
	A1(1,1)=-(para(9)*para(124)*x(8)*exp((para(59) + x(1))/para(60))*(para(3) - x(1)))/(para(60)*(para(133) + exp((para(59) + x(1))/para(60)))^2);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 360
	A1(1,1)=(para(9)*para(124)*x(8)*exp((para(59) + x(1))/para(60))*(para(59) + x(1))*(para(3) - x(1)))/(para(60)^2*(para(133) + exp((para(59) + x(1))/para(60)))^2);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 361
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=(x(9) - para(133)/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2))/(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66))))^2;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 362
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=(x(9) - para(133)/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2))/((para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66))))^2*(para(133) + exp(-(para(65) + x(1))/para(66))));
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 363
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=-(para(133)*exp((para(63) - x(1))/para(64)))/(2*para(64)*(para(133) + exp((para(63) - x(1))/para(64)))^(3/2)*(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66)))));
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 364
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=(para(133)*exp((para(63) - x(1))/para(64))*(para(63) - x(1)))/(2*para(64)^2*(para(133) + exp((para(63) - x(1))/para(64)))^(3/2)*(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66)))));
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 365
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=(para(62)*exp(-(para(65) + x(1))/para(66))*(x(9) - para(133)/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2)))/(para(66)*(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66))))^2*(para(133) + exp(-(para(65) + x(1))/para(66)))^2);
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 366
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=-(para(62)*exp(-(para(65) + x(1))/para(66))*(x(9) - para(133)/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2))*(para(65) + x(1)))/(para(66)^2*(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66))))^2*(para(133) + exp(-(para(65) + x(1))/para(66)))^2);
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 367
	A1(1,1)=(para(10)*para(19)*para(125)*x(9)^2)/para(67);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 368
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=(para(74)*(tanh(para(68) + para(69)*x(1))^2 - 1))/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1))))) + (para(71)*(tanh(para(68) + para(69)*x(1))^2 - 1)*(x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1)))))/((para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2*(para(133) - tanh(para(72)*(para(73) + x(1)))));
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 369
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=(para(74)*x(1)*(tanh(para(68) + para(69)*x(1))^2 - 1))/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1))))) + (para(71)*x(1)*(tanh(para(68) + para(69)*x(1))^2 - 1)*(x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1)))))/((para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2*(para(133) - tanh(para(72)*(para(73) + x(1)))));
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 370
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=(x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 371
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=((x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1))))*(para(133) - tanh(para(68) + para(69)*x(1))))/((para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2*(para(133) - tanh(para(72)*(para(73) + x(1)))));
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 372
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=-(para(71)*(para(73) + x(1))*(tanh(para(72)*(para(73) + x(1)))^2 - 1)*(x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1))))*(para(133) - tanh(para(68) + para(69)*x(1))))/((para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2*(para(133) - tanh(para(72)*(para(73) + x(1))))^2);
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 373
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=-(para(71)*para(72)*(tanh(para(72)*(para(73) + x(1)))^2 - 1)*(x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1))))*(para(133) - tanh(para(68) + para(69)*x(1))))/((para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2*(para(133) - tanh(para(72)*(para(73) + x(1))))^2);
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 374
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=(para(133) - tanh(para(68) + para(69)*x(1)))/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))));
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 375
	A1(1,1)=-(para(14)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(14)*para(114)*para(128))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));

case 376
	A1(1,1)=(para(14)*para(75)*para(128)*exp(-para(5)*para(79)*x(1)))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(14)*para(75)*para(114)*para(128)*exp(-para(5)*para(79)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);

case 377
	A1(1,1)=(para(14)*para(75)*para(128)*exp(-para(5)*x(1)))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(14)*para(75)*para(114)*para(128)*exp(-para(5)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);

case 378
	A1(1,1)=(para(14)*para(75)*para(128)*((para(78)/x(16))^(1/2)/x(16) + para(78)/(2*x(16)^2*(para(78)/x(16))^(1/2))))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))^2*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(14)*para(75)*para(114)*para(128)*((para(78)/x(16))^(1/2)/x(16) + para(78)/(2*x(16)^2*(para(78)/x(16))^(1/2))))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))^2*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));

case 379
	A1(1,1)=-(para(5)*para(14)*para(75)*para(76)*para(128)*x(1)*exp(-para(5)*para(79)*x(1)))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(5)*para(14)*para(75)*para(76)*para(114)*para(128)*x(1)*exp(-para(5)*para(79)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2);

case 380
	A1(1,1)=0;
	A1(2,1)=((para(81) + x(1))*(para(133) - x(2)))/(para(133) - exp(-(para(81) + x(1))/para(84)));
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 381
	A1(1,1)=0;
	A1(2,1)=(para(80)*(para(133) - x(2)))/(para(133) - exp(-(para(81) + x(1))/para(84))) - (para(80)*exp(-(para(81) + x(1))/para(84))*(para(81) + x(1))*(para(133) - x(2)))/(para(84)*(para(133) - exp(-(para(81) + x(1))/para(84)))^2);
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 382
	A1(1,1)=0;
	A1(2,1)=-x(2)*exp(-x(1)/para(83));
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 383
	A1(1,1)=0;
	A1(2,1)=-(para(82)*x(1)*x(2)*exp(-x(1)/para(83)))/para(83)^2;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 384
	A1(1,1)=0;
	A1(2,1)=(para(80)*exp(-(para(81) + x(1))/para(84))*(para(81) + x(1))^2*(para(133) - x(2)))/(para(84)^2*(para(133) - exp(-(para(81) + x(1))/para(84)))^2);
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 385
	A1(1,1)=(para(12)*para(19)*x(2)^3*x(3)^2)/para(85);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(12)*para(19)*x(2)^3*x(3)^2)/(para(4)*para(85)*para(134)*para(138));

case 386
	A1(1,1)=-(para(12)*para(19)*x(2)^3*x(3)^2)/(para(86) + x(16));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(12)*para(19)*x(2)^3*x(3)^2)/(para(4)*para(134)*para(138)*(para(86) + x(16)));

case 387
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=(exp(para(88)*(para(89) - x(1)))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 388
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=(para(87)*exp(para(88)*(para(89) - x(1)))*(para(89) - x(1))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 389
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=(para(87)*para(88)*exp(para(88)*(para(89) - x(1)))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1)))) - (para(87)*para(90)*exp(para(88)*(para(89) - x(1)))*exp(para(90)*(para(89) - x(1)))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1))))^2;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 390
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=-(para(87)*exp(para(88)*(para(89) - x(1)))*exp(para(90)*(para(89) - x(1)))*(para(89) - x(1))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1))))^2;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 391
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=-(x(6)*exp(para(92)*(para(93) - x(1))))/(para(133) + exp(para(95)*(para(94) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 392
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=-(para(91)*x(6)*exp(para(92)*(para(93) - x(1)))*(para(93) - x(1)))/(para(133) + exp(para(95)*(para(94) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 393
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=-(para(91)*para(92)*x(6)*exp(para(92)*(para(93) - x(1))))/(para(133) + exp(para(95)*(para(94) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 394
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=(para(95)*x(6)*exp(para(95)*(para(94) - x(1)))*(para(94)*x(1) + para(91)*exp(para(92)*(para(93) - x(1)))))/(para(133) + exp(para(95)*(para(94) - x(1))))^2 - (x(1)*x(6))/(para(133) + exp(para(95)*(para(94) - x(1))));
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 395
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=(x(6)*exp(para(95)*(para(94) - x(1)))*(para(94)*x(1) + para(91)*exp(para(92)*(para(93) - x(1))))*(para(94) - x(1)))/(para(133) + exp(para(95)*(para(94) - x(1))))^2;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 396
	A1(1,1)=(para(17)*para(19)*x(6)*x(7))/para(96);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 397
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(exp(-para(99)*(para(100) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - (exp(-para(99)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1))))) - (exp(-para(99)*(para(100) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))))))/(para(133) + exp(-para(102)*(para(100) + x(1))));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 398
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=- (exp(-para(98)*(para(105) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*(para(105) + x(1))*(para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1)))))/(para(133) + exp(-para(98)*(para(105) + x(1))))^2 - (exp(-para(98)*(para(105) - para(27) + x(1)))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*(para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))*(para(105) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2);
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 399
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(para(97)*exp(-para(99)*(para(100) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*(para(100) + x(1)))/(para(133) + exp(-para(102)*(para(100) + x(1)))) - ((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1)))*(para(100) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*(para(100) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3100
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*((para(97)*para(99)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) - (para(102)*exp(-para(102)*(para(100) + x(1)))*(para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1)))))/(para(133) + exp(-para(102)*(para(100) + x(1))))^2) + ((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*((para(97)*para(99)*exp(-para(99)*(para(100) - para(27) + x(1))))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) - (para(102)*exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2) - (para(97)*para(99)*exp(-para(99)*(para(100) - para(27) + x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) + (para(102)*exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3101
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=- ((para(27) - x(1))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - ((para(27) - x(1))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1))))) - (x(1)*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))))))/(para(133) + exp(-para(102)*(para(100) + x(1))));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3102
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*((exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*(para(100) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - (exp(-para(102)*(para(100) - para(27) + x(1)))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))^2*(para(100) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^3*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2)) - (exp(-para(102)*(para(100) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*(para(100) + x(1))*(para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1)))))/(para(133) + exp(-para(102)*(para(100) + x(1))))^2;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3103
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=- (exp(-para(104)*(para(105) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))))))/(para(133) + exp(-para(98)*(para(105) + x(1)))) - (exp(-para(104)*(para(105) - para(27) + x(1)))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2);
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3104
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(para(103)*exp(-para(104)*(para(105) + x(1)))*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*(para(105) + x(1)))/(para(133) + exp(-para(98)*(para(105) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1)))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*(para(105) - para(27) + x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2);
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3105
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*((para(103)*para(104)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))) - (para(98)*exp(-para(98)*(para(105) + x(1)))*(para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1)))))/(para(133) + exp(-para(98)*(para(105) + x(1))))^2) + (((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*((para(103)*para(104)*exp(-para(104)*(para(105) - para(27) + x(1))))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))) - (para(98)*exp(-para(98)*(para(105) - para(27) + x(1)))*(para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1))))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))^2))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2);
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3106
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=(((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*(para(27) - x(1))*(para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1))))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2) - (x(1)*(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))))))/(para(133) + exp(-para(98)*(para(105) + x(1))));
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3107
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=-x(12);
	A1(13,1)=(para(24)*x(12)*(para(108) + x(13))^2)/(para(25)*para(108) + (para(108) + x(13))^2);
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3108
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(11)*para(136)*(x(13) - x(15)) + (para(1)*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(137)) + (para(18)*para(136)*x(13)^2)/(para(113)^2 + x(13)^2) + (para(16)*para(135)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))))/para(134) - para(24)*(para(107)*x(12) - para(111)*x(13)*(para(133) - x(12))))*(para(25) + 2*para(108) + 2*x(13)))/(para(25)*para(108) + (para(108) + x(13))^2)^2 - ((2*para(108) + 2*x(13))*((para(11)*para(136)*(x(13) - x(15)) + (para(1)*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(137)) + (para(18)*para(136)*x(13)^2)/(para(113)^2 + x(13)^2) + (para(16)*para(135)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))))/para(134) - para(24)*(para(107)*x(12) - para(111)*x(13)*(para(133) - x(12)))))/(para(25)*para(108) + (para(108) + x(13))^2);
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3109
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=((para(109) + x(14))^2*((x(14) - x(15))/para(130) - (para(16)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))))*(para(26) + 2*para(109) + 2*x(14)))/(para(26)*para(109) + (para(109) + x(14))^2)^2 - ((2*para(109) + 2*x(14))*((x(14) - x(15))/para(130) - (para(16)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))))/(para(26)*para(109) + (para(109) + x(14))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 3110
	A1(1,1)=- (para(17)*para(19)*x(6)*x(7))/(para(110) + para(122)*x(16)) - (para(10)*para(19)*para(125)*x(9)^2)/(para(110) + para(123)*x(16));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3111
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=x(13)*(para(133) - x(12));
	A1(13,1)=-(para(24)*x(13)*(para(108) + x(13))^2*(para(133) - x(12)))/(para(25)*para(108) + (para(108) + x(13))^2);
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3112
	A1(1,1)=(para(6)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*((para(6)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))^2))/(para(4)*para(137)) - (para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14))*((para(6)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))^2))/(para(22)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14))*((para(6)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))^2))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 3113
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=(2*para(18)*para(113)*para(136)*x(13)^2*(para(108) + x(13))^2)/(para(134)*(para(113)^2 + x(13)^2)^2*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=-(2*para(18)*para(113)*x(13)^2)/(para(113)^2 + x(13)^2)^2;
	A1(16,1)=0;

case 3114
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*((para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(14)*para(75)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))))))/(para(4)*para(134)*para(138));

case 3115
	A1(1,1)=(para(13)*para(19))/para(115);
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(13)*para(19))/(para(4)*para(115)*para(134)*para(138));

case 3116
	A1(1,1)=(para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*para(20)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))) - (para(16)*para(20)*para(129)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*para(20)*para(129)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(114)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1))));

case 3117
	A1(1,1)=(para(116)*para(129)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*para(20)*para(116)*para(129)*x(13)*exp(para(5)*para(118)*x(1)))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))) - (para(16)*para(20)*para(116)*para(129)*para(135)*x(10)^3*x(11)^3*x(13)*exp(para(5)*para(118)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*para(20)*para(116)*para(129)*x(10)^3*x(11)^3*x(13)*exp(para(5)*para(118)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(114)*para(116)*para(129)*x(13)*exp(para(5)*para(118)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1))));

case 3118
	A1(1,1)=(para(5)*para(116)*para(117)*para(129)*x(1)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(5)*para(116)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(((para(1)*((para(5)*para(20)*para(116)*para(117)*para(129)*x(1)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(5)*para(20)*para(116)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(4)*para(137)) - (para(16)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14))*((para(5)*para(20)*para(116)*para(117)*para(129)*x(1)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(5)*para(20)*para(116)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(22)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2))*(para(108) + x(13))^2)/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14))*((para(5)*para(20)*para(116)*para(117)*para(129)*x(1)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(5)*para(20)*para(116)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*((para(5)*para(114)*para(116)*para(117)*para(129)*x(1)*x(13)*exp(para(5)*para(118)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(5)*para(114)*para(116)*para(119)*para(129)*x(1)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/(para(4)*para(134)*para(138));

case 3119
	A1(1,1)=-(para(116)*para(129)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*para(20)*para(116)*para(129)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2) - (para(16)*para(20)*para(116)*para(129)*para(135)*x(10)^3*x(11)^3*exp(para(5)*para(118)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(16)*para(20)*para(116)*para(129)*x(10)^3*x(11)^3*exp(para(5)*para(118)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(114)*para(116)*para(129)*exp(para(5)*para(118)*x(1))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2);

case 3120
	A1(1,1)=-(para(5)*para(23)*para(116)*para(129)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*para(5)*para(20)*para(23)*para(116)*para(129)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))) - (para(5)*para(16)*para(20)*para(23)*para(116)*para(129)*para(135)*x(1)*x(10)^3*x(11)^3*x(16)^3*exp(para(5)*para(120)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(5)*para(16)*para(20)*para(23)*para(116)*para(129)*x(1)*x(10)^3*x(11)^3*x(16)^3*exp(para(5)*para(120)*x(1))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(5)*para(23)*para(114)*para(116)*para(129)*x(1)*x(16)^3*exp(para(5)*para(120)*x(1)))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1))));

case 3121
	A1(1,1)=(para(15)*x(13))/(para(121) + x(13))^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*para(15)*x(13))/(para(4)*para(137)*(para(121) + x(13))^2) - (para(15)*para(16)*para(135)*x(10)^3*x(11)^3*x(13)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*(para(121) + x(13))^2*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(15)*para(16)*x(10)^3*x(11)^3*x(13)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(121) + x(13))^2*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 3122
	A1(1,1)=-(para(17)*para(19)*x(6)*x(7)*x(16))/(para(110) + para(122)*x(16));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3123
	A1(1,1)=-(para(10)*para(19)*para(125)*x(9)^2*x(16))/(para(110) + para(123)*x(16));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3124
	A1(1,1)=(para(9)*x(8)*(para(3) - x(1)))/(para(133) + exp((para(59) + x(1))/para(60)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3125
	A1(1,1)=-para(10)*x(9)^2*(x(1) - para(19)*log(para(67)/(para(110) + para(123)*x(16))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3126
	A1(1,1)=(para(8)*para(48)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3127
	A1(1,1)=(para(6)*para(112)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*para(6)*para(112)*x(4)*x(5)*(para(2) - x(1)))/(para(4)*para(137)*(para(112) + x(13))) - (para(6)*para(16)*para(112)*para(135)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(2) - x(1))*(x(13) - x(14)))/(para(22)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=(para(6)*para(16)*para(112)*x(4)*x(5)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(2) - x(1))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(112) + x(13))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 3128
	A1(1,1)=-(para(14)*para(75))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=-(para(1)*para(14)*para(75)*para(114))/(para(4)*para(134)*para(138)*(para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))));

case 3129
	A1(1,1)=(para(116)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)));
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*((para(1)*para(20)*para(116)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))) - (para(16)*para(20)*para(116)*para(135)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(16)*para(20)*para(116)*x(10)^3*x(11)^3*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1)))*(x(13) - x(14)))/(para(22)*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*para(114)*para(116)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(134)*para(138)*(para(133) + para(119)*exp(para(5)*para(118)*x(1))));

case 3130
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=((para(109) + x(14))^2*(x(14) - x(15)))/(para(130)^2*(para(26)*para(109) + (para(109) + x(14))^2));
	A1(15,1)=-(para(135)*(x(14) - x(15)))/(para(130)^2*para(136));
	A1(16,1)=0;

case 3131
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=(x(11) - para(133)/(para(133) + exp((para(37) + x(1))/para(38))))/para(131)^2;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3132
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=(x(10) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29))))/para(132)^2;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=0;

case 3133
	A1(1,1)=(para(14)*para(75)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2) - (para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2 + (para(14)*para(75)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))^2*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))) - (para(9)*para(124)*x(8)*(para(3) - x(1)))/(para(133) + exp((para(59) + x(1))/para(60)))^2 + (para(8)*para(48)*para(126)*(para(3) - x(1)))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1))))) - (para(8)*para(48)*para(126)*(para(3) - x(1))*(para(133) + exp(para(49)*(para(3) - x(1))))*(para(48) + exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))))/((para(133) + exp(-para(44)*(para(3) + para(45) - x(1))))*(exp(-para(48)*(para(3) + para(50) - x(1))) + para(51)*exp(para(46)*(para(47) - para(3) + x(1)))) + para(48)*(para(133) + exp(para(49)*(para(3) - x(1)))))^2;
	A1(2,1)=(para(80)*(para(81) + x(1)))/(para(133) - exp(-(para(81) + x(1))/para(84))) - (para(80)*(para(81) + x(1))*(para(133) - x(2)))/(para(133) - exp(-(para(81) + x(1))/para(84)))^2;
	A1(3,1)=para(74)/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1))))) + ((x(3) - para(74)*(para(133) - tanh(para(68) + para(69)*x(1))))*(para(71)/(para(133) - tanh(para(72)*(para(73) + x(1)))) - (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1))))^2))/(para(70) + (para(71)*(para(133) - tanh(para(68) + para(69)*x(1))))/(para(133) - tanh(para(72)*(para(73) + x(1)))))^2;
	A1(4,1)=(1/(para(133) + exp(-(para(28) + x(1))/para(29))) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))^2)/(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36)))) - ((x(4) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29))))*(para(133)/(para(133) + exp((para(33) - x(1))/para(34)))^2 - 1/(para(133) + exp((para(33) - x(1))/para(34))) + para(35)^2/((para(133) + exp(-(para(31) + x(1))/para(32)))^2*(para(133) + exp((para(36) + x(1))/para(36)))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36)))^2))/(para(133)/(para(133) + exp((para(33) - x(1))/para(34))) + (para(35)*(para(30) + para(35)/(para(133) + exp(-(para(31) + x(1))/para(32)))))/(para(133) + exp((para(36) + x(1))/para(36))))^2;
	A1(5,1)=((para(42) + para(39)*exp(-para(40)^2*(para(43) - x(1))^2))*(1/(para(133) + exp((para(37) + x(1))/para(38))) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))^2))/para(41);
	A1(6,1)=(x(6)*(para(94)*x(1) + para(91)*exp(para(92)*(para(93) - x(1)))))/(para(133) + exp(para(95)*(para(94) - x(1))))^2 + (para(87)*exp(para(88)*(para(89) - x(1))))/(para(133) + exp(para(90)*(para(89) - x(1)))) - (para(87)*exp(para(88)*(para(89) - x(1)))*(para(133) - x(6)))/(para(133) + exp(para(90)*(para(89) - x(1))))^2;
	A1(7,1)=(x(7) - (para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))))*((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1))))^2 + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1))))^2) - ((para(101)*x(1) + para(97)*exp(-para(99)*(para(100) + x(1))))/(para(133) + exp(-para(102)*(para(100) + x(1)))) + (para(106)*x(1) + para(103)*exp(-para(104)*(para(105) + x(1))))/(para(133) + exp(-para(98)*(para(105) + x(1)))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))) - ((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))^2 + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1))))^2))/((para(133) + exp(-para(102)*(para(100) - para(27) + x(1))))*((para(97)*exp(-para(99)*(para(100) - para(27) + x(1))) - para(101)*(para(27) - x(1)))/(para(133) + exp(-para(102)*(para(100) - para(27) + x(1)))) + (para(103)*exp(-para(104)*(para(105) - para(27) + x(1))) - para(106)*(para(27) - x(1)))/(para(133) + exp(-para(98)*(para(105) - para(27) + x(1)))))^2));
	A1(8,1)=((para(53)*(para(54) - x(1)))/(para(133) - exp(-(para(54) - x(1))/para(55)))^2 + (para(52)*(para(56) + x(1)))/(para(133) - exp(-(para(56) + x(1))/para(58)))^2)*(x(8) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))) + ((para(53)*(para(54) - x(1)))/(para(133) - exp(-(para(54) - x(1))/para(55))) + (para(52)*(para(56) + x(1)))/(para(133) - exp(-(para(56) + x(1))/para(58))))*(1/(para(133) + exp(-(para(56) + x(1))/para(57))) - para(133)/(para(133) + exp(-(para(56) + x(1))/para(57)))^2);
	A1(9,1)=- (para(133)/(2*(para(133) + exp((para(63) - x(1))/para(64)))^(3/2)) - 1/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2))/(para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66)))) - (para(62)*(x(9) - para(133)/(para(133) + exp((para(63) - x(1))/para(64)))^(1/2)))/((para(61) + para(62)/(para(133) + exp(-(para(65) + x(1))/para(66))))^2*(para(133) + exp(-(para(65) + x(1))/para(66)))^2);
	A1(10,1)=(1/(para(133) + exp(-(para(28) + x(1))/para(29))) - para(133)/(para(133) + exp(-(para(28) + x(1))/para(29)))^2)/para(132);
	A1(11,1)=(1/(para(133) + exp((para(37) + x(1))/para(38))) - para(133)/(para(133) + exp((para(37) + x(1))/para(38)))^2)/para(131);
	A1(12,1)=para(111)*x(13);
	A1(13,1)=-((para(108) + x(13))^2*(((para(16)*para(135)*x(10)^3*x(11)^3*((para(20)*para(116)*para(129)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2) - 1)*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2 - (para(1)*para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(4)*para(137)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2))/para(134) + para(24)*para(111)*x(13)))/(para(25)*para(108) + (para(108) + x(13))^2);
	A1(14,1)=(para(16)*x(10)^3*x(11)^3*(para(109) + x(14))^2*((para(20)*para(116)*para(129)*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(22)*(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2) - 1)*(x(13) - x(14)))/((para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=(para(1)*((para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1)))^2) - (para(114)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1)))^2 + (para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))^2*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))))))/(para(4)*para(134)*para(138));

case 3134
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*(para(11)*para(136)*(x(13) - x(15)) + (para(1)*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(137)) + (para(18)*para(136)*x(13)^2)/(para(113)^2 + x(13)^2) + (para(16)*para(135)*x(10)^3*x(11)^3*(x(13) - x(14)))/(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))))/(para(134)^2*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*(para(13)*(x(1) - para(19)*log(para(115)/x(16))) + para(12)*x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16)))) - (para(114)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) + (para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))))))/(para(4)*para(134)^2*para(138));

case 3135
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-(para(16)*x(10)^3*x(11)^3*(para(108) + x(13))^2*(x(13) - x(14)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))));
	A1(14,1)=0;
	A1(15,1)=(x(14) - x(15))/(para(130)*para(136));
	A1(16,1)=0;

case 3136
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=-((para(108) + x(13))^2*(para(11)*(x(13) - x(15)) + (para(18)*x(13)^2)/(para(113)^2 + x(13)^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=0;
	A1(15,1)=-(para(135)*(x(14) - x(15)))/(para(130)*para(136)^2);
	A1(16,1)=0;

case 3137
	A1(1,1)=-(para(7)*para(19)*log(para(23)/x(13)))/para(137)^2;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=((para(108) + x(13))^2*((para(1)*(para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13))))/(para(4)*para(137)^2) - (para(1)*para(7)*para(19)*log(para(23)/x(13)))/(para(4)*para(137)^3) + (para(7)*para(16)*para(19)*para(135)*x(10)^3*x(11)^3*log(para(23)/x(13))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(x(13) - x(14)))/(para(22)*para(137)^2*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2)))/(para(134)*(para(25)*para(108) + (para(108) + x(13))^2));
	A1(14,1)=-(para(7)*para(16)*para(19)*x(10)^3*x(11)^3*log(para(23)/x(13))*exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22))*(para(109) + x(14))^2*(x(13) - x(14)))/(para(22)*para(137)^2*(para(26)*para(109) + (para(109) + x(14))^2)*(para(133) + exp((para(21) + para(7)*(x(1) - (para(19)*log(para(23)/x(13)))/para(137)) + (para(15)*x(13))/(para(121) + x(13)) + (para(20)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) - (para(6)*para(112)*para(127)*x(4)*x(5)*(para(2) - x(1)))/(para(112) + x(13)))/para(22)))^2);
	A1(15,1)=0;
	A1(16,1)=0;

case 3138
	A1(1,1)=0;
	A1(2,1)=0;
	A1(3,1)=0;
	A1(4,1)=0;
	A1(5,1)=0;
	A1(6,1)=0;
	A1(7,1)=0;
	A1(8,1)=0;
	A1(9,1)=0;
	A1(10,1)=0;
	A1(11,1)=0;
	A1(12,1)=0;
	A1(13,1)=0;
	A1(14,1)=0;
	A1(15,1)=0;
	A1(16,1)=(para(1)*(para(13)*(x(1) - para(19)*log(para(115)/x(16))) + para(12)*x(2)^3*x(3)^2*(x(1) - para(19)*log(para(85)/(para(86) + x(16)))) - (para(114)*para(116)*para(129)*(para(117)*x(13)*exp(para(5)*para(118)*x(1)) - para(23)*x(16)^3*exp(para(5)*para(120)*x(1))))/(para(133) + para(119)*exp(para(5)*para(118)*x(1))) + (para(14)*para(75)*para(114)*para(128))/((para(133) + (para(78)*(para(78)/x(16))^(1/2))/x(16))*(para(133) + para(77)*exp(-para(5)*x(1)) + para(76)*exp(-para(5)*para(79)*x(1))))))/(para(4)*para(134)*para(138)^2);

end


%end function

