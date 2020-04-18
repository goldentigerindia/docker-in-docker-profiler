#!/bin/bash -vx
# The environment on which the agent is running need to pass this as environment variable to docker
if [ -z "$ENVIRONMENT_NAME" ]
then  
    echo "\$ENVIRONMENT_NAME is empty"
    ENVIRONMENT_NAME="live"
else
    echo "\$ENVIRONMENT_NAME is $ENVIRONMENT_NAME"
fi
echo "$ENVIRONMENT_NAME" > /app/environment_name
# The build branch to use .This is used to build the perticualr branch of the agent into the image
if [ -z "$BUILD_BRANCH" ]
then  
    echo "\$BUILD_BRANCH is empty"
    BUILD_BRANCH="develop"
else
    echo "\$BUILD_BRANCH is $BUILD_BRANCH"
fi
echo "$BUILD_BRANCH" > /app/build_branch
