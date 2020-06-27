- __Dynamic__: files for gust analysis
- __Guess Output__: files which come from GUESS module for structural sizing
- __Hinge configurations__: input files with diferent hinge position or rotational stiffness
- __Trim__: files for trim analysis

The input files for the analysis are always named in the following way: "name of the AC configuration" + "input3Trim.dat" or "name of the AC configuration" + "inputGust.dat".

The "name of the AC configuration" is made up of the following parts:
- A321
- % of the wingspan where the hinge is placed (e.g. _75)
- 00H, which means that the hinge is not inclined
- a number from 0 to 3 to indicate the increasing rotational stiffness

The script _A321_H_runTrim.m_ and _A321_H_runGust.m_ allows to run the analysis for one single AC configuration, for the multiple case go to __Comparison__ folder
