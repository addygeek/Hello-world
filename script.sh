START_DATE="2004-01-01"
DAYS=30

for ((i=0; i<$DAYS; i++))
do
  DATE=$(date -d "$START_DATE + $i days" +"%Y-%m-%dT12:00:00")

  echo "Commit $i on $DATE" >> readme.txt

  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" \
  git add . && git commit -m "Backdated commit $i"
done