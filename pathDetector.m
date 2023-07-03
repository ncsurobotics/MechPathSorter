% Path Detector
% Gabriel Chenevert
% 6/24/2023
% AquaPack Robotics
clear; clc;

%% Invoking paralell compute
parpool

%% Path Thresholdes
fullPath    = 8000;     % One full path
path60      = 8721*.6;  % 60% of a path
path25      = 8721*.25; % 25% of a path
noPath      = 800;      % No path

%% Directories
videoDirectory      = 'Video\';     % Video directory
fullPathDirectory   = 'fullPath\';  % Full paths
path60Directory     = 'path60\';    % 60% paths
path25Directory     = 'path25\';    % 25% paths
potentialPath       = 'potPath\';   % Borderline path
noPathDirectory     = 'noPath\';    % no paths

%% Hunt Videos

% Getting a list of all .mp4 files in videoDirectory
videoFiles = dir(fullfile(videoDirectory, '*.mp4'));

%% Processing images in videos

% Iterating through images
for i = 1 : length(videoFiles)

    % Attatching video reader to video file
    thisVideo = VideoReader([videoDirectory videoFiles(i).name]);

    % Converting frame to image and processing
    parfor j = 1 : thisVideo.NumFrames
    
        % Getting next frame as image
        image = readFrame(thisVideo);
    
        % Passing to pathMask
        [BW, mask] = pathMask(image);
    
        % Checking how much of a path we have pathed
        pathAmount = sum(sum(BW));
    
        % Checking if full path
        if(pathAmount >= fullPath)
    
            % Full path detected, wiriting file
            imwrite(image,[fullPathDirectory videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg']);
    
        % Checking if 60% path
        elseif(pathAmount >= path60)
    
            % 60% of a path detected
            imwrite(image,[path60Directory videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg']);
    
        % Checking if 25% path
        elseif(pathAmount >= path25)
    
            % 25% of a path detected
            imwrite(image,[path25Directory videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg']);
    
        % Checking if there might be some path
        elseif(pathAmount >= noPath)
    
            % x% of a path detected
            imwrite(image,[potentialPath videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg']);
    
        % There is no path.... sad.
        else
    
            % No path detected
            imwrite(image,[noPathDirectory videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg']);
        end
    end
end