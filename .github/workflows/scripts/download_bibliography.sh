#!/bin/bash

# These variables are set in the GitHub Actions workflow
# ZOTERO_GROUP_OR_USER_ID
# ZOTERO_API_KEY

ZOTERO_BASE_URL="https://api.zotero.org"
ZOTERO_PAGE_LIMIT=150

TMP_DIR=$(mktemp -d)

i=0
while true ;do
    start=$((i*ZOTERO_PAGE_LIMIT))
    bibfile=$TMP_DIR/${i}.bib
    wget -O $bibfile \
        -r \
        --header="Authorization: Bearer ${ZOTERO_API_KEY}" \
        --header="Zotero-API-Version: 3" \
        "${ZOTERO_BASE_URL}/groups/${ZOTERO_GROUP_OR_USER_ID}/items?format=bibtex&start=${start}&limit=${ZOTERO_PAGE_LIMIT}"
    if [ $(cat $bibfile | wc -l ) == 0 ]; then
        break
    fi
    i=$((i+1))
done

# Merge all files
cat $TMP_DIR/*.bib > paper/shared_library.bib
