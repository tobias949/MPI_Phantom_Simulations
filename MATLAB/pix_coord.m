function y=pix_coord(P,Startfield,Stopfield)
% Parameters: 
%     P= Phantom
%     Startfield= Startfieldproperties in a vector [x y z]
%     Startfield= Startfieldproperties in a vector [x y z]
%
% 1.
% Writes the size of the Phantom and the Fieldproperties to a *.ini file
%
% 2.
% Calculates the start- and stopcoordinates of a Phantom for the
% particle-simulation and writes them to a *.txt file

sizex=size(P,2);
sizey=size(P,1);

Spec='[System_Matrix_Settings]\r\nSlices = {%u, %u, 1}\r\nStartfield = {%e, %e, %e}\r\nStopfield = {%e, %e, %e}\r\nUse_start_stop_Voxel = TRUE\r\nStart_Voxel = {0, 0, 0}\r\nStop_Voxel = {0, 0, 0}';
fid = fopen('Z:\userdata\klemme\bin\params\SysMat_Resovist_Phantom.ini','w');
fprintf(fid,Spec,sizex,sizey,Startfield(1),Startfield(2),Startfield(3),Stopfield(1),Stopfield(2),Stopfield(3));
fclose(fid);

count=1;
C=zeros(length(P(P==0)),4);

for j=1:sizey
    for i=1:sizex
        if P(j,i)==0
            C(count,1)=i-1;
            C(count,2)=j-1;
            if i==sizex 
                C(count,3)=0;
                C(count,4)=j-1;
            else
                C(count,3)=i;
                C(count,4)=j-1;
            end
            count=count+1;
            
        end
    end
end

dlmwrite('start_stop_coord.txt',C,'newline','pc');

  