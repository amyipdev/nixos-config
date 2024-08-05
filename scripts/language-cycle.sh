#!/usr/bin/env bash

curr_lang=$(hyprctl getoption input:kb_layout)
sample_us=$(printf "str: us\nset: true")
sample_ara=$(printf "str: ara\nset: true")
sample_es=$(printf "str: es\nset: true")
sample_gr=$(printf "str: gr\nset: true")
if [[ $curr_lang == $sample_us ]]; then
	hyprctl keyword input:kb_layout ara
	notify-send -t 2500 "Arabic mode" "The keyboard language has been changed to Arabic."
elif [[ $curr_lang == $sample_ara ]]; then
	hyprctl keyword input:kb_layout es
	notify-send -t 2500 "Spanish mode" "The keyboard language has been changed to Spanish."
elif [[ $curr_lang == $sample_es ]]; then
	hyprctl keyword input:kb_layout gr
	notify-send -t 2500 "Greek mode" "The keyboard language has been changed to Greek."
elif [[ $curr_lang == $sample_gr ]]; then
	hyprctl keyword input:kb_layout us
	notify-send -t 2500 "English mode" "The keyboard language has been changed to English."
else
	hyprctl keyword input:kb_layout us
	notify-send -t 2500 "English override" "Could not read input type, falling back to English."
fi
