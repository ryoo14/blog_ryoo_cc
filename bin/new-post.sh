#!/bin/bash -u

if [ "$#" -ne 1 ]; then
  echo "Usage: new-post.sh <post-title>"
  exit 1
fi

Y=$(date +"%Y")
M=$(date +"%m")
D=$(date +"%d")
SCRIPT_PATH=$(readlink -f $0)
BIN_PATH=$(dirname $SCRIPT_PATH)
BLOG_PATH=$(dirname $BIN_PATH)
TEMP_FILE="${BIN_PATH}/yyyy-mm-dd-hoge-fuga.md"
NEW_POST_FILE="${BLOG_PATH}/_posts/${Y}-${M}-${D}-${1}.md"
POST_DATE=$(date +"%Y-%m-%d %H:%M:%S +0900")

cp "$TEMP_FILE" "$NEW_POST_FILE"

sed -i -e "s/date:/date: ${POST_DATE}/" $NEW_POST_FILE 
$EDITOR $NEW_POST_FILE
