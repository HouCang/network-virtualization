function ACUpdater(shortestPaths, Selected_index, required_BW)

% Function ACUpdater(Father,index, required_AC) is responsible for updating Ac based on selected path 
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
Links= xlsread('VirtualResources.xlsx','Links');
[LRow,LCol] = size(Links);
source = Links(:,5);
destination = Links(:,6);
AC = Links(:,8);

nodes = shortestPaths{Selected_index(1)};
L_node_numbers = length(nodes);

for j=1:L_node_numbers-1
    S = nodes(j:j+1);
    if (S(1)> S(2))
       temp_S = S(1);
       S(1) = S(2);
       S(2) = temp_S;
    end 
    index_temp1 = find(source == S(1));
    index_temp2 = find(destination == S(2));
    index_1 = intersect(index_temp1,index_temp2);
    AC(index_1) =  AC(index_1)- required_BW;
end
    Links(:,8) = AC;
    s_range = sprintf('A2:H%d',LRow+1);
    xlswrite('VirtualResources.xlsx',Links,'Links',s_range)
end
