# bbtf-poc

Bitbucket Terraform Provider POC

A simple example that creates a Bitbucket project, repo, deployment and deployment variables.

## Credentials

This exmaple uses [App Passwords](https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/).

You can create a TFVARS file with the variables or put your credentials into the `env_setup.sh.example` file and rename the file to `env_setup.sh`. This will add the variables to your environment.

Then you need to source the file with the following.

```shell
source ./env_setup.sh
```
