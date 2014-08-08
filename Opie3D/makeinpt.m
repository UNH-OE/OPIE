function makeinpt(input_file)
%makeinpt(input_file)
%


dummy1==0;
while dummy1==0,
	input_file=input('What is the input file name ([Enter] for new file)? ','s');

	if isempty(input_file)==1;
		input_file=input('Please enter the path and file name for the new input_file. ','s');
		while chekfile(input_file)~=1
			fprintf('The file %s already exists.\n',input_file);
			input_file=input('Please enter the path and file name for the new input_file. ','s');
			end
		makeinpt(input_file);			%Runs through all the questions and returns the needed outputs
		dummy1==1;
	
	if chekfile(input_file)==1;
		load input_file;
		dummy1==1;
	else
		dummy1==0;
		end
	end