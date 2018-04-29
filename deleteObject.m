function gameFieldOutput = deleteObject( gameFieldInput, object, posX, posY )
%DELETEOBJECT Summary of this function goes here
%   Detailed explanation goes here
gameFieldCopy = gameFieldInput;
objectSize = size(object);
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) * 0;
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) * 0;
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) * 0;
gameFieldOutput = gameFieldCopy;

end

