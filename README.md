# Packer-samples
Sample [Packer.io](https://www.packer.io/) configuration files for building EC2 images from AWS base images.

# Configuration

- Pull base image ids from AWS marketplace and update `source_ami_filter` sections for scripts.
- Update .js files with respective VPC, account, subnet, security group and profile information
- Install packer (eg. using chocolatey `choco install packer`)

# Usage

`PS C:\> packer build packer-webserver.js`

