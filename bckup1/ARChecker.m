function result = ARChecker(Net,index3)

% Function ARChecker(index3) checks our selected nodes availble resources
% valuse and select the node with maximum AR
% index3 is the vactor of input node numbers
% result is our selected node
%==============================================================
% Saba Behrouznia
% Concordia University, Montreal, QC, Canada
% 2011- 2013
%==============================================================
%  DATE :            October 2013                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%==============================================================
Links = xlsread('VirtualResources.xlsx','Links');
AC_Links = Links(:,8);
Sources = Links(:,5);
destination = Links(:,6);
AC_Nodes = Net(:,11);
L = length(index3);
AR = [];

for i = 1: L
  index = index3(i);  
  Temp1 = find(Sources == index);
  Temp2 = find(destination == index);
  Temp = union(Temp1, Temp2);
  AR = [AR sum(AC_Links(Temp))*AC_Nodes(index)];
end 
[C,I] = max(AR);

result = index3(I);

end