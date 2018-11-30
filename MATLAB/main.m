%script for processing obj files

%%
% Set the file name:
file = 'sample_with_dots.obj';
%%
% Display the time to import the .obj file (true/false):
timer = true;
%%
% Import the vertices:
vertices = importOBJ(file,timer);
%% 
%convert to point cloud and plot:
ptCloud = plotVertices(vertices, timer);
%%
% Set desired color range:
colorRange = [0.05, 0.5; ... %Red   min. and max.
              0.1, 0.3; ... %Green min. and max.
              0.1, 0.3];    %Blue  min. and max.
% Filter out points that are not in the desured color range:
vertices = filterColor(vertices, colorRange, timer);
%% 
%convert to point cloud and plot:
ptCloud = plotVertices(vertices, timer);