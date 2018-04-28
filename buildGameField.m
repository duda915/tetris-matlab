function gameField = buildGameField(widthInBlocks, heightInBlocks )
%BUILDGAMEFIELD Summary of this function goes here
%   Detailed explanation goes here
borderBlock = imread('res/border.png');
borderBlockSize = size(borderBlock);
gameTileSize = borderBlockSize(1);
fieldWidth = widthInBlocks*gameTileSize;
fieldHeight = heightInBlocks*gameTileSize;
tmpField = ones(fieldHeight, fieldWidth, 3, 'uint8');
tmpField(:,:,1) = tmpField(:,:,1) * 255;
tmpField(:,:,2) = tmpField(:,:,2) * 223;
tmpField(:,:,3) = tmpField(:,:,3) * 186;


for i = 1:gameTileSize:fieldWidth
    tmpField = drawObject(tmpField, borderBlock, i, 1);
    tmpField = drawObject(tmpField, borderBlock, i, fieldHeight - gameTileSize);
end
for i = gameTileSize:gameTileSize:fieldHeight-gameTileSize
    tmpField = drawObject(tmpField, borderBlock, 1, i);
    tmpField = drawObject(tmpField, borderBlock, fieldWidth - gameTileSize+1, i);
end
gameField = tmpField;

end

