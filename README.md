# bbbmini-cross-compile

A docker image to build cross compiled version of Copter BBBMini in simple steps:

1) docker build -t bbbmini:latest .
2) mkdir bbbmini-bin
3) docker run -it -v  ${PWD}/bbbmini-bin:/output bbbmini:latest

Once done you will have all the bbbmini arducopter and hardware checking examples in the folder you just created (i.e. bbbmini-bin). Then you can easily upload those files to BB using scp command like:

scp -r . debian@beaglebone:/home/debian/

Where beaglebone is the ip address of your debian BBBMini (more about this here : https://github.com/mirkix/BBBMINI/blob/master/doc/software/software.md )  

That's it :)
