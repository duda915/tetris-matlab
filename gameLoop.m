function gameLoop(handles, gameFieldHandle, scoreHandle)
%GAMELOOP Summary of this function goes here
%   Detailed explanation goes here
% set(handles.gameState, 'userdata', 1);
gameState = get(handles.gameState, 'userdata');
gameTileSize = 64;
block1 = imread('res/block1.png');
block2 = imread('res/block2.png');
block3 = imread('res/block3.png');
ran = 1;
while(gameState == 1)
    
    gameFieldHandle = deleteObject(gameFieldHandle, block1, gameTileSize*4 , gameTileSize*3);
    gameState = get(handles.gameState, 'userdata');
    if(ran == 1)
        gameFieldHandle = drawObject(gameFieldHandle, block1, gameTileSize*4 , gameTileSize*3);
    elseif ran == 2
        gameFieldHandle = drawObject(gameFieldHandle, block2, gameTileSize*4 , gameTileSize*3);
    elseif ran == 3
        gameFieldHandle = drawObject(gameFieldHandle, block3, gameTileSize*4 , gameTileSize*3);
        ran = 0;
    end
    handles.scoreLabel.String = ran;
    ran = ran + 1;
    axes(handles.gameAxes);
    imshow(gameFieldHandle);
    pause(0.01);
end
            
    
     
end

