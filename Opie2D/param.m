clc
clear
k=0;
while k~=9,
	clc
	clear
	fprintf('Which would you like to find?\n');
	fprintf('\tBlur is a movement of more than one pixel width during the shutter period.\n');
	fprintf('\tAnalysis is assumed to be Last Point Prediction (LPP).');
	fprintf('\n\nBlur Avoidance\n');
	fprintf('\t1) Maximum speed to avoid blur\n');
	fprintf('\t2) Shutter speed to avoid blur\n');
	fprintf('\t3) Resolution to avoid blur\n');
	fprintf('\nTesting Considerations\n');
	fprintf('\t4) Memory required to run a test\n');
	fprintf('\t5) Length of test\n');
	fprintf('\nLPP Considerations\n');
	fprintf('\t6) Frame rate to comply with LPP\n');
	fprintf('\t7) Velocity to stay in search area\n');
	fprintf('\t8) Distance between the points\n');
	fprintf('\n\t9) Exit\n');
	k=input('? ');
	if k==1
		dummy1=input('What is the shutter speed? (1/s) ');
		dummy2=input('What is the resolution? (pix/distance) ');
		speed = dummy1/dummy2;
		fprintf('\nThe maximum speed which can be measured with out blurring is %5f (distance/s).',speed);
	elseif k==2
		dummy1=input('What is the maximum speed?  (distance/sec) ');
		dummy2=input('What is the resolution? (pix/distance) ');
		shutter=dummy1*dummy2;
		fprintf('\nThe shutter speed should be greater than %5f (1/s) to avoid blur.',shutter);
	elseif k==3
		dummy1=input('What is the maximum speed?  (distance/sec) ');
		dummy2=input('What is the shutter speed? (1/s) ');
		resolution=dummy2/dummy1;
		fprintf('\nThe maximum resolution to avoid blur is %5f (pixels/distance).',resolution);	
	elseif k==4
		dummy1=input('How many frames per second are you taking? (fps) ');
		dummy2=input('How long is the test? (s) ');
		dummy3=input('Is each frame standard size (768 x 484)? (y/n) ','s');
		if dummy3=='n'
			dummy5=input('What is the width of each frame? (pixels) ');
			dummy6=input('What is the height of each frame? (pixels) ');
			dummy4=dummy5*dummy6/10^6;
			memory=dummy4*dummy1*dummy2;
		else
			memory=.365*dummy1*dummy2;
			end
		frames=dummy1*dummy2;
		fprintf('\nThere will be %.0f frames and require %5.2f Mb.',frames,memory);
	elseif k==5
		dummy1=input('How much memory do you want to use? (Mb) ');
		dummy2=input('What is the frame rate? (fps) ');
		dummy3=input('Is each frame standard size (768 x 484)? (y/n) ','s');
		if dummy3=='n'
			dummy5=input('What is the width of each frame? (pixels) ');
			dummy6=input('What is the height of each frame? (pixels) ');
			dummy4=dummy5*dummy6/10^6;
			test_time=dummy1/(dummy4*dummy2);
		else
			test_time=dummy1/(.365*dummy2);
			end
		fprintf('\nThe test can last up to %4f seconds',test_time);
	elseif k==6
		dummy1=input('How far apart are the two markers? (distance) ');
		dummy2=input('What is the maximum velocity of a marker? (distance/s) ');
		dummy3=input('Search area scaling factor? (higher=smaller area, must be >=2, standard=2) ');
		frame_rate=dummy2*dummy3/dummy1;
		fprintf('\nThe frame rate should be atleast %.2f frames per second.',frame_rate);
	elseif k==7
		dummy1=input('How far apart are the two markers? (distance) ');
		dummy2=input('What is the frame rate? (frames/s) ');
		dummy3=input('Search area scaling factor? (higher=smaller area, must be >=2, standard=2) ');
		speed=dummy1*dummy2/dummy3;
		fprintf('\nThe velocity can be no larger than %5f (distance/sec).',speed);
	elseif k==8
		dummy1=input('What is the frame rate? (frames/s) ');
		dummy2=input('What is the maximum velocity of a marker? (distance/s) ');
		dummy3=input('Search area scaling factor? (higher=smaller area, must be >=2, standard=2) ');
		distance=dummy2*dummy3/dummy1;
		fprintf('\nThe distance between the points should be atleast %5f (distance).',distance);
		end
	if k~=9
		fprintf('\n\nPress enter when ready. ');
		pause;
		end
	end