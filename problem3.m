m=imread('problem3.png');
m=medfilt2(m,[5 5]);
imshow(m)
[c,r]=imfindcircles(m,[15,20],'Sensitivity',0.95);
cx=c(:,1);
cy=c(:,2);
R=ceil(mean(r));
viscircles(c,r);
n=false(size(m));
[x, y] = meshgrid(1:size(m,2),1:size(m,1));
for i=1:length(r)
    n(((x-cx(i)).^2+(y-cy(i)).^2)<=R^2)=true;
end
figure
imshow(n)
%% 定位行
row=sum(n,2);
rs=zeros(1,3);
re=zeros(1,3);
for i=1:3
    if i==1
        rs(i)=find(row(1:length(row)),1);
    else
    rs(i)=find(row((re(i-1)+1):length(row)),1)+re(i-1);
    end
    re(i)=find(row((rs(i)+1):length(row))==0,1)+rs(i)-1;
end
yp=round((rs+re)/2);
%% 定位列
col=sum(n,1);
for i=1:18
    if i==1
        cs(i)=find(col(1:length(col)),1);
    else
        if length(find(col((ce(i-1)+1):length(col)),1))==0
            break
        end
    cs(i)=find(col((ce(i-1)+1):length(col)),1)+ce(i-1);
    end
    ce(i)=find(col((cs(i)+1):length(col))==0,1)+cs(i)-1;
end
xp=round((cs+ce)/2);
[z,index]=max(diff(xp));
%% 判定输出
out=[];
for i=1:length(xp)
    for j=1:length(yp)
        if n(yp(j),xp(i))==1
            out=[out,'1'];
        else
            out=[out,'0'];
        end
    end
end
out=[out(1:(3*index)),'000',out((3*index+1):end)];
out=reshape(out,3,18)





    




