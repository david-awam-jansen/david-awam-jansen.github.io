#!/usr/bin/env python

import sys
import bibtexparser
import json

def convert_bib_to_json(bib_file_path, json_file_path):
    with open(bib_file_path, 'r', encoding='utf-8') as bib_file:
        bib_database = bibtexparser.load(bib_file)

    entries = bib_database.entries

    # Convert to JSON format
    json_data = []
    for entry in entries:
        json_data.append(entry)

    # Write to JSON file
    with open(json_file_path, 'w', encoding='utf-8') as json_file:
        json.dump(json_data, json_file, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: ./bib_to_json.py <input_bib_file> <output_json_file>")
        sys.exit(1)

    input_bib_file = sys.argv[1]
    output_json_file = sys.argv[2]

    convert_bib_to_json(input_bib_file, output_json_file)