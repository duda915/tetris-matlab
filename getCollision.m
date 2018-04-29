function collision = getCollision(gameFieldHandle, gameTileSize, positionArray, mode)
%GETCOLLISION Summary of this function goes here
%   Detailed explanation goes here
posSize = size(positionArray);
k = 1;
collisionBuilder(1,1) = positionArray(1,1);
collisionBuilder(1,2) = positionArray(1,2);

if strcmp(mode, 'left')
    tmpset(k) = positionArray(1,2);
    k = k+1;
    for i = 2:posSize(1)
        if(ismember(positionArray(i, 2), tmpset) == 0)
            tmpset(k) = positionArray(i, 2);
            collisionBuilder(k, 1) = positionArray(i, 1);
            collisionBuilder(k, 2) = positionArray(i, 2);
            k = k+1;
        else
            testMember = ismember(tmpset, positionArray(i, 2));
            for j = 1:size(tmpset)
                if testMember(j) == 1
                    if collisionBuilder(j, 1) > positionArray(i, 1)
                        collisionBuilder(j,1) = positionArray(i, 1);
                        collisionBuilder(j,2) = positionArray(i, 2);
                    end
                end
            end
        end
    end
                
elseif strcmp(mode, 'right')
    tmpset(k) = positionArray(1,2);
    k = k+1;
    for i = 2:posSize(1)
        if(ismember(positionArray(i, 2), tmpset) == 0)
            tmpset(k) = positionArray(i, 2);
            collisionBuilder(k, 1) = positionArray(i, 1);
            collisionBuilder(k, 2) = positionArray(i, 2);
            k = k+1;
        else
            testMember = ismember(tmpset, positionArray(i, 2));
            for j = 1:size(tmpset)
                if testMember(j) == 1
                    if collisionBuilder(j, 1) < positionArray(i, 1)
                        collisionBuilder(j,1) = positionArray(i, 1);
                        collisionBuilder(j,2) = positionArray(i, 2);
                    end
                end
            end
        end
    end
    
elseif strcmp(mode, 'down')
    tmpset(k) = positionArray(1,1);
    k = k+1;
    for i = 2:posSize(1)
        if(ismember(positionArray(i, 1), tmpset) == 0)
            tmpset(k) = positionArray(i, 1);
            collisionBuilder(k, 1) = positionArray(i, 1);
            collisionBuilder(k, 2) = positionArray(i, 2);
            k = k+1;
        else
            testMember = ismember(tmpset, positionArray(i, 1));
            for j = 1:size(tmpset)
                if testMember(j) == 1
                    if collisionBuilder(j, 2) < positionArray(i, 2)
                        collisionBuilder(j,1) = positionArray(i, 1);
                        collisionBuilder(j,2) = positionArray(i, 2);
                    end
                end
            end
        end
    end
end

posSize = size(collisionBuilder);

collision = 0;
for i = 1:posSize(1)
    if(getSingleBlockCollision(gameFieldHandle, gameTileSize, collisionBuilder(i, 1), collisionBuilder(i, 2), mode) == 1);
        collision = 1;
    end
end

