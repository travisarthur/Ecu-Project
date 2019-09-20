function AfrProject(engTemp,thrPos,DM,varargin)
varargin = cell2mat(varargin);
AFR = round(log(engTemp.*thrPos),2)
if(DM == 1)
   temp1 = varargin(1);
   temp2 = varargin(2);
   temp3 = varargin(3);
   temp4 = varargin(4);
   x =   linspace(-1,1,11);
   y =   round(linspace(32,250,218));
   [~,Y] = meshgrid(x,y);
   Arr = [0,round(linspace(32,250,218))]';
   Arr1 = round(log((Y.*linspace(1,100,11))),2);
   C = [Arr,[x;Arr1]];
   l = C == temp1;
   m = C == temp2;
   n = C == temp3;
   o = C == temp4;
   C = [ 0 -1 -.8 -.6 -.4 -.2 0 .2 .4 .6 .8 1;C(l,:);C(m,:);C(n,:);C(o,:)];
   DmTable = array2table(C) %#ok<*NASGU,*NOPRT>
   jj = 1;
   while jj <= 4
    plot(linspace(-1,1,12),log(varargin(jj).*linspace(1,100,12)));
    hold on
    jj = jj +1;
   end
   title('AFR plots for given temperatures')
   ylabel('AFR Values');xlabel('Throttle Position');axis([-1 1 5 10])
   legend('Temp1','Temp2','Temp3','Temp4','Location','southeast')
   hold off
end

if (AFR<5 | AFR>10.15) %#ok<OR2>
    MIL = 1
else 
    MIL = 0;
end
end


