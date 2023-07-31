function [Aout,Iout] = shiftPeak(Ain,Iin)

[~,Indx] = min(Ain(:,end));
Aout = circshift(Ain,-Indx,1);
Iout = circshift(Iin,-Indx,1);

end