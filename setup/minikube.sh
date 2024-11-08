# after starting podman machine
minikube delete

# use the podman vm-driver, otherwise another vm is created.
minikube start --container-runtime=containerd --vm-driver=podman
