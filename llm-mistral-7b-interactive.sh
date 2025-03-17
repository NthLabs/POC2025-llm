. ./poc-env
echo "$NGC_API_KEY" | docker login nvcr.io --username '$oauthtoken' --password-stdin

# Choose a container name for bookkeeping
export CONTAINER_NAME=Mistral-7B-Instruct

Repository=nim/mistralai/mistral-7b-instruct-v0.3
Latest_Tag=1.3.0

export IMG_NAME="nvcr.io/${Repository}:${Latest_Tag}"

# Choose a path on your system to cache the downloaded models
export LOCAL_NIM_CACHE=~/.cache/nim
mkdir -p "$LOCAL_NIM_CACHE"

# Start the LLM NIM
docker run -it --rm --name=$CONTAINER_NAME \
  --runtime=nvidia \
  --gpus all \
  -e NGC_API_KEY=$NGC_API_KEY \
  -v "$LOCAL_NIM_CACHE:/opt/nim/.cache" \
  -u $(id -u) \
  -p 8022:8000 \
  $IMG_NAME