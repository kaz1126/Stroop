%% Create tract movie
clear;
% ****** set parameter *********
task = 'stroop_or_not'; 
timing = 'Res_On';
NF = '1000';
NS = '500000';
NSK = strcat(num2str(str2num(NS)/1000), 'k');
thres = '0.05';
SS = '0';
condition = 'ROI2ROI';
Connect_thres = 0.5 ; 
min_transparency = 0.1;
% ******************************
savedir = 'output folder'; % put your output folder
cd(savedir);
savename = fullfile(savedir,'tractography_movie');
% load tract data
Tract1 = load('Stroop_demo_tractography_data.mat'); % load demo tract data
Tract2 = Tract1;
Tract1.Data.time = Tract1.Data.time -100;
Tract2.Data.time = Tract2.Data.time -100;
% ***** set condition ********************
fontsize = 6; 
left_name = 'stroop-green';
right_name = 'not-pink';
% *** for movie ***
Export_Movie = 1; % 1 = generate movie file
movie_time_range =[-600 -550];
frame_number=3; 
% *** for snapshots ***
Export_Fig = 1;% 1 = generate snapshot file
Snapshot_time = [-600]; % [-400 -300 -200 -100 0 100]
amp_color_range=[-1 1]; 
Timeunit = 10; % ms
Side1 = Tract1.Data.tract_name;
Side2 = Tract2.Data.tract_name;
Setting.fnum = size(Tract1.Data.Alpha,2);
Setting.Time_all = Tract1.Data.time;
Alpha1 = Tract1.Data.Alpha';
Alpha2 = Tract2.Data.Alpha';
Tract_1 = Tract1.Tract;
Tract_2 = Tract2.Tract;
Title = [task];
% *** generate movie ***
stroop_tractography(Alpha1,Alpha2,Setting,savename,amp_color_range,Timeunit,frame_number,movie_time_range,fontsize,Title,left_name,right_name,Export_Movie,Export_Fig,Snapshot_time,Tract_1,Tract_2,mesh_lh,mesh_rh,Side1,Side2)
