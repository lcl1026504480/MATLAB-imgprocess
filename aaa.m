
%% ��ֵ����ʴ
% clear
% p6=imread('s1-06.png');
% p6=imadjust(p6, [0 1], [0 1], 2);
% p6=rgb2gray(p6);
% % p6=spfilt(p6,'amean',11,11);
% subplot(121),imshow(p6);
% subplot(122),imhist(p6)
% t1=im2bw(p6,100/255);
% t2=im2bw(p6,180/255);
% t=imsubtract(t1,t2);
% figure
% subplot(121),imshow(t),title('��ֵ�����')
% roi=bwconncomp(t,8);
% pro=regionprops(roi,'basic');
% for i =1:roi.NumObjects
%     if pro(i).Area<1800
%         t(roi.PixelIdxList{i})=0;
%     end
% end
% imshow(t)
% se1=strel('square',9);
% e=imerode(t,se1);
% subplot(122),imshow(e),title('��ʴ���')
%% ��Ŀ2
% p=cell(1,4);
% tr=cell(1,4);
% result=cell(1,4);
% for i=1:length(p)
%     p{i}=imread(['s2-',num2str(i),'.png']);
%     result{i}=p{i};
%     figure
%     subplot(221),imshow(p{i}),title(['s2-',num2str(i),'.png'])
%     p{i}=rgb2gray(p{i});
%     t=graythresh(p{i});
%     tr{i}=im2bw(p{i},t);
%     subplot(222),imshow(tr{i}),title('��ֵ��')
%     tr{i}=~tr{i};
%     roi=bwconncomp(tr{i},8);
%     pro=regionprops(roi,'basic');
%     for j =1:roi.NumObjects
%         if pro(j).Area<=400
%             tr{i}(roi.PixelIdxList{j})=0;
%         end
%     end
%     subplot(223),imshow(tr{i}),title('���ϸ�����')
%     [B,L] = bwboundaries(tr{i},'noholes');
%     subplot(224),imshow(result{i}),title('�����')
%     hold on
%     for k = 1:length(B)
%     boundary = B{k};
%     plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
%     end
% end
%% ��Ŀ4
clear
n=4
    figure
    p=imread(['s4-',num2str(n),'.png']);
    subplot(221),imshow(p),title(['s4-',num2str(n),'.png'])
    p1=rgb2gray(p);
    p1=spfilt(p1,'amean',5,5);%��ֵ�˲�
    h=fspecial('sobel');%sobel����
    p1=imfilter(p1,h,'symmetric');%�߽���չ����Ϊ����Գ�
    subplot(222),imhist(p1),title('sobel�˲����ֱ��ͼ')
    p1=im2bw(p1,40/255);%30/255��Ϊ��ֵ
    subplot(223),imshow(p1),title('��ֵ��')
    figure
    imshow(p1),title('s4-4.png��ֵ��')
%     roi=bwconncomp(p1,8);%������������ʶ��Ŀ��
%     pro=regionprops(roi,'basic');
%     subplot(224),imshow(p),title('���')
%     for i=1:roi.NumObjects
%         hold on
%     viscircles(pro(i).Centroid,40);
%     end



    
            
        



