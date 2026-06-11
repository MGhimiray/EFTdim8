#!/bin/bash
set -euo pipefail

if [ "${1:-}" = "-1" ]; then
  rm -f combine_logger.out log_* impacts* fitDiagnostic* higgsCombine* *text workspace* robustHesserobustHesse_* multidimfitrobustHesse_* 1
  exit
fi

if [ "${1:-}" = "SSWW" ]; then

  SSWWANA="sswwAnalysis"$2
  operator=$3
  cutoff=$4
  min=$5
  max=$6
  whichfit=$7

#  mkdir -p "fits/${cutoff}" "workspace/${cutoff}" "plots/${cutoff}"

  combined_card="inputs/${cutoff}/datacard_${SSWWANA}_${operator}_2027.text"

  combineCards.py -S \
    inputs/${cutoff}/datacard_${SSWWANA}_${operator}_202??_bin?.txt \
    > "${combined_card}"

  printf "Combine cards Done\n"

  # Remove selected background normalization rateParams
  sed -i.bak -E '
  /^CMS_ssww_ewkwznorm[[:space:]]+rateParam[[:space:]]+ch(1|2|3|4|5|6|7|8|9|10|11|12)[[:space:]]+EWKWZ[[:space:]]+1[[:space:]]+\[0\.1,4\.9\][[:space:]]*$/d
  /^CMS_ssww_wznorm[[:space:]]+rateParam[[:space:]]+ch(1|2|3|4|5|6|7|8|9|10|11|12)[[:space:]]+WZ[[:space:]]+1[[:space:]]+\[0\.1,4\.9\][[:space:]]*$/d
  /^CMS_ssww_tvxnorm[[:space:]]+rateParam[[:space:]]+ch(1|2|3|4|5|6|7|8)[[:space:]]+TVX[[:space:]]+1[[:space:]]+\[0\.1,4\.9\][[:space:]]*$/d
  /^CMS_ssww_nonpromptnorm[[:space:]]+rateParam[[:space:]]+ch(1|2|3|4|5|6|7|8|9|10|11|12)[[:space:]]+NonPrompt[[:space:]]+1[[:space:]]+\[0\.1,4\.9\][[:space:]]*$/d
  ' "$combined_card"
  printf "Removed selected ssWW rateParam lines from %s\n" "${combined_card}"

  # Linear EFT workspace
  text2workspace.py \
    "${combined_card}" \
    -P HiggsAnalysis.AnalyticAnomalousCoupling.AnomalousCouplingLinearEFTNegative:analiticAnomalousCouplingLinearEFTNegative \
    -o "workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root" \
    --X-allow-no-signal \
    --PO eftOperators=c${operator} \
    --PO reuseCompleteDatacards

  printf "Workspace Done\n"

if [ "$whichfit" = "1" ]; then
  # Expected scan
  combine -M MultiDimFit "workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root" \
    --algo=grid \
    --points 2000 \
    -m 125 \
    -t -1 \
    --redefineSignalPOIs k_c${operator} \
    --freezeParameters r \
    --setParameters r=1\
    --setParameterRanges k_c${operator}=-${min},${max} \
    -n _Expected_${operator}${cutoff}linear \
    --verbose 2

  mv "higgsCombine_Expected_${operator}${cutoff}linear.MultiDimFit.mH125.root" "fits/${cutoff}/"

  printf "Expected Fit Done\n"

  # Observed scan
  combine -M MultiDimFit "workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root" \
    --algo=grid \
    --points 2000 \
    -m 125 \
    --redefineSignalPOIs k_c${operator} \
    --freezeParameters r \
    --setParameters r=1\
    --setParameterRanges k_c${operator}=-${min},${max} \
    -n _Observed_${operator}${cutoff}linear \
    --verbose 2

  mv "higgsCombine_Observed_${operator}${cutoff}linear.MultiDimFit.mH125.root" "fits/${cutoff}/"

  printf "Observed Fit Done\n"

  # Plot scan
  python3 "$CMSSW_BASE/src/HiggsAnalysis/AnalyticAnomalousCoupling/scripts/mkEFTScan.py" \
    "fits/${cutoff}/higgsCombine_Expected_${operator}${cutoff}linear.MultiDimFit.mH125.root" \
    -p k_c${operator} \
    -maxNLL 35 \
    -xmin -${min} \
    -xmax ${max} \
    -ml Expected \
    -others "fits/${cutoff}/higgsCombine_Observed_${operator}${cutoff}linear.MultiDimFit.mH125.root:2:1:Observed" \
    -cms -preliminary \
    -lumi "280" \
    -xlabel "f_{${operator}}" \
    -o "plots/${cutoff}/scan_${operator}${cutoff}linear"

  printf "Scan Plot Done\n"

elif [ "$whichfit" = "2" ]; then
  # Fit diagnostics for post-fit yields
  PARAM="--redefineSignalPOIs k_c${operator} \
         --freezeParameters r \
         --setParameters r=1 \
         --setParameterRanges k_c${operator}=-${min},${max}"

  combine -M FitDiagnostics \
    "workspace/${cutoff}/workspace_${SSWWANA}_${operator}linear_2027.root" \
    -m 125 \
    -n _${operator}${cutoff}linear \
    --saveShapes \
    --saveWithUncertainties \
    --saveNormalizations \
    --saveOverallShapes \
    --keepFailures \
    --ignoreCovWarning \
    --robustFit 1 \
    --X-rtd FITTER_DYN_STEP \
    ${PARAM}

  mv "higgsCombine_${operator}${cutoff}linear.FitDiagnostics.mH125.root" "fits/${cutoff}/"
  rm -f "higgsCombine_${operator}${cutoff}linear.MultiDimFit.mH125.root"
  printf "Fit Diagnostics Done\n"
  
else
  printf "No fit found: whichfit = %s\n" "$whichfit"
fi

fi
