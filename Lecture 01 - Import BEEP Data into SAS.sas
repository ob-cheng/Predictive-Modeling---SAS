/* Reading Dataset */

*Load data;

%macro LoadFileProcHttp(FileName=/*Name of the file*/);
	*[1] Specify the location to store data in Viya;
	filename Data "&folder./&FileName.";
	*[2] Import data from URL and output to specified Viya location;

	proc http method="get" url="&url./&FileName." out=Data;
	run;

%mend LoadFileProcHttp;

*[3] Load individual data file;
%let folder=/home/4dsasdemo07/tcxxxxxxx; <- your folder property
%let url=https://raw.githubusercontent.com/adam-54/class/main/common;

*[3.1] Import CSV file;
%LoadFileProcHttp(FileName=beeps.csv); use beep_c

/* run until the above line to import the beeps dataset.  */


*Create libarary and CAS library;
cas mySession sessopts=(caslib=casuser);
libname myCas cas caslib=casuser;

data mycas.beeps/*(promote=Yes)*/;
	set beeps;
run;
