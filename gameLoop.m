function gameLoop(handles, gameFieldHandle, scoreHandle)
%GAMELOOP Summary of this function goes here
%   Detailed explanation goes here
% set(handles.gameState, 'userdata', 1);
gameState = get(handles.gameState, 'userdata');
while(gameState == 1)
    disp('elo');
    gameState = get(handles.gameState, 'userdata');
    pause(0.1); 
end
end

