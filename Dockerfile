FROM debian:buster-slim
LABEL MAINTAINER="Julie Ng <azure@julie.io>"

ARG AZ_CLI_VERSION=2.14.0-1~buster
ARG AZ_DEVOPS_VERSION=0.18.0
ARG TERRAFORM_VERSION=0.13.5
ARG DEBIAN_FRONTEND=noninteractive

USER root

# Required dependencies

RUN apt-get update -qq && \
    apt-get install -y \
      apt-transport-https \
      build-essential \
      ca-certificates \
      curl \
      gnupg \
      libpq-dev \
      lsb-release \
      nodejs \
      software-properties-common

# Install Azure CLI incl. Azure DevOps extension

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && \
    apt-cache policy azure-cli && \
    apt-get install azure-cli=${AZ_CLI_VERSION} && \
    apt-get install azure-cli --no-upgrade && \
    az --version && \
    az extension add --name azure-devops --version ${AZ_DEVOPS_VERSION} && \
    az extension list -o table

# Install Terraform

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-cache policy terraform && \
    apt-get install terraform=${TERRAFORM_VERSION} && \
    apt-get install terraform --no-upgrade && \
    terraform -version

# Do not run as root
# But Azure DevOps needs root permissions?
# RUN groupadd --system devops && \
#     useradd --create-home --system --gid devops devops

# USER devops

# WORKDIR /home/devops