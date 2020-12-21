#!/bin/bash
shopt -s globstar
set -e

for dockerfile in **/Dockerfile; do
    (
        tagPath=$(dirname "$dockerfile")
        imagePath=$(dirname "$tagPath")
        tag=$(basename "$tagPath")
        image=$(basename "$imagePath")
        imageName="itachi1706/rpi-ftb:${image}-${tag}"
    
        # Build image
        echo "Building $imageName"
        cd "$tagPath"
        echo $tagPath
        #docker buildx build --platform linux/arm/v7 --progress=plain --push -t "$imageName" .
    
        # Push image
        echo
        echo "Pushing $imageName"
        docker push "$imageName"
    )
done
