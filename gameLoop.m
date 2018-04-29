function gameLoop(handles, gameFieldHandle, scoreHandle)
%GAMELOOP Summary of this function goes here
%   Detailed explanation goes here

gameState = get(handles.gameState, 'userdata');

% Res
block1 = imread('res/block1.png');
block2 = imread('res/block2.png');
block3 = imread('res/block3.png');
block4 = imread('res/block4.png');
block5 = imread('res/block5.png');
block6 = imread('res/block6.png');
block7 = imread('res/block7.png');
blockEmpty = imread('res/blockempty.png');

%% Util vars
activeBlock = block1;

blockWidth = 12;
blockWidthLBorder = 2;
blockWidthRBorder = 11;
blockHeight = 22;
blockHeightEnd = 20;

blockRandomizer = randi(7);
blockSize = size(block1);
gameTileSize = blockSize(1);
gravityIter = 6;
tickTime = 1/60;
tickIterator = 0;
% blockBuilderStart(1) = [gameTileSize*6, gameTileSize*1; gameTileSize*5, gameTileSize*1];
blockBuilderJ = [gameTileSize*5, gameTileSize*1; gameTileSize*5, gameTileSize*2; gameTileSize*6, gameTileSize*2; gameTileSize*7, gameTileSize*2];
blockBuilderL = [gameTileSize*7, gameTileSize*1; gameTileSize*5, gameTileSize*2; gameTileSize*6, gameTileSize*2; gameTileSize*7, gameTileSize*2];
blockBuilderI = [gameTileSize*5, gameTileSize*1; gameTileSize*6, gameTileSize*1; gameTileSize*7, gameTileSize*1; gameTileSize*4, gameTileSize*1];
blockBuilderO = [gameTileSize*5, gameTileSize*1; gameTileSize*6, gameTileSize*1; gameTileSize*5, gameTileSize*2; gameTileSize*6, gameTileSize*2];
blockBuilderS = [gameTileSize*5, gameTileSize*1; gameTileSize*6, gameTileSize*1; gameTileSize*5, gameTileSize*2; gameTileSize*4, gameTileSize*2];
blockBuilderZ = [gameTileSize*4, gameTileSize*1; gameTileSize*5, gameTileSize*1; gameTileSize*5, gameTileSize*2; gameTileSize*6, gameTileSize*2];
blockBuilderT = [gameTileSize*5, gameTileSize*1; gameTileSize*4, gameTileSize*2; gameTileSize*5, gameTileSize*2; gameTileSize*6, gameTileSize*2];

blockBuilder = blockBuilderT;
%% Game Loop
gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
while(gameState == 1)
    %% Update 
    p = get(gcf, 'CurrentCharacter');
    
    if(p~= 'x')
        
        if(p == 'a')
            collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'left');
            if(collision == 0)
                disp('success left');
                gameFieldHandle = drawComplexObject(gameFieldHandle, blockEmpty, blockBuilder);
                blockBuilder(:, 1) = blockBuilder(:, 1) - gameTileSize;
                gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
            end
        elseif p == 'd'
            collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'right');
            if(collision == 0)
                disp('success right');
                gameFieldHandle = drawComplexObject(gameFieldHandle, blockEmpty, blockBuilder);
                blockBuilder(:, 1) = blockBuilder(:, 1) + gameTileSize;
                gameFieldHandle = drawComplexObject(gameFieldHandle, activeBlock, blockBuilder);
            end
        elseif p == 's'
            tickIterator = gravityIter;
        end
        
        set(gcf, 'CurrentCharacter', 'x');
    end
        
    
    if tickIterator == gravityIter
        collision = getCollision(gameFieldHandle, gameTileSize, blockBuilder, 'down');
        tickIterator = 0;
        if(collision == 1)
            blockRandomizer = randi(7);
            switch blockRandomizer
                case 1
                    blockBuilder = blockBuilderJ;
                    activeBlock = block1;
                case 2
                    blockBuilder = blockBuilderL;
                    activeBlock = block2;
                case 3
                    blockBuilder = blockBuilderI;
                    activeBlock = block3;
                case 4
                    blockBuilder = blockBuilderO;
                    activeBlock = block4;
                case 5
                    blockBuilder = blockBuilderS;
                    activeBlock = block5;
                case 6
                    blockBuilder = blockBuilderZ;
                    activeBlock = block6;
                case 7
                    blockBuilder = blockBuilderT;
                    activeBlock = block7;
            end
            
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

