#!/bin/sh

nohup sh -c '
echo "HOST = $(hostname)"
echo "START = $(date)"
echo "PWD = $(pwd)"
echo "COMMAND = ./makeCards.sh SSWW 1001 M0 1200"

./makeCards.sh SSWW 1001 M0 1200

status=$?
echo "EXIT_STATUS = $status"
echo "END = $(date)"
exit $status
' > logs/1200/fit_sswwAnalysis1001_M0.log 2>&1 &

printf "M0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M0 1200 > logs/1200/fit_sswwAnalysis1001_M0_linear.log 2>&1 &
printf "M0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M1 1200 > logs/1200/fit_sswwAnalysis1001_M1.log 2>&1 &
printf "M1 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M1 1200 > logs/1200/fit_sswwAnalysis1001_M1_linear.log 2>&1 &
printf "M1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M7 1200 > logs/1200/fit_sswwAnalysis1001_M7.log 2>&1 &
printf "M7 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M7 1200 > logs/1200/fit_sswwAnalysis1001_M7_linear.log 2>&1 &
printf "M7 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 S0 1200 > logs/1200/fit_sswwAnalysis1001_S0.log 2>&1 &
printf "S0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 S0 1200 > logs/1200/fit_sswwAnalysis1001_S0_linear.log 2>&1 &
printf "S0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T0 1200 > logs/1200/fit_sswwAnalysis1001_T0.log 2>&1 &
printf "T0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T0 1200 > logs/1200/fit_sswwAnalysis1001_T0_linear.log 2>&1 &
printf "T0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T1 1200 > logs/1200/fit_sswwAnalysis1001_T1.log 2>&1 &
printf "T1 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T1 1200 > logs/1200/fit_sswwAnalysis1001_T1_linear.log 2>&1 &
printf "T1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T2 1200 > logs/1200/fit_sswwAnalysis1001_T2.log 2>&1 &
printf "T2 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T2 1200 > logs/1200/fit_sswwAnalysis1001_T2_linear.log 2>&1 &
printf "T2 linear Done \n ";


nohup ./makeCards.sh SSWW 1001 M0 1500 > logs/1500/fit_sswwAnalysis1001_M0.log 2>&1 &
printf "M0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M0 1500 > logs/1500/fit_sswwAnalysis1001_M0_linear.log 2>&1 &
printf "M0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M1 1500 > logs/1500/fit_sswwAnalysis1001_M1.log 2>&1 &
printf "M1 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M1 1500 > logs/1500/fit_sswwAnalysis1001_M1_linear.log 2>&1 &
printf "M1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M7 1500 > logs/1500/fit_sswwAnalysis1001_M7.log 2>&1 &
printf "M7 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M7 1500 > logs/1500/fit_sswwAnalysis1001_M7_linear.log 2>&1 &
printf "M7 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 S0 1500 > logs/1500/fit_sswwAnalysis1001_S0.log 2>&1 &
printf "S0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 S0 1500 > logs/1500/fit_sswwAnalysis1001_S0_linear.log 2>&1 &
printf "S0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T0 1500 > logs/1500/fit_sswwAnalysis1001_T0.log 2>&1 &
printf "T0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T0 1500 > logs/1500/fit_sswwAnalysis1001_T0_linear.log 2>&1 &
printf "T0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T1 1500 > logs/1500/fit_sswwAnalysis1001_T1.log 2>&1 &
printf "T1 Done \n "; 
nohup ./makeCardslinear.sh SSWW 1001 T1 1500 > logs/1500/fit_sswwAnalysis1001_T1_linear.log 2>&1 &
printf "T1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T2 1500 > logs/1500/fit_sswwAnalysis1001_T2.log 2>&1 &
printf "T2 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T2 1500 > logs/1500/fit_sswwAnalysis1001_T2_linear.log 2>&1 &
printf "T2 linear Done \n ";


nohup ./makeCards.sh SSWW 1001 M0 2000 > logs/2000/fit_sswwAnalysis1001_M0.log 2>&1 &
printf "M0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M0 2000 > logs/2000/fit_sswwAnalysis1001_M0_linear.log 2>&1 &
printf "M0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M1 2000 > logs/2000/fit_sswwAnalysis1001_M1.log 2>&1 &
printf "M1 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M1 2000 > logs/2000/fit_sswwAnalysis1001_M1_linear.log 2>&1 &
printf "M1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 M7 2000 > logs/2000/fit_sswwAnalysis1001_M7.log 2>&1 &
printf "M7 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 M7 2000 > logs/2000/fit_sswwAnalysis1001_M7_linear.log 2>&1 &
printf "M7 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 S0 2000 > logs/2000/fit_sswwAnalysis1001_S0.log 2>&1 &
printf "S0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 S0 2000 > logs/2000/fit_sswwAnalysis1001_S0_linear.log 2>&1 &
printf "S0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T0 2000 > logs/2000/fit_sswwAnalysis1001_T0.log 2>&1 &
printf "T0 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T0 2000 > logs/2000/fit_sswwAnalysis1001_T0_linear.log 2>&1 &
printf "T0 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T1 2000 > logs/2000/fit_sswwAnalysis1001_T1.log 2>&1 &
printf "T1 Done \n "; 
nohup ./makeCardslinear.sh SSWW 1001 T1 2000 > logs/2000/fit_sswwAnalysis1001_T1_linear.log 2>&1 &
printf "T1 linear Done \n ";
nohup ./makeCards.sh SSWW 1001 T2 2000 > logs/2000/fit_sswwAnalysis1001_T2.log 2>&1 &
printf "T2 Done \n ";
nohup ./makeCardslinear.sh SSWW 1001 T2 2000 > logs/2000/fit_sswwAnalysis1001_T2_linear.log 2>&1 &
printf "T2 linear Done \n ";
