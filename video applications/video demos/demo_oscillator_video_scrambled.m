%% make oscillator video and training video patches

%make oscillator video
n = 30;
omegas = [2, 8, 32];
T = 100;
oscillator_video_scrambled = make_oscillator_video(n, omegas, T);

%scramble order
oscillator_video_scrambled = oscillator_video_scrambled(:, :, :, randperm(T));



%get short time video patches for training data
num_frames = 20;
num_patches = T - num_frames + 1;
video_patches_cell = cell(1, num_frames);
for t = 1 : num_patches
    patch = oscillator_video_scrambled(:, :, :, t : t + num_frames - 1);
    video_patches_cell{t} = patch;
end






%% apply online-NTF

R = 25;
dictionary_cell = online_NTF(video_patches_cell, R);


%%
num_rows = 5;
num_cols = 5;
dict_scrambled = concatenate_video_cell(dictionary_cell, num_rows, num_cols);
implay(dict_scrambled);