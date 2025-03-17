
# Choose a container name for bookkeeping
export CONTAINER_NAME=nv-embedqa-e5-v5

Repository=nim/nvidia/nv-embedqa-e5-v5
Latest_Tag=1.1.0

export IMG_NAME="nvcr.io/${Repository}:${Latest_Tag}"

# Choose a path on your system to cache the downloaded models
export LOCAL_NIM_CACHE=~/.cache/nim
mkdir -p "$LOCAL_NIM_CACHE"

# Start the LLM NIM
docker run -d --name=$CONTAINER_NAME \
  --restart unless-stopped \
  --runtime=nvidia \
  --gpus all \
  -v "$LOCAL_NIM_CACHE:/opt/nim/.cache" \
  -u $(id -u) \
  -p 8031:8000 \
  $IMG_NAME