%% 读入图像和预处理
p1=imread('problem1.bmp');
p1=bitcmp(p1);
r=sum(p1,2);
r1=find(r,1);
r2=find(r((r1+1):length(r))==0,1)+r1-1;
r3=find(r((r2+1):length(r)),1)+r2;
r4=find(r((r3+1):length(r))==0,1)+r3-1;%定位行
% rn=find(r);
% drn=diff(rn);
% r1=rn(1);
% re=find(drn>1);
% r2=rn(re);
% r3=rn(re+1);
% r4=rn(length(rn));
%% 提取数字准备
coln=sum(p1(r1:r2,:));
ca=zeros(1,11);%开始
cb=zeros(1,11);%结尾
for i=2:11
    ca(i)=find(coln((cb(i-1)+1):length(coln)),1)+cb(i-1);
    cb(i)=find(coln((ca(i)+1):length(coln))==0,1)+ca(i)-1;
end
% colnn=find(coln);
% dcolnn=diff(colnn);
% dc=find(dcolnn>1);
% ca(1)=colnn(1);
% for i=1:9
%     cb(i)=colnn(dc(i));
%     ca(i+1)=colnn(dc(i)+1);
% end
% cb(10)=colnn(length(colnn));
n=cell(1,10);
for i=1:10
    n{i}=p1(r1:r2,ca(i+1):cb(i+1));
end
%% 提取字母准备
cola=sum(p1(r3:r4,:));
ca=zeros(1,26);%开始
cb=zeros(1,27);%结尾
for i=2:27
    ca(i)=find(cola((cb(i-1)+1):length(cola)),1)+cb(i-1);
    cb(i)=find(cola((ca(i)+1):length(cola))==0,1)+ca(i)-1;
end
% colan=find(cola);
% dcolan=diff(colan);
% dca=find(dcolan>1);
% ca(1)=colan(1);
% for i=1:25
%     cb(i)=colan(dca(i));
%     ca(i+1)=colan(dca(i)+1);
% end
% cb(26)=colan(length(colan));
a=cell(1,26);
for i=1:26
    a{i}=p1(r3:r4,ca(i+1):cb(i+1));
end
%% 提取和合成水印
num='150210116';
name='liuchenglin';
out2=[];
out1=[];
for i=1:length(num)
    out1=[out1,n{num(i)-'0'+1}];
end
out1=bitcmp(out1);
for i=1:length(name)
    out2=[out2,a{name(i)-'a'+1}];
end
out2=bitcmp(out2);
[FN,PN]=uigetfile({'*.*'},'请选择要添加水印的图像文件');
 if FN~=0
     f=imread([PN,FN]);
%      imshow(f);
%      title('请选取要加水印的左上角')
%      [x,y]=ginput(1);
     x=1;y=1;
     p2=ones(size(f))*255;
     p2=im2uint8(p2);
     b=size(out1);
     c=size(out2);
     p2(y:(y+b(1)-1),x:(x+b(2)-1),:)=cat(3,out1,out1,out1);
     p2((y+b(1)+1):(y+b(1)+c(1)),(x+1):(x+c(2)),:)=cat(3,out2,out2,out2);
     p1=bitand(f,p2);
     imshow(p1);
%      [FN1,PN1]=uiputfile('C:/','请选择要保存的位置');
%       if FN1~=0
%          imwrite(p1,[PN1,FN1])
%       end
 end



    



