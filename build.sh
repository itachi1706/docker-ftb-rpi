#!/bin/bash
shopt -s globstar
set -e

for dockerfile in **/Dockerfile; do
    (
        echo $dockerfile
        tagPath=$(dirname "$dockerfile")
        imagePath=$(dirname "$tagPath")
        tag=$(basename "$tagPath")
        image=$(basename "$imagePath")
        imageName="itachi1706/rpi-ftb:${image}-${tag}"

        cd "$tagPath"
        echo $tagPath

        # Run pre stuff
        if [[ -f "pre.sh" ]]
        then
            echo "Found Pre Script. Running it first"
            chmod +x pre.sh
            ./pre.sh
        fi
    
        # Build image (5 retries)
        echo "Building and pushing $imageName. Attempt $n/5"
        n=0
        until [ "$n" -ge 5 ]
        do
            docker buildx build --pull --platform linux/arm/v7,linux/arm64,linux/amd64 --progress=plain --push -t "$imageName" . && break
            n=$((n+1)) 
            echo "Building $imageName failed. Retrying attempt $n/5 in 30 seconds"
            sleep 30
        done
        echo
    )
done
