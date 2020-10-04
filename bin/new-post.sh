#!/bin/bash -u

function usage() {
  echo "Usage: new-post.sh [post|draft] <title>"
  exit 1
}

if [ "$#" -ne 2 ]; then
  usage
elif [[ "$1" != "post" ]] && [[ "$1" != "draft" ]]; then
  usage
fi

POST_TYPE=$1
POST_TITLE=$2
Y=$(date +"%Y")
M=$(date +"%m")
D=$(date +"%d")
SCRIPT_PATH=$(readlink -f $0)
BIN_PATH=$(dirname $SCRIPT_PATH)
BLOG_PATH=$(dirname $BIN_PATH)
TEMP_FILE="${BIN_PATH}/yyyy-mm-dd-hoge-fuga.md"
if [[ "${POST_TYPE}" = "post" ]]; then
  NEW_POST_FILE="${BLOG_PATH}/_posts/${Y}-${M}-${D}-${POST_TITLE}.md"
else
  NEW_POST_FILE="${BLOG_PATH}/_drafts/${Y}-${M}-${D}-${POST_TITLE}.md"
fi
POST_DATE=$(date +"%Y-%m-%d %H:%M:%S +0900")

cp "$TEMP_FILE" "$NEW_POST_FILE"

sed -i -e "s/date:/date: ${POST_DATE}/" $NEW_POST_FILE 
$EDITOR $NEW_POST_FILE
