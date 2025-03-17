# Choose a container name for bookkeeping
export CONTAINER_NAME=Mistral-7B-Instruct

Repository=nim/mistralai/mistral-7b-instruct-v0.3
Latest_Tag=1.3.0

export IMG_NAME="nvcr.io/${Repository}:${Latest_Tag}"

# Choose a path on your system to cache the downloaded models
export LOCAL_NIM_CACHE=~/.cache/nim
mkdir -p "$LOCAL_NIM_CACHE"

# Start the LLM NIM
docker run -d --name=$CONTAINER_NAME \
  --restart unless-stopped \
  --runtime=nvidia \
  --gpus all \
  -e NIM_KVCACHE_PERCENT=0.2 \
  -v "$LOCAL_NIM_CACHE:/opt/nim/.cache" \
  -u $(id -u) \
  -p 8022:8000 \
  $IMG_NAME