echo ""
echo -e "PROJECT_ID\tNAME\tEMAIL\tDISABLED"
gcloud projects list | \
while read -r PROJECT_ID NAME PROJECT_NUMBER; do
  if [ "$PROJECT_ID" == "PROJECT_ID" ]; then
      continue
  else
      projset="gcloud config set project $PROJECT_ID"
      if [[ $projset == *"ERROR:"* ]]; then
        continue
      else
        gcloud iam service-accounts list | \
        while read CMD; do
          if [[ "$CMD" == *"NAME"* ]]; then
            continue
          else
            echo -e "$PROJECT_ID\t$CMD"
          fi
        done
      fi
  fi
done
echo ""
