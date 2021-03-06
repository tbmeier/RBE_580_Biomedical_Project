%% plotClusters
% This Function takes in a cell array of point clouds and plots them all on
% the same graph in the specified colors. There is the option to plot the
% hand label diagram as well. 
function plotClusters (ptCloudCell, name, colored, original, diagram, plot, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of point clouds in the cell array:
numClouds = size(ptCloudCell,1);
%%
% Sets the color matrix based on the input:
if strcmp(colored, 'Jet') || strcmp(colored, 'jet')
    %%
    % Change the color data to a range of color values:
    color = uint8(255*colormap(jet(numClouds)));
else
    %%
    % Change the color data to all black except the desired cluster that
    % will be plotted in blue:
    color = zeros(numClouds,3);
    %%
    % The blue cluster will be the input number:
    color(colored,3) = 255;
end
%%
% Plot the clusters:
if plot
    %%
    % Checks if a diagram will be displayed:
    if diagram
        %%
        % Create the figure with a specific orientation:
        figure('Name',name, ...
               'Position', [10, 10, 1600, 800]);
    else
        %%
        % Otherwise just create the figure with the default orientation:
        figure('Name',name);
    end
    %%
    % Set title:
    title(name);
    hold on;
    %%
    % Iterate through all the point clouds, plotting them in different colors:
    for i = 1:numClouds
        %%
        % Grab the point cloud cluster from the cell array:
        cluster = ptCloudCell{i,1};
        %%
        % Change the color of the point cloud:
        for k = 1:cluster.Count
            cluster.Color(k,:) = color(i,:);
        end
        %%
        % Plot point cloud:
        pcshow(cluster);
    end
    %%
    % converts the current plot to a subplot of the diagram is being
    % displayed as well:
    if diagram
        subplot(1,3,1,gca);
    end
    %%
    % Plots the hand label diagram and the original point cloud if desired:
    if diagram
        %%
        % Set the file name for the diagram:
        diagramName = '../Diagrams/Hand Labels.png';
        %% 
        % Plot the diagram:
        subplot(1,3,2);
        imshow(diagramName);
        title('Diagram of Marker Locations');
        %%
        % Plot the original point cloud:
        subplot(1,3,3);
        pcshow(original);
        title('Original Hand Scan');
    end
end
%%
% End timer:
if timer
    toc;
end
end