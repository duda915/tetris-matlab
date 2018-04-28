function gameFieldOutput = drawObject( gameFieldInput, object, posX, posY )
%DRAWOBJECT Summary of this function goes here
%   Detailed explanation goes here
% posX, posY == lewy gorny rog gameField
% dopisac odswiezanie obrazka
gameFieldCopy = gameFieldInput;
objectSize = size(object);
disp(objectSize);
gameFieldCopy(posY:posY+(objectSize(1)-1), posX:posX+(objectSize(2)-1), :) = object(:,:,:);
gameFieldOutput = gameFieldCopy;

end

