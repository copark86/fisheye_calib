function Draw_Calib_Board(T,col)

hold on
[a b chess]=generate_chess_board(132 ,250.8,1,1);
colors = 'brgkcm';
% Transform the chess board 
chess_w = [chess(1,:);chess(2,:);zeros(1, length(chess(1,:)));ones(1, length(chess(1,:)))];
tmp=chess_w(:,3)
chess_w(:,3)=chess_w(:,4)
chess_w(:,4)=tmp


chess1 = T*chess_w;

aaax=reshape(chess1(1,:),2,2,1)
aaay=reshape(chess1(2,:),2,2,1)
aaaz=reshape(chess1(3,:),2,2,1)
hhh=mesh(aaax,aaay,aaaz)
set(hhh,'edgecolor',colors(col),'linewidth',1);
hold off