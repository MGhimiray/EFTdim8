#!/bin/bash

# ./run_makeCards.sh 1001 0000 1

variable=$1
cutoff=$2
whichfit=$3

mkdir -p logs/${cutoff}

    nohup ./makeCards.sh SSWW ${variable} M0 ${cutoff} 40 40 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M0.log 2>&1 &
    printf "M0 Done \n"
    nohup ./makeCards.sh SSWW ${variable} M1 ${cutoff} 50 50 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M1.log 2>&1 &
    printf "M1 Done \n"
    nohup ./makeCards.sh SSWW ${variable} M7 ${cutoff} 60 60 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M7.log 2>&1 &
    printf "M7 Done \n"
    nohup ./makeCards.sh SSWW ${variable} S0 ${cutoff} 80 80 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_S0.log 2>&1 &
    printf "S0 Done \n"
    nohup ./makeCards.sh SSWW ${variable} T0 ${cutoff} 10 10 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T0.log 2>&1 &
    printf "T0 Done \n"
    nohup ./makeCards.sh SSWW ${variable} T1 ${cutoff} 10 10 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T1.log 2>&1 &
    printf "T1 Done \n"
    nohup ./makeCards.sh SSWW ${variable} T2 ${cutoff} 10 10 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T2.log 2>&1 &
    printf "T2 Done \n"
    

    nohup ./makeCardslinear.sh SSWW ${variable} M0 ${cutoff} 40 40 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M0_linear.log 2>&1 &
    printf "M0 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} M1 ${cutoff} 50 50 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M1_linear.log 2>&1 &
    printf "M1 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} M7 ${cutoff} 60 60 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_M7_linear.log 2>&1 &
    printf "M7 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} S0 ${cutoff} 80 80 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_S0_linear.log 2>&1 &
    printf "S0 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} T0 ${cutoff} 10 10 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T0_linear.log 2>&1 &
    printf "T0 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} T1 ${cutoff} 100 100 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T1_linear.log 2>&1 &
    printf "T1 linear Done \n"
    nohup ./makeCardslinear.sh SSWW ${variable} T2 ${cutoff} 10 10 ${whichfit} > logs/${cutoff}/fit_sswwAnalysis${variable}_T2_linear.log 2>&1 &
    printf "T2 linear Done \n"
