#!/bin/sh

arr=("experiment_no_shift/audio/context/*" "experiment_no_shift/audio/continuation/*" "experiment_no_shift/audio/continua/*" "experiment_negative_shift/audio/context/*" "experiment_negative_shift/audio/continuation/*" "experiment_negative_shift/audio/continua/*")

# arr=("experiment_no_shift/audio/context/*")

for d in "${arr[@]}"; do
	echo "converting audio in ${d}"

	for i in $d; do
		sox "$i" "${i%.wav}.mp3"
		echo "created ${i%.wav}.mp3"
		rm $i
	done
	# rm "${d}.wav"
	# echo "removed ${d}.wav"
done