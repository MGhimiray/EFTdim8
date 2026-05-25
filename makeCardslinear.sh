#!/bin/sh

if [ $1 = "-1" ]; then
  rm -f combine_logger.out log_* impacts* fitDiagnostic* higgsCombine* *text workspace* robustHesserobustHesse_* multidimfitrobustHesse_* 1;
  exit;
fi


if [ $1 = "SSWW" ]; then

SSWWANA="sswwAnalysis"$2
operator=$3
cutoff=$4

LOG="logs/${cutoff}/fit_${SSWWANA}_${operator}.log"
exec > >(tee -a "$LOG") 2>&1

combineCards.py -S \
inputs/${cutoff}/datacard_${SSWWANA}_${operator}_202??_bin?.txt \
> inputs/${cutoff}/datacard_${SSWWANA}_${operator}_2027.text

printf "Combine cards Done \n ";

# Normal EFT model
text2workspace.py      \
        inputs/${cutoff}/datacard_${SSWWANA}_${operator}_2027.text   \
        -P HiggsAnalysis.AnalyticAnomalousCoupling.AnomalousCouplingLinearEFTNegative:analiticAnomalousCouplingLinearEFTNegative  \  -o  workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root    --X-allow-no-signal  \
      --PO eftOperators=c${operator}  \
      --PO reuseCompleteDatacards

printf "Workspace Done \n ";

combine -M MultiDimFit workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root  --algo=grid --points 2000  -m 125   -t -1     \
    --redefineSignalPOIs k_c${operator} \
    --freezeParameters r  \
    --setParameters r=1    --setParameterRanges k_c${operator}=-15,15    \
     -n _Expected_${operator}linear \
    --verbose -1
mv higgsCombine_Expected_${operator}linear.MultiDimFit.mH125.root fits/
printf " Expected Fit Done \n ";

combine -M MultiDimFit workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root  --algo=grid --points 2000  -m 125      \
    --redefineSignalPOIs k_c${operator} \
    --freezeParameters r  \
    --setParameters r=1    --setParameterRanges k_c${operator}=-15,15    \
     -n _Observed_${operator}linear \
    --verbose -1
mv higgsCombine_Observed_${operator}linear.MultiDimFit.mH125.root fits/
printf " Observed Fit Done \n ";

#root -l -q higgsCombine_Expected_${operator}.MultiDimFit.mH125.root  higgsCombine_Observed_${operator}.MultiDimFit.mH125.root   ../test/draw.cxx\(\"k_${operator}\"\) 

python3 $CMSSW_BASE/src/HiggsAnalysis/AnalyticAnomalousCoupling/scripts/mkEFTScan.py \
  fits/${cutoff}/higgsCombine_Expected_${operator}linear.MultiDimFit.mH125.root \
  -p k_c${operator} \
  -maxNLL 9 \
  -ml Expected \
  -others fits/${cutoff}/higgsCombine_Observed_${operator}linear.MultiDimFit.mH125.root:2:1:Observed \
  -cms -preliminary \
  -lumi "107" \
  -xlabel "f_{${operator}}" \
  -o plots/${cutoff}/scan_${operator}linear

fi