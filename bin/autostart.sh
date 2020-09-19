#!/bin/bash
synclient TapAndDragGesture=0 
synclient MaxTapTime=0 
syndaemon -d -t -k
synclient AreaLeftEdge=400 AreaRightEdge=2500 AreaTopEdge=200
lxterminal -e vim . -c term

