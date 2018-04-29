function gameLoop(handles, gameFieldHandle, scoreHandle)
%GAMELOOP Summary of this function goes here
%   Detailed explanation goes here

gameState = get(handles.gameState, 'userdata');

% Res
block1 = imread('res/block1.png');
block2 = imread('res/block2.png');
block3 = imread('res/block3.png');
blockEmpty = imread('res/blockempty.png');

%% Util vars
activeBlock = block1;

blockWidth = 12;
blockWidthLBorder = 2;
blockWidthRBorder = 11;
blockHeight = 22;
blockHeightEnd = 20;

blockRandomizer = randi(3);
blockSize = size(block1);
gameTileSize = blockSize(1);
gravityIter = 6;
tickTime = 1/60;
tickIterator = 0;
blockBuilderStart = [gameTileSize*5, gameTileSize*1];
blockBuilder = blockBuilderStart;
%% Game Loop
gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
while(gameState == 1)
    %% Update 
    p = get(gcf, 'CurrentCharacter');
    
    if(p~= 'x')
        
        if(p == 'a')
            disp('trying left collision:');
            collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'left');
            disp(collision);
            if(collision == 0)
                disp('success left');
                gameFieldHandle = drawComplexObject(gameFieldHandle, blockEmpty, blockBuilder);
                blockBuilder(:, 1) = blockBuilder(:, 1) - gameTileSize;
                gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
            end
        elseif p == 'd'
            disp('trying right collision:');
            collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'right');
            disp(collision);
            if(collision == 0)
                disp('success right');
                gameFieldHandle = drawComplexObject(gameFieldHandle, blockEmpty, blockBuilder);
                blockBuilder(:, 1) = blockBuilder(:, 1) + gameTileSize;
                gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
            end
        end
        
        set(gcf, 'CurrentCharacter', 'x');
    end
        
    
    if tickIterator == gravityIter
        collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'down');
        tickIterator = 0;
        if(collision == 1)
            blockBuilder = blockBuilderStart;
            gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
        else
            gameFieldHandle = drawComplexObject(gameFieldHandle, blockEmpty, blockBuilder);
            blockBuilder(:, 2) = blockBuilder(:, 2) + gameTileSize;
            gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
        end
    end
    
    gameState = get(handles.gameState, 'userdata');

    handles.scoreLabel.String = tickIterator;
    
    %% Render
    axes(handles.gameAxes);
    imshow(gameFieldHandle);
    tickIterator = tickIterator+1;
    pause(tickTime);
    
end
            
    
     
end

