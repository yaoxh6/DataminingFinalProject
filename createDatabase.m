function database = createDatabase(att_faces)
database = [];
for i = 1 : 40
    for j=1:7
        inputPicPath=strcat(att_faces,'\s',int2str(i),'\',int2str(j),'.pgm');
        inputPic=imread(inputPicPath);
        columnPic=double(reshape(inputPic,size(inputPic,1)*size(inputPic,2),1));
        database=cat(2,database,columnPic);
    end
end
