% Nuke
% Gabriel Chenevert
% 6/26/2023
% AquaPack Robotics

%% Directories
fullPathDirectory   = 'fullPath\';  % Full paths
path60Directory     = 'path60\';    % 60% paths
path25Directory     = 'path25\';    % 25% paths
potentialPath       = 'potPath\';   % Borderline path
noPathDirectory     = 'noPath\';    % no paths

%% Deploying assured destruction

% Nuking full path
delete([fullPathDirectory '*']);

% Nuking path60
delete([path60Directory '*']);

% Nuking path25
delete([path25Directory '*']);

% Nuking potPath
delete([potentialPath '*']);

% Nuking noPath
delete([noPathDirectory '*']);