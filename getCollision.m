function collision = getCollision(gameFieldHandle, gameTileSize, positionArray, mode)
%GETCOLLISION Summary of this function goes here
%   Detailed explanation goes here
posSize = size(positionArray);
collision = 0;
for i = 1:posSize(1)
    if(getSingleBlockCollision(gameFieldHandle, gameTileSize, positionArray(i, 1), positionArray(i, 2), mode) == 1);
        collision = 1;
    end
end

