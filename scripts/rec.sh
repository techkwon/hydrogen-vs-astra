#!/bin/zsh
# usage: rec.sh <task> <model> <seconds> [actions.json]  -> rec/<task>-<model>.mp4
B=./samples
T=$1; M=$2; S=$3; A=$4
F=$B/runs/$T/$M/index.html; [[ -f $F ]] || F=$B/runs/$T/$M/index.svg
O=$B/rec/tmp-$T-$M
node $B/scripts/record.mjs $F $O $S $A || exit 1
ffmpeg -y -loglevel error -f concat -safe 0 -i $O/frames.ffconcat -vf "fps=30,scale=1280:800:flags=lanczos,format=yuv420p" -c:v libx264 -crf 16 -preset medium -t $S $B/rec/$T-$M.mp4
cp $O/last.png $B/rec/$T-$M.png; cp $O/report.json $B/rec/$T-$M.json; rm -rf $O/f
ffprobe -v error -show_entries format=duration -of csv=p=0 $B/rec/$T-$M.mp4
