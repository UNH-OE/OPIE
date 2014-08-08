[m,n]=size(A);
numpnt = 2;
%Shows location of point
	count=1;
	C=A;
	while count<2*numpnt,
		if exist('B')==1
			x1(count)=B(k,count);
			x1(count+1)=B(k,count+1);
		else
			x1(count)=xref(count);
			x1(count+1)=xref(count+1);
			end
		j=1;
		i=1;
		while j>=1 & j<=n,
			C(x1(count+1),j)=1;
			C(x1(count+1)+1,j)=1;
			j=j+1;
			end
		while i>=1 & i<=m,
			C(i,x1(count))=1;
			C(i,x1(count)+1)=1;
			i=i+1;
			end
		C(x1(count+1),x1(count))=256;
		count=count+2;
		end
	imshow(C,map);
	drawnow;