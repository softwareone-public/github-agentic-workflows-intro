# GitHub Agentic Workflows: Azure Terraform Module Compatibility

This repository is a self-contained Platform Engineering workshop demo. A scheduled
[GitHub Agentic Workflow](.github/workflows/module-compatibility.md) checks the
version of the Azure platform module used by the example landing zone, evaluates
the release preconditions, and opens a pull request when an interface migration is
needed.

The demo does not need an Azure subscription. The modules use `terraform_data` to
represent platform resources, so the contract and automation can be demonstrated
without provisioning anything.

## Scenario

`examples/landing-zone` intentionally uses module `1.0.0`. The catalog marks
`2.0.0` as the latest version and documents a breaking change:

| Version | Input contract |
| --- | --- |
| `1.0.0` | `subnet_definitions` is a list of objects with `name` and `address_prefix` |
| `2.0.0` | `subnets` is a map keyed by subnet name with `address_prefix` values |

The agent detects that the example is behind, reads the migration notes, updates
the module source and input shape, runs formatting and validation, and creates a
PR with the resulting change.

## Repository layout

- `examples/landing-zone`: consumer code deliberately pinned to the old contract
- `modules/azure-platform/v1`: module `1.0.0`
- `modules/azure-platform/v2`: module `2.0.0` with the breaking interface
- `module-catalog.json`: registry-like metadata, compatibility rules, and preconditions
- `.github/workflows/module-compatibility.md`: daily agentic workflow
- `.github/workflows/terraform-checks.yml`: deterministic PR checks

## GitHub setup

1. Push this repository to GitHub.
2. Install and enable GitHub Agentic Workflows for the repository.
3. Allow the workflow's `create-pull-request` safe output and grant the workflow
   `contents: write` and `pull-requests: write` permissions if your installation
   requires explicit approval.
4. Run **Actions > Module compatibility > Run workflow** to trigger the agent.
5. Review the generated PR. The normal Terraform check workflow must pass.

The agent is instructed to make only compatibility migrations described in the
catalog. It must not apply Terraform, access cloud credentials, or change unrelated
files. In a production repository, replace the local module catalog with your
private module registry API and add policy checks appropriate to your platform.
