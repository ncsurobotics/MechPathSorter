% Path Detector
% Gabriel Chenevert
% 6/24/2023
% AquaPack Robotics
clear; clc;

%% Path Thresholdes
fullPath    = 8000;     % One full path
path60      = 8721*.6;  % 60% of a path
path25      = 8721*.25; % 25% of a path
noPath      = 800;      % No path

%% Directories
imageDirectory      = 'Images\';    % Image directory
fullPathDirectory   = 'fullPath\';  % Full paths
path60Directory     = 'path60\';    % 60% paths
path25Directory     = 'path25\';    % 25% paths
potentialPath       = 'potPath\';   % Borderline path
noPathDirectory     = 'noPath\';    % no paths

%% Hunt Images

% Getting a list of all .jpg files in videoDirectory
imageFiles = dir(fullfile(imageDirectory, '*.jpg'));

% Iterating through images
for i = 1 : length(imageFiles)

    % Importing image
    image = imread([imageDirectory imageFiles(i).name]);

    % Passing to pathMask
    [BW, mask] = pathMask(image);

    % Checking how much of a path we have pathed
    pathAmount = sum(sum(BW));

    % Checking if full path
    if(pathAmount >= fullPath)

        % Full path detected, wiriting file
        imwrite(image,[fullPathDirectory imageFiles(i).name]);
        disp("PATH!!!")

    % Checking if 60% path
    elseif(pathAmount >= path60)

        % 60% of a path detected
        imwrite(image,[path60Directory imageFiles(i).name]);

    % Checking if 25% path
    elseif(pathAmount >= path25)

        % 25% of a path detected
        imwrite(image,[path25Directory imageFiles(i).name]);

    % Checking if there might be some path
    elseif(pathAmount >= noPath)

        % x% of a path detected
        imwrite(image,[potentialPath imageFiles(i).name]);

    % There is no path.... sad.
    else

        % No path detected
        imwrite(image,[noPathDirectory imageFiles(i).name]);
    end
end