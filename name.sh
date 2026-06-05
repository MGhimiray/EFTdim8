#!/bin/bash
set -euo pipefail

DIR="/eos/user/m/mghimira/Combine/CMSSW_14_1_4/src/HiggsAnalysis/AnalyticAnomalousCoupling/SMP-25-013/inputs/1200/"

OLD="/mnt/home/mghimiray/VBSStudies/Outputs_EFT/OriginalTT/1001/1200/datacards/"
NEW="/eos/user/m/mghimira/Combine/CMSSW_14_1_4/src/HiggsAnalysis/AnalyticAnomalousCoupling/SMP-25-013/inputs/1200/"

for file in "$DIR"/*.txt; do
    if grep -qF "$OLD" "$file"; then
        cp -p "$file" "${file}.bak"
        sed -i "s|$OLD|$NEW|g" "$file"
        echo "Updated: $file"
    fi
done

rm inputs/1200/datacard*.bak
echo "Done."