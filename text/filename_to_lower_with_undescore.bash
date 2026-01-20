#!/bin/env bash
#
# Author: Phil Wyett (kathenas) - philip.wyett@kathenas.org
#
# Website: https://kathenas.org
#
# Buy me a coffee: https://www.buymeacoffee.com/kathenasorg
#
# License: GPLv3 - See https://www.gnu.org/licenses/gpl-3.0.en.html
#
# Copyright is asserted by the author.

# Define some colours for text output.
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

# Notify user that the conversion task is starting.
printf "\n%b>>> Conversion task is running. <<<%b\n\n" "${yellow_text}" \
"${end_colour_text}"

# Convert to lower case and replace spaces and dashes with nderscores.
for in_filename in *
do
    out_filename=${in_filename,,}
    mv "$in_filename" "${out_filename//[ |-]/_}"
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
