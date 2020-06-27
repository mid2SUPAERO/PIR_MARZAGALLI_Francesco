- Dynamic: files for gust analysis
- Guess Output: files which come from GUESS module for structural sizing
- Hinge configurations: input files with diferent hinge position or rotational stiffness
- Trim: files for trim analysis

The input files for the analysis are always named in the following way: "name of the AC configuration" + "input3Trim.dat" or "name of the AC configuration" + "inputGust.dat".

The "name of the AC configuration" is made up of the following parts:
- A321
- % of the wingspan where the hinge is placed (e.g. _75)
- 00H, which means that the hinge is not inclined
- a number from 0 to 3 to indicate the increasing rotational stiffness

The script A321_H_runTrim and A321_H_runGust allows to run the analysis for one single AC configuration, for the multiple case go to Comparison folder
