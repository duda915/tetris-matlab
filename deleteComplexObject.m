function gameFieldOutput = deleteComplexObject( gameFieldInput, object, positionsArray )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
gameFieldCopy = gameFieldInput;
posSize = size(positionsArray);
for i = 1:posSize(1)
    gameFieldCopy = deleteObject(gameFieldCopy, object, positionsArray(i,1), positionsArray(i,2));
end
gameFieldOutput = gameFieldCopy;
    
end

