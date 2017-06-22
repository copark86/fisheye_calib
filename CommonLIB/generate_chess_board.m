function [chess_h_plane chess_h chess] = generate_chess_board(onex, oney,numofx,numofy)

% Define the size of one block in calibration board
% onex = 11.5;
% oney = 11.5;

% Define the four point locations of outside features
onex2 = onex*numofx ;
oney2 = oney*numofy;
chess = [0 onex2 onex2 0; 0 0 oney2  oney2 ];




% Generate the whole chess board for displaying

for k = 0*onex:onex:onex*10
    try
        
    y = [y -0*oney:oney:oney*10];
    x = [x (-0*onex:onex:onex*10)*0+k];
    catch
    y = -0*oney:oney:oney*10;
    x = (-0*onex:onex:onex*10)*0;
    end
end
chess_h_plane = [x;y;ones(1, length(x))];
chess_h = [chess;1 1 1 1];
