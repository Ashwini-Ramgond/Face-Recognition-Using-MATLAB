function out=load_database()
persistent loaded;
persistent image_matrix;
if(isempty(loaded))
    image_matrix=zeros(5600,400);
    for i=1:40
        cd(strcat('s',num2str(i)));
        for j=1:10
            a=imread(strcat(num2str(j),'.jpg'));
            image_matrix(:,(i-1)*10+j)=reshape(a,size(a,1)*size(a,2),1);
        end
        cd ..
    end
    image_matrix=uint8(image_matrix);
end
loaded=1;
out=image_matrix;
