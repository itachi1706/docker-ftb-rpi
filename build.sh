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
    
        # Build image
        echo "Building and pushing $imageName"
        #docker buildx build --platform linux/arm/v7 --progress=plain --push -t "$imageName" .
    
        # Push image
        echo
    )
done
