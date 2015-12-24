%% General reset
close all
clear all
clc

%% Choose DataBase
fpic_name = fopen('../pic_name.txt', 'r');
pic_name = fgetl(fpic_name);

num = 0;
%%database = ['TestDB',int2str(num),'.mode0'];
database = 'TestDB389.mode0';

while ischar(pic_name)
    if num < 38900
        num = num + 1;
        pic_name = fgetl(fpic_name);
        continue;
    end
    imageID = ['../new_picture/',pic_name]
    I=imread(imageID);
    if size(I,3)>1
        I=rgb2gray(I);
    end
    I=uint8(I);

    %% Settings
    Mode = 0; % use always Mode=0 for DB
    %% Run CDVS_EXTRACT
    D = cdvs_extract(I,Mode);

    %% Run CDVS_ADDDESCRIPTOR
    try
        cdvs_addDescriptor(D,imageID,database,pwd);
    catch
        num = num - 1;
    end
    num = num + 1;
    if mod(num,100) == 0
        database = ['TestDB',int2str(num/100),'.mode0']
        %%break
    end
    pic_name = fgetl(fpic_name);
end
fclose(fpic_name);






















































