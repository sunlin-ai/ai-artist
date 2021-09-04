#!/bin/bash

INPUT_PATH=$1
OUTPUT_PATH=$2

rm -rv "$OUTPUT_PATH"
for categorypath in "$INPUT_PATH"/*; do
    category="$(basename -- $categorypath)"
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
