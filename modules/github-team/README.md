# terraform-github-team

A [Terraform] 0.12 module that offers a more convenient and tested way to provision and manage [GitHub teams].

- [Features](#features)
- [Getting Started](#getting-started)
- [Examples](#examples)
- [Module Argument Reference](#module-argument-reference)
  - [Top-level Arguments](#top-level-arguments)
    - [Module Configuration](#module-configuration)
    - [Main Resource Configuration](#main-resource-configuration)
- [Module Attributes Reference](#module-attributes-reference)
- [External Documentation](#external-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Features

This module uses the [Terraform GitHub provider v2.4](https://github.com/terraform-providers/terraform-provider-github/releases)
that supports the following resources:

- Team
- Nested Team
- Memberships

## Getting Started

```hcl
module "team" {
  source  = "mineiros-io/team/github"
  version = "0.0.1"

  name        = "DevOps"
  description = "The DevOps Team"
  privacy     = "secret"

  members = [
    "a-user",
    "b-user"
  ]

  maintainers = [
    "a-maintainer"
  ]
}

```

## Examples

For a complete example please see [examples/] directory.

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Top-level Arguments

#### Module Configuration

- **`module_depends_on`**: *(Optional `list(any)`)*

  A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.

#### Main Resource Configuration

- **`name`**: **(Required `string`)**

  The name of the team.

- **`maintainers`**: *(Optional `set(string)`)*

  A list of users that will be added to the current team with maintainer permissions.
  Default is `[]`.

- **`members`**: *(Optional `set(string)`)*

  A list of users that will be added to the current team with member permissions.
  Default is `[]`.

- **`description`**: *(Optional `string`)*

  A description of the team.
  Default is `""`.

- **`privacy`**: *(Optional `string`)*

  The level of privacy for the team. Must be one of `secret` or `closed`.
  Default is `"secret"`.

- **`parent_team_id`**: *(Optional `number`)*

  The ID of the parent team, if this is a nested team.
  Default is to create a root team without a parent.

- **`ldap_dn`**: *(Optional `string`)*

  The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise.
  Default is `null`.

## Module Attributes Reference

The following attributes are exported by the module:

- **`module_depends_on`**

  A list of external resources the module depends_on.

## External Documentation

- GitHub Provider Documentation
  - https://www.terraform.io/docs/providers/github/index.html

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)


## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.
