#!/bin/bash

# Author: Phil Wyett (kathenas) - philip.wyett@kathenas.org
#
# Website: https://kathenas.org
#
# Wiki: https://wiki.kathenas.org
#
# Buy me a coffee: https://www.buymeacoffee.com/kathenasorg
#
# License: GPLv3 - See 'LICENSE' in root directory of git repository or
#          the license at https://www.gnu.org/licenses/gpl-3.0.en.html
#
# Copyright is asserted by the author.

# Define some colours for output text.
red_text='\033[0;31m'
yellow_text='\033[0;33m'
green_text='\033[32m'
end_colour_text='\033[0m'

# If script run with 'sh', inform to execute directly or invoke with 'bash'.
if ! [ "$BASH_VERSION" ]
then
    printf "\n%b=== WARNING ===%b\n" "${yellow_text}" "${end_colour_text}"
    printf "\nPlease do not use %bsh%b to run this script %b%s%b. Run directly \
e.g. %b./%s%b if the script is set executable or use %bbash %s%b instead \
of %bsh %s%b.\n\n" 1>&2 "${yellow_text}" "${end_colour_text}" "${yellow_text}" \
"$0" "${end_colour_text}" "${green_text}" "$0" "${end_colour_text}" \
"${green_text}" "$0" "${end_colour_text}" "${yellow_text}" "$0" \
"${end_colour_text}"
    exit 1
fi

# Check we have ffmpeg installed and available for use.
if ! [ -x "$(command -v ffmpeg)" ]
then
    printf "\n%b=== CRITICAL ===%b\n" "${red_text}" "${end_colour_text}"
    printf "\n'ffmpeg' could not be found.\n"
    printf "\nPlease check you have 'ffmpeg' installed on your system.\n"
    printf "\nUnable to continue, exiting program.\n\n"
    exit
fi

# Notify user that conversion task is starting.
printf "\n%b>>> Conversion task is running. <<<%b\n\n" "${yellow_text}" \
"${end_colour_text}"

# Settings for the conversion. Edit as required.
set_gamma=1.00
set_contrast=1.00
set_brightness=0.00
set_saturation=0.00

# Convert colour mkv or mp4 to greyscale.
for in_filename in *.[mM][pPkK][4vV]
do
    ffmpeg -i "$in_filename" \
        -vf eq=gamma="$set_gamma":contrast="$set_contrast":brightness="$set_brightness":saturation="$set_saturation" \
        -crf 10 \
        -codec:v libx264 \
        "greyscale_${in_filename%.*}.mp4"
done

# Notify user that the task has completed.
printf "\n%b>>> Conversion task is complete. <<<%b\n" "${green_text}" \
"${end_colour_text}"

# Shameless plug to support poor Free/Open Source developers like myself who
# make content available to people for free with no strings attached.
printf "\nPlease consider supporting Free/Open Source developers like myself \
who provide content for free. Voluntary donations can be made at \
%bhttps://www.buymeacoffee.com/kathenasorg%b\n\n" "${green_text}" \
"${end_colour_text}"
