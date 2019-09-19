%% Travis Nichols EECE 2207 Project 1
%
%% Statement of Work
% 1.Design a Wheatstone Bridge that would convert the TVPR resistance to a
% continuous voltage between -1 and 1.
%
% 2.Design a Voltage Divider to convert the ETVR resistance to a continuous
% voltage between 0 and 2.5V.
%
% 3.Provide a document detailing specifics of the Wheatstone Bridge and
% Voltage Divider designs in MATLAB Publisher Format. 
%
% 4.Write a MATLAB function that would provide the ECU with the following:
%
%     (a). AFR indicated for the current engine temperature and throttle
%          position.
%
%     (b). Turn on the Malfunction Indicator Lamp(MIL) to indicate Cooling
%          System Malfunction.
%
%     (c). If the ECU is in Diagnostics Mode(DM), plot up to 4 complete AFR
%          mappings for the 4 user specified temperatures.
%
%           i.  DM = 0 implies regular ECU operation.
%           ii. DM = 1 implies Diagnostics Mode.
%  
% _All input voltages are 5V._
% 
%% Wheatstone Bridge Design
% For the Values of $R_{1},\;R_{2},\;R_{3},\;TPVR:\;$
% $R_{1}=1.2k\Omega,\;R_{2}=800\Omega,\;R_{3}=2.5k\Omega,\;TPVR=0-10k\Omega$
% 
% The values were calculated using this formula:
%
% $V_{tp}=V \cdot (\frac{R_{1} \cdot R_{3}-R_{2} \cdot TPVR}{(R_{1}+R_{2})\cdot(R_{3}+TPVR)})$
%
% The resistance values chosenprovide a $V_{tp}$ output between -1 and 1.
%% Voltage Divider Design
% For the Values of $R_{s},\;V_{et}:$
% 
% $R_{s}=5000\Omega,\;V_{et}=0-5k\Omega$
%
% $V_{et} = V \cdot (\frac{EVTR}{EVTR+R_{s}})$
%
% The value of $R_{s}$ chosen provides a $V_{et}$ between 0 and 2.5V.
%% Sample AFR Table
% Afr Values corresponding to Throttle Position Voltages versus Engine
% Temperature.
x = -1:.2:1;
y = 150:10:250;
[X,Y] = meshgrid(x,y);
a = round(linspace(-1,1,11),2);
b = [0,linspace(150,250,11)]';
c = round(log((Y.*linspace(1,100,11))),2);
C = [b,[x;c]];
SampleTable = array2table(C)

%% MATLAB Function Output

AfrProject(250,1,0)
AfrProject(250,1,1,220,240,190,200)

%% MATLAB Function Code
%
%   function AfrProject(engTemp,thrPos,DM,varargin)
%   inputArgArr = varargin;
%   varargin = cell2mat(varargin);
%   AFR = round(log(engTemp.*thrPos),2)
%   if(DM == 1)
%       temp1 = varargin(1);
%       temp2 = varargin(2);
%       temp3 = varargin(3);
%       temp4 = varargin(4);
%       x = -1:.2:1;
%       y = 150:10:250;
%       [~,Y] = meshgrid(x,y);
%       Arr = [0,linspace(150,250,11)]';
%       Arr1 = round(log((Y.*linspace(1,100,11))),2);
%       C = [Arr,[x;Arr1]];
%       l = C == temp1;
%       m = C == temp2;
%       n = C == temp3;
%       o = C == temp4;
%       C = [C(l,:);C(m,:);C(n,:);C(o,:)];
%       DmTable = array2table(C)         
%       r = log(temp1.*linspace(1,100,12));
%       s = log(temp2.*linspace(1,100,12));
%       t = log(temp3.*linspace(1,100,12));
%       u = log(temp4.*linspace(1,100,12));
%       plot(linspace(-1,1,12),r);
%       title('AFR plots for given temperatures')
%       ylabel('AFR Values')
%       xlabel('Throttle Position')
%       axis([-1 1 5 10])
%       hold on
%       plot(linspace(-1,1,12),s);
%       plot(linspace(-1,1,12),t);
%       plot(linspace(-1,1,12),u);
%       hold off
%       legend('Temp1','Temp2','Temp3','Temp4','Location','southeast')
%   end
%   if (AFR<5 || AFR>10.15)
%       MIL = 1
%   end
%   end

