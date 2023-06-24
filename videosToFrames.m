% Videos to Frames
% Gabriel Chenevert
% 6/24/2023
% AquaPack Robotics
clear; clc;

%% Importing video

% Locating video files
videoDirectory = 'Video\';

% Getting a list of all files in videoDirectory
videoFiles = dir(fullfile(videoDirectory, '*.mp4'));

%% Converting video to images

% Storing image directory
imageDirectory = 'Images\';

% Iterating through video files
for i = 1 : length(videoFiles)

    % Attatching video reader
    thisVideo = VideoReader([videoDirectory videoFiles(i).name]);

    % Creating iterable to count frames
    j = 1;

    % Converting all frames to images
    while hasFrame(thisVideo)

        % Getting the next frame
        img = readFrame(thisVideo);

        % Generating the name for the image
        filename = [imageDirectory videoFiles(i).name(1:end-4) sprintf('%03d',j) '.jpg'];

        % Writing images
        imwrite(img, filename);

        % Iterating j
        j = j+1;
    end
end