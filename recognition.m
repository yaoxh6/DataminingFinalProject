function outputNum = recognition(inputPicPath, meanFace, reduceMeanFace, eigenFace)
    dataBaseProjectedPic =eigenFace'*reduceMeanFace;
    dataBaseNum=size(reduceMeanFace,2);
    inputPic = imread(inputPicPath);
    inputColumnPic=reshape(inputPic,size(inputPic,1)*size(inputPic,2),1);
    inputReduceMeanPic = double(inputColumnPic)-meanFace;
    inputProjectedPic = (eigenFace'*inputReduceMeanPic);
    compareResult = zeros(1,dataBaseNum);
    for i = 1 : dataBaseNum
        temp = ( norm( inputProjectedPic - dataBaseProjectedPic(:,i) ) )^2;
        compareResult(1,i) = temp;
    end
    [~ , index] = min(compareResult);
    outputNum = index;
end