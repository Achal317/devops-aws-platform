#! /bin/bash	

URLS=("http://3.109.213.46:5000/"
	"http://3.109.213.46:5000/health")



for URL in "${URLS[@]}"; do
    echo "Checking: $URL"


Header=$(curl -sS -I --max-time 5 -L "$URL")

Status_code=$(echo "$Header"|head -n 1|awk '{print $2}')

echo "$Status_code"

if [[ "$Status_code" == "200" ]]; then
    echo " Server is responding OK."

else
	echo "Server returned status: $Status_code"
	exit 1

fi
done
