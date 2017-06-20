clear all
close all

%% �̹��� ��� �ҷ����� ��.
img_list = dir('*.png');


for i=1:length(img_list)
    
    img_list(i).data = imread(img_list(i).name);
    
end

%% ����ü ���� ������ �ִ� ��.
load 'img_1_calib_data.txt';
img_coor = img_1_calib_data(:, 1:2);
board_coor = img_1_calib_data(:, 4:5);
Data=repmat(struct('img', img_list(1).data, 'img_coor', img_coor, 'board_coor', board_coor), length(img_list), 1);  

for i=2:20
    calib = load(sprintf('img_%d_calib_data.txt', i));
    img_coor = calib(:, 1:2);
    board_coor = calib(:, 4:5);
    
    Data(i) = struct('img', img_list(i).data, 'img_coor', img_coor, 'board_coor', board_coor);
end

%%
if 0
    for i = 1:20
        imshow(Data(i).img);
        hold on;
        plot(Data(i).board_coor(:,1), Data(i).board_coor(:,2),'rs');
        i
        pause
    end
end

%%


f = 1.055;
ps = 0.003;

u0 = 1920/2;
v0 = 1080/2;

fx = f/ps;
fy = f/ps;

K = [fx 0 u0;0 fy v0;0 0 1];
invK = inv(K)

i = 17
imshow(Data(i).img);

hold on;
for k = 1:length(Data(i).board_coor(:,1))
[xo yo] = GetUndistortedXY(Data(i).board_coor(k,1), Data(i).board_coor(k,2),K,invK,f)



plot(Data(i).board_coor(k,1), Data(i).board_coor(k,2),'bs');
plot(xo, yo,'rs');

end





