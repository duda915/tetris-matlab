function collision = getSingleBlockCollision( gameFieldHandle, gameTileSize, posX, posY, mode )
%GETSINGLEBLOCKCOLLISION Summary of this function goes here
%   Detailed explanation goes here
collision = 1;

posX = posX+1;
posY = posY+1;


if strcmp(mode, 'down') == 1
    if(gameFieldHandle(posY + gameTileSize, posX, 1) == 255)
        if(gameFieldHandle(posY + gameTileSize, posX, 2) == 223)
            if(gameFieldHandle(posY + gameTileSize, posX, 3) == 186)
                collision = 0;
            end
        end
    end
elseif strcmp(mode, 'left') == 1
    disp('topleft:');
    disp(gameFieldHandle(posY - gameTileSize, posX - gameTileSize, 1));
    disp(gameFieldHandle(posY - gameTileSize, posX - gameTileSize, 2));
    disp(gameFieldHandle(posY - gameTileSize, posX - gameTileSize, 3));
    disp('left:');
    disp(gameFieldHandle(posY, posX - gameTileSize, 1));
    disp(gameFieldHandle(posY, posX - gameTileSize, 2));
    disp(gameFieldHandle(posY, posX - gameTileSize, 3));
    disp('botleft:');
    disp(gameFieldHandle(posY + gameTileSize, posX - gameTileSize, 1));
    disp(gameFieldHandle(posY + gameTileSize, posX - gameTileSize, 2));
    disp(gameFieldHandle(posY + gameTileSize, posX - gameTileSize, 3));

    if(gameFieldHandle(posY, posX - gameTileSize, 1) == 255)
        disp('if');
        if(gameFieldHandle(posY, posX - gameTileSize, 2) == 223)
            disp('if');
            if(gameFieldHandle(posY, posX - gameTileSize, 3) == 186)
                disp('nocollition');
                collision = 0;
            end
        end
    end
elseif strcmp(mode, 'right') == 1
    if(gameFieldHandle(posY, posX + gameTileSize, 1) == 255)
        if(gameFieldHandle(posY, posX + gameTileSize, 2) == 223)
            if(gameFieldHandle(posY, posX + gameTileSize, 3) == 186)
                    collision = 0;
            end
        end
    end
end
end

