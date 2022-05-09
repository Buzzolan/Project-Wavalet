function [dataout] = setcat_and_table_to_cell(datain)
validcats = string(0:1); % define valid labels for categorical array
datain.(1) = setcats(datain.(1),validcats);%setto l'array categorical
dataout = table2cell(datain);
end