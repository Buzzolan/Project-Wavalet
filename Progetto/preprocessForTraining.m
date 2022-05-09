function [dataOut,info] = preprocessForTraining(data,info)
 
numRows = size(data,1);
dataOut = cell(numRows,2);
 
for idx = 1:numRows
    
    % Randomized 90 degree rotation
    imgOut = rot90(data{idx,1},randi(4)-1);
    
    % Return the label from info struct as the 
    % second column in dataOut.
    dataOut(idx,:) = {imgOut,info.Label(idx)};
    
end

end