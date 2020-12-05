d2='diff-image';

d1='k-means-clustered-images'; %%images obtained from kmeans clustering using inbuilt library I=kmeans(k,10);
s1=dir(fullfile(d1,'*tif'));
s2=dir(fullfile(d2,'*jpg'));

for k=1:numel(s2)
	f=fullfile(d1,s1(k).name);
	f1=fullfile(d2,s2(k).name);
	I=imread(f);
	I1=imread(f1);
	kmean1(k)=mean(I(:));
	mean1(k)=mean(I1(:));
end;
smoothkmean=sgolayfilt(kmean1,5,25);
smoothmean=sgolayfilt(mean1,5,25);
for k=1:numel(s2)
	y(k)=kmean1(k);
	y1(k)=smoothkmean(k);
	y2(k)=mean1(k);
	y3(k)=smoothmean(k);
	x(k)=k;
end;

figure(1);
plot(x,y,'-k');
title('kmean');

figure(3);
plot(x,y1,'-k');
title('smooth kmean');

figure(2);
plot(x,y2,'-k');
title('mean');

figure(4);
plot(x,y3,'-k');
title('smooth mean');

figure(5)
plot(x,y1,'-k',x,y3,'-r');
title('comparision graph of smooth kmean and mean');
