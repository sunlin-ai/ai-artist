#!/bin/bash

# Copies the folder structure from this Github repository:
#
# /notebooks/Text-To-Image/1 CLIP-Guided VQGAN.ipynb
# /notebooks/Text-To-Image/2 CLIP-Guided PixelDraw.ipynb
# ...
#
# to the format pollinations expects:
#
# /Text-To-Image/1 CLIP-Guided VQGAN/input/notebook.ipynb
# /Text-To-Image/12CLIP-Guided PixelDraw/input/notebook.ipynb
# ...

INPUT_PATH=$1
OUTPUT_PATH=$2

rm -rv "$OUTPUT_PATH"
for categorypath in "$INPUT_PATH"/*; do
    category="$(basename -- "$categorypath")"
    echo $category
    dest_folder="$OUTPUT_PATH"/"$category"
    mkdir -p $dest_folder
    for notebookpath in "$categorypath"/*.ipynb; do
        notebook=$(basename "$notebookpath" .ipynb)
        echo $notebook
        dest_nb_folder="$dest_folder"/"$notebook"/input
        mkdir -p "$dest_nb_folder"
        cp -v "$notebookpath" "$dest_nb_folder"/notebook.ipynb
    done
done
