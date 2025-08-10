(* ::Package:: *)

ClearAll["Global`*"]
SetDirectory[NotebookDirectory[]]
(*Lusch et. al used from each of 15,000 trajectories 51 datapoints in
batches of 128.*)
(*The range of parameters are x\[Element][-3.1,3.1] and x'\[Element][-2,2]*)
NTrajectories=15000;
xBounds={-3.1,3.1};vBounds={-2,2};
tMin=0;tMax=1;NTimes=50;
timeArray=N@Subdivide[tMin,tMax,NTimes];
solution=ParametricNDSolve[
{x''[t]==-Sin[x[t]],x'[0]==v0,x[0]==x0},
x,{t,tMin,tMax},
{x0,v0}
];
trajectories=Table[
initialCondition={RandomReal[xBounds],RandomReal[vBounds]};
(Table[
(x@@initialCondition)[t],
{t,timeArray}
]/.solution),
{n,NTrajectories}
];
(*
(*Phase portrait plot:*)
ListPlot[
Table[
{trajectories[[i]][[2;;]],Differences[trajectories[[i]]]}\[Transpose],
{i,200}
],
PlotTheme->"Scientific"
]
*)


Export["pendulum-trajectories.csv",trajectories]


timeArray


trajectories//Dimensions


trajectories[[1]]
