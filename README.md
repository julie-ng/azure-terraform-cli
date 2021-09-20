### ⚠️ Do not use - this was just for learning purposes only

Consider instead

- [Terraform Provider for Azure DevOps &rarr;](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs)
- Microsoft-Hosted Agents. [See list of pre-installed software on GitHub &rarr;](https://github.com/actions/virtual-environments/blob/main/images/linux/Ubuntu2004-README.md)

---

# azure-terraform-cli

A lean Docker image with Terraform and Azure CLI that can be used as a CI/CD build agent.

## Versions

| This image | Azure CLI | AZ Devops Ext. | Terraform |
|:--|:--|:--|:--|
| 0.2.0 | 2.14.0-1~buster | 0.18.0 | 0.13.5 |
| 0.1.0 | 2.13.0-1~buster | 0.18.0 | 0.13.0 |

## References

- [Azure Docs: Install Azure CLI with apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt)
- [Azure CLI Reference: `az devops` command](https://docs.microsoft.com/en-us/cli/azure/ext/azure-devops/devops?view=azure-cli-latest)
- [Hasicorp Learn: Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
