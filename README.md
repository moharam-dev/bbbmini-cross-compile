# bbbmini-cross-compile

A docker image to build cross compiled version of Copter BBBMini in simple steps:

1) docker build -t bbbmini:latest .
2) mkdir bbbmini-bin
2) docker run -it -v  ${PWD}/bbbmini-bin:/output bbbmini:latest

That's it :)
