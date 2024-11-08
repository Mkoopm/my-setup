podman machine init

# not using rootful podman will make some pods unable to start, like weaviate
podman machine set --cpus 8 --memory 6000 --rootful
podman machine start
