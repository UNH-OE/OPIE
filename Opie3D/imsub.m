pth='c:\video\';
fname='test01';
for k=1:10,
	file=[pth,fname,'_',int2str(k),'.bmp'];
	fprintf('\nFrame %.0f\t%s\n',k,file);
	[A,map]=bmpread(file);
	if k~=1,
		C=A-B;
		imshow(C,map);
		drawnow;
		end
	B=A;
	end
