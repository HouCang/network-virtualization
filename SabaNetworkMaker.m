% This program
% Fall 2013
% Concordia University
function SabaNetworkMaker(NodeNumber)
% Function SabaNetworkMaker(NodeNumber) 
% returns the K first shortest paths (k_paths) from node source to node destination
% in the a network of N nodes represented by the NxN matrix netCostMatrix.
% In netCostMatrix, cost of 'inf' represents the 'absence' of a link 
% It returns 
% [shortestPaths]: the list of K shortest paths (in cell array 1 x K) and 
% [totalCosts]   : costs of the K shortest paths (in array 1 x K)
%==============================================================
% Meral Shirazipour
% This function is based on Yen's k-Shortest Path algorithm (1971)
% This function calls a slightly modified function dijkstra() 
% by Xiaodong Wang 2004.
% * netCostMatrix must have positive weights/costs
%==============================================================
%  DATE :           December 9 decembre 2009                                 
%  Last Updated:    August 2 2010; January 6 2011; August 2 2011
%  ----Changes April 2 2010:----
%  1-previous version(9/12/2009)did not handle some exceptions which should
%    have returned empty matrices for the return values (added lines 20 and 29)
%  2-includes the changes proposed by Darren Rowland
%  ----Changes January 6 2011:----
%  1-fixed a bug reported by Babak Zafari that prevented from finding ALL
%    the shortest paths in large networks
%==============================================================


%Nodes = cell(0);
Base = struct('NodeType', '--', 'InterfaceType', '--', 'OSType', '--', 'VirtualEnvironmentType', '--', 'NetworkStackType','--','StorageType','--','LinkVirTechnique','--','LinkType','--');

%length(Nodes)-1;

%NodeNumber = input('Please enter number of required nodes: ');
Network = [];
for (i = 1:1:NodeNumber)
    Network = [Network Base];
end

for (j = 1:1:NodeNumber)
    display(sprintf('Node Number %d ... ',j));
    
    Network(j).NodeType = input('Node Type: ');
    Network(j).InterfaceType = input('Interface Type: ');
    Network(j).OSType = input('OS Type: ');
    Network(j).VirtualEnvironmentType = input('Virtual Environment Type: ');
    Network(j).NetworkStackType = input('Network Stack Type: ');
    Network(j).StorageType = input('Storage Type: ');
    Network(j).LinkVirTechnique = input('Link Vir Technique: ');
    Network(j).LinkType = input('Link Type: ');
    
end
save('SabaNetWork.mat','Network')

end