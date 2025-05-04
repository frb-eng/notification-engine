# Notification Engine

## Overview

The **Notification Engine** is a scalable and efficient system designed to handle and distribute real-time notifications. It leverages modern cloud and messaging technologies to ensure cost-effectiveness and high performance.

## Features

- **Incoming Call Notifications**: Notifies users when a friend is calling in real-time.
- **Email Notifications**: Sends alerts when a friend sends an email.
- **Message Notifications**: Delivers real-time notifications for messages received from friends.

## Architecture

The Notification Engine is built with a modular approach to ensure scalability and flexibility. It includes:
- **Event-driven architecture** using message queues or event buses (e.g., Kafka, RabbitMQ, or Azure Event Grid).
- **Microservices-based notification handling** for different types of notifications.
- **Cloud-native deployment** for scalability and reliability.
- **Push based notifications** to cater to different use cases.

## Key Considerations
We aim to optimize the Notification Engine by addressing the following key questions:

### Resource Consumption vs. Load
- How does the system scale under different loads?
- What are the CPU, memory, and network usage patterns as message throughput increases?
- What optimizations can be applied to reduce unnecessary resource consumption?
  
### Cost Progression vs. Load
- How do cloud costs scale with increasing notification traffic?
- What are the cost implications of different messaging infrastructures?
- How can cost-efficiency be improved while maintaining performance?
  
### Failure Tolerance & Resilience
- What mechanisms can be implemented to ensure system reliability in case of partial failures?
- How does the system recover from message queue failures, database downtimes, or network outages?
- What redundancy and failover strategies should be in place to minimize downtime?

## Environment setup

### 1. Install Docker Desktop

In case of Windows runs always outside of WSL

https://www.docker.com/products/docker-desktop/

Enable Kubenetes under Settings > Kubenetes > Enable Kubernetes

You can use `Kubeadm` as provisioning method.

Wait until you see "Kubernetes running" in status bar of Docker Desktop.

### 2. Install Dependencies (Ubuntu)

For Ubuntu developers, after installing Docker Desktop, you can use the `install_dependencies.sh` bash script or the "Install dependencies" VS Code task to set up the required dependencies. This simplifies the setup process and ensures all necessary components are installed.

### 3. Install `kubectl` (covered by install dependencies for Ubuntu)

Linux / Windows (WSL):

```bash
snap install kubectl --classic
```

macOS:

Make sure you have [`Homebrew`](https://brew.sh/) installed.

```bash
brew install kubectl
```

Verify

```bash
kubectl version --client
kubectl get node
```

[Source](https://kubernetes.io/docs/tasks/tools/#kubectl)

### 4. Install Helm (covered by install dependencies for Ubuntu)

Linux / Windows (WSL):

```bash
sudo snap install helm --classic
```

macOS:

```bash
brew install helm
```

Verify

```bash
helm version
```

[Source](https://helm.sh/docs/intro/install/)

### 5. Configure VSCode

To set up VSCode for Kubernetes, install the `ms-kubernetes-tools.vscode-kubernetes-tools` extension.
This is an official Kubernetes extension published by Microsoft.
In extension context menu make sure the kubeconfig is set correctly.
The kubeconfig file is typically located at `~/.kube/config`.
After setting it up, you should see the `docker-desktop` cluster available and be able to explore namespaces such as:
- `default`
- `kube-node-lease`
- `kube-public`
- `kube-system`

### 6. Install ingress controller

```bash
./install_dependencies.sh
```

## Resources

- [Ingress-Nginx Controller](https://kubernetes.github.io/ingress-nginx/)
- [Session Affinity](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#session-affinity)
