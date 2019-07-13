function [meanFace, reduceMeanFaces,eigenFace] = createEigenFace(dataBase,k)
    meanFace=mean(dataBase,2);
    dataBaseNum=size(dataBase,2);
    reduceMeanFaces = zeros(size(dataBase,1),dataBaseNum);
    for i=1:dataBaseNum
        reduceMeanFaces(:,i)=double(dataBase(:,i)-meanFace);
    end
    Cov=reduceMeanFaces*reduceMeanFaces'; 
    [V, ~] = eig(Cov); 
    eigenFaceTemp=fliplr(V);
    eigenFace=zeros(size(dataBase,1),k);
    for i=1:k
        eigenFace(:,i)=eigenFaceTemp(:,i);
    end
end
