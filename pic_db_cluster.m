%% General reset
close all
clear all
clc

%%load pic_dbmap;
ncluster = 0;
dbmap = containers.Map;
fdbmap = fopen('../pic_dbmap.txt','r');
db_info = fgetl(fdbmap);
while ischar(db_info)
    db_arr = strsplit(db_info);
    db_pic_name = db_arr{1};
    db_cluster = str2num(db_arr{2});
    dbmap(db_pic_name) = db_cluster;
    if ncluster < db_cluster
        ncluster = db_cluster;
    end
    db_info = fgetl(fdbmap);
end
fclose(fdbmap);

%%%
fdbmap = fopen('../pic_dbmap.txt','a');
fpic_name = fopen('../pic_name_origin.txt','r');
pic_name = fgetl(fpic_name);

while ischar(pic_name)
    if isKey(dbmap, pic_name)
        pic_name = fgetl(fpic_name);
        continue;
    end
    %%%%retrieve similar graphs
    try
        pic_path = ['../new_picture/',pic_name];
        results = retrieve_image(pic_path, 418, 40)
        %%%%label it with the highest-fScore cluster
        if isKey(dbmap,name_extract(results(1).name))
            dbmap(pic_name) = dbmap(name_extract(results(1).name));
        else
            ncluster = ncluster + 1;
            dbmap(pic_name) = ncluster;
        end
        db_info = [pic_name ' ' int2str(dbmap(pic_name))];
        fprintf(fdbmap,'%s\n',db_info);
        %%%%label all its uncolored neighbor
        top_score = results(1).fScore + results(1).gScore;
        for ri = 1 : 40
            if ~isKey(dbmap, name_extract(results(ri).name))
                if results(ri).fScore + results(ri).gScore >= 0.7 * top_score
                    dbmap(name_extract(results(ri).name)) = dbmap(pic_name);
                    db_info = [name_extract(results(ri).name) ' ' int2str(dbmap(pic_name))];
                    fprintf(fdbmap,'%s\n',db_info);
                end
            end
        end
        %%%%%%
    catch
        ncluster = ncluster + 1;
        dbmap(pic_name) = ncluster;
        db_info = [pic_name ' ' int2str(ncluster)];
        fprintf(fdbmap,'%s\n',db_info);
    end
    %%%%%%%%%
    pic_name = fgetl(fpic_name);
end

fclose(fpic_name);
fclose(fdbmap);



























































































