function [arr,arrNaN,arrAng]= DataAnalysis(name)

    % this function is used to extract the bagfile of scans generated from
    % turtlebot. This function transfer the original text file to cell
    % arrays containing one scan in one cell. Another two cell arrays have
    % been created. The numArrayNaN contains points where NaN exists.

    fh = fopen(name);
    line = fgetl(fh);
    arr = {};
    arrNaN = {};
    arrAng = {};
    angle = linspace(-37,37,640);
    while (ischar(line))
        if(line(1) ~= '-')
            numArray = str2num(line);
            numArray = numArray(end:-1:1);
            numArrayAng = numArray.*cosd(angle);
            numArrayNaN = isnan(numArray)*2;
            arr = [arr,numArray];
            arrNaN = [arrNaN,numArrayNaN];
            arrAng = [arrAng,numArrayAng];
        end
        line = fgetl(fh);
    end
end

