
function [m,sdv] = mipregionstats(gimg,bimg,nClass)
for i=1:nClass
    H = gimg(bimg == i);
    if ~isempty(H)
        m(i)   = mean(H);
        sdv(i) = std(H);
    else
        m(i)   = 0;
        sdv(i) = 0;
    end
end