function blockBuilderOut = rotateBlock(gameFieldHandle, gameTileSize, blockBuilder, activeBlock)
%ROTATEBLOCK Summary of this function goes here
%   Detailed explanation goes here
blockSquare = imread('res/block4.png');
blockEmpty = imread('res/blockempty.png');
blockSize = size(blockEmpty);
gameTileSize = blockSize(1);
gameFieldCopy = gameFieldHandle;
gameFieldCopy = drawComplexObject(gameFieldCopy, blockEmpty, blockBuilder);
blockBuilderCopy = blockBuilder;

if activeBlock == blockSquare
    blockBuilderOut = blockBuilder;
    return;
end

for i = 2:size(blockBuilderCopy)
    distX = blockBuilderCopy(i, 1) - blockBuilderCopy(1, 1);
    distY = blockBuilderCopy(i, 2) - blockBuilderCopy(1, 2);
    blockBuilderCopy(i, 1) = blockBuilderCopy(1, 1) - distY;
    blockBuilderCopy(i, 2) = blockBuilderCopy(1, 2) + distX;
    disp('rot');
end

collision = getCollision(gameFieldCopy, gameTileSize, blockBuilderCopy, 'center');

disp(collision);
if(collision == 0)
    disp('here');
    blockBuilderOut = blockBuilderCopy;
else
    blockBuilderOut = blockBuilder;
end
end

