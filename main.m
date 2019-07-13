tic;
dataBase =createDatabase('att_faces');
k = 90;
[meanFace, reduceMeanFaces, eigenFace] = createEigenFace(dataBase,k);
correctNum = 0;
for i = 1 : 120
    folderName = ceil(i/3);
    fileName = mod(i+2,3)+8;
    inputPic = strcat('att_faces','\s',int2str(folderName),'\',int2str(fileName),'.pgm');
    outputNum = recognition(inputPic, meanFace, reduceMeanFaces, eigenFace);
    if ceil(outputNum/7) == folderName
        correctNum = correctNum + 1;
        if i == 1
            outputFolderName = ceil(outputNum/7);
            outputFileName = mod(outputNum+6,7)+1;
            outputPic = strcat('att_faces','\s',int2str(outputFolderName),'\',int2str(outputFileName),'.pgm');
            figure;
            subplot(121);
            imshow(inputPic);
            title([' ‰»ÎÕº∆¨',inputPic]);
            subplot(122);
            imshow(outputPic);
            title([' ‰≥ˆÕº∆¨',outputPic]);
        end
    else
        outputFolderName = ceil(outputNum/7);
        outputFileName = mod(outputNum+6,7)+1;
        outputPic = strcat('att_faces','\s',int2str(outputFolderName),'\',int2str(outputFileName),'.pgm');
        figure;
        subplot(121);
        imshow(inputPic);
        title([' ‰»ÎÕº∆¨',inputPic]);
        subplot(122);
        imshow(outputPic);
        title([' ‰≥ˆÕº∆¨',outputPic]);
    end
end

accuracy = correctNum/120;
fprintf('the result is %.6f\n',accuracy);
toc;