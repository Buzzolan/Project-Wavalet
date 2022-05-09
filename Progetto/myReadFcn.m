%% custom read function to be used for the labels fileDatastore 
%to ensure the read(fileDatastore) returns 1 label at a time
function [data,userdata,done] = myReadFcn(filename,userdata)
% If variable list is empty, 
% create list of variables from the file
if isempty(userdata) 
    labels = load(filename);
    userdata = labels.labels;
end
% Load a variable from the list of variables
data = userdata(1);
% Remove the newly-read variable from the list
userdata(1) = []; 
% Move on to the next file if this file is done reading.
done = isempty(userdata); 
end