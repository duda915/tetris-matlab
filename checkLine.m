function gameFieldOut = checkLine( gameFieldHandle, gameTileSize)
%CHECKLINE Summary of this function goes here

%   Detailed explanation goes here
blockEmpty = imread('res/blockempty.png');

gameFieldCopy = gameFieldHandle;
gameFieldSize = size(gameFieldCopy);
gameFieldWidth = gameFieldSize(2);
gameFieldHeight = gameFieldSize(1);
widthStart = gameTileSize + 1;
widthStop = gameFieldWidth - gameTileSize;
heightStart = gameTileSize  + 1;
heightStop = gameFieldHeight - gameTileSize;

gameWidthBlocks = gameFieldWidth/gameTileSize - 2;
gameHeightBlocks = gameFieldHeight/gameTileSize - 2;

for i=heightStart:gameTileSize:heightStop
    blocks = 0;
    for j = widthStart:gameTileSize:widthStop
        if(gameFieldCopy(i, j, 1) == 255)
            if(gameFieldCopy(i, j, 2) == 223)
                if(gameFieldCopy(i, j, 3) == 186)
                    blocks = blocks + 1;
                end 
            end
        end
    end
    if blocks == 0
        for j = widthStart:gameTileSize:widthStop
            gameFieldCopy = deleteComplexObject(gameFieldCopy, blockEmpty, [j, i]);
        
        end
        gameFieldCopy(i+gameTileSize-1:-1:heightStart+gameTileSize, widthStart:widthStop, :) = gameFieldCopy(i-1:-1:heightStart, widthStart:widthStop, :);
    end
end
gameFieldOut = gameFieldCopy;
end

