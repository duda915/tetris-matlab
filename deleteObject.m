function gameFieldOutput = deleteObject( gameFieldInput, object, posX, posY )
%DELETEOBJECT Summary of this function goes here
%   Detailed explanation goes here
gameFieldCopy = gameFieldInput;
objectSize = size(object);
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = 255;
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = 223;
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), 1) = 186;
gameFieldOutput = gameFieldCopy;

end

