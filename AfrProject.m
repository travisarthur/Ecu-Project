function AfrProject(engTemp,thrPos,DM,varargin)

inputArgArr = varargin;
varargin = cell2mat(varargin);

AFR = round(log(engTemp.*thrPos),2)

if(DM == 1)
   temp1 = varargin(1);
   temp2 = varargin(2);
   temp3 = varargin(3);
   temp4 = varargin(4);
   x = -1:.2:1;
   y = 150:10:250;
   [~,Y] = meshgrid(x,y);
   Arr = [0,linspace(150,250,11)]';
   Arr1 = round(log((Y.*linspace(1,100,11))),2);
   C = [Arr,[x;Arr1]];
   l = C == temp1;
   m = C == temp2;
   n = C == temp3;
   o = C == temp4;
   C = [C(l,:);C(m,:);C(n,:);C(o,:)];
   DmTable = array2table(C) %#ok<*NASGU,*NOPRT>
   
   r = log(temp1.*linspace(1,100,12));
   s = log(temp2.*linspace(1,100,12));
   t = log(temp3.*linspace(1,100,12));
   u = log(temp4.*linspace(1,100,12));
   
   plot(linspace(-1,1,12),r);
   title('AFR plots for given temperatures')
   ylabel('AFR Values')
   xlabel('Throttle Position')
   axis([-1 1 5 10])
   hold on
   plot(linspace(-1,1,12),s);
   plot(linspace(-1,1,12),t);
   plot(linspace(-1,1,12),u);
   hold off
   legend('Temp1','Temp2','Temp3','Temp4','Location','southeast')
end

if (AFR<5 || AFR>10.15)
    MIL = 1
end




end

