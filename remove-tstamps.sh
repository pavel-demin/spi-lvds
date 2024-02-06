for file in *.kicad_pcb
do
  sed -i 's/ (tstamp[^)]*)// ; /^[[:space:]]*$/d' $file
done
