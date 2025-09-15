#!/bin/bash
# -------------------------------------------------------------------
# script to download cmems hourly currents and stokes drift data
# -------------------------------------------------------------------

# path to copernicusmarine toolbox executable
cmt_path="/home/gkara/anaconda3/envs/cmt_2.0/bin"

# destination folder for downloaded cmems netcdf files
dest="/mnt/data/cmems-download"

# years to download
start_year=2012
end_year=2021

# month to download (format: mm)
month="07"

# bounding box for the mediterranean region
min_lon=18.57076172704283
max_lon=31.44148666547694
min_lat=32.98157423620177
max_lat=44.10150203227537

# -------------------------------------------------------------------
# loop over years, days, and hours
# -------------------------------------------------------------------
year=$start_year
while [ $year -le $end_year ]; do
  for day in $(seq 1 31); do
    for hour in $(seq 0 23); do
      
      # format filenames
      cur_out="med-cmcc-cur-rean-h-${year}-${month}-${day}-${hour}.nc"
      wav_out="med-hcmr-wav-rean-h-${year}-${month}-${day}-${hour}.nc"

      # download currents (uo, vo)
      timeout 18000 yes | $cmt_path/copernicusmarine subset \
        --dataset-id med-cmcc-cur-rean-h \
        --variable uo --variable vo \
        --start-datetime ${year}-${month}-${day}T${hour}:00:00 \
        --end-datetime   ${year}-${month}-${day}T${hour}:00:00 \
        --minimum-longitude $min_lon \
        --maximum-longitude $max_lon \
        --minimum-latitude $min_lat \
        --maximum-latitude $max_lat \
        --output-directory "$dest" \
        --output-filename "$cur_out"

      # download stokes drift (vsdx, vsdy)
      timeout 18000 yes | $cmt_path/copernicusmarine subset \
        --dataset-id med-hcmr-wav-rean-h \
        --variable VSDX --variable VSDY \
        --start-datetime ${year}-${month}-${day}T${hour}:00:00 \
        --end-datetime   ${year}-${month}-${day}T${hour}:00:00 \
        --minimum-longitude $min_lon \
        --maximum-longitude $max_lon \
        --minimum-latitude $min_lat \
        --maximum-latitude $max_lat \
        --output-directory "$dest" \
        --output-filename "$wav_out"

    done
  done
  year=$((year+1))
done

echo "cmems data download complete."
