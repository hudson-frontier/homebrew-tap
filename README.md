<h1 align="center">Hudson Homebrew Tap</h1>

<p align="center">Install the Hudson CLI and shell completions with Homebrew.</p>

<p align="center">
  <a href="https://github.com/hudson-frontier/homebrew-tap/actions/workflows/ci.yml"><img alt="Homebrew checks" src="https://github.com/hudson-frontier/homebrew-tap/actions/workflows/ci.yml/badge.svg?branch=main"></a>
</p>

<p align="center">
  <a href="#installation">Installation</a> ·
  <a href="#supported-platforms">Platforms</a> ·
  <a href="#maintenance">Maintenance</a>
</p>

---

This tap distributes the [Hudson CLI](https://github.com/hudson-frontier/hudson-cli),
the terminal client for Hudson agents and Hudsonbox sandboxes. The formula
installs the client and completions; services are configured separately.

## Installation

With Homebrew installed:

```sh
brew install hudson-frontier/tap/hudson
hudson --version
hudson --help
```

See the [CLI getting-started guide](https://github.com/hudson-frontier/hudson-cli#readme)
for profiles, credentials, agent commands, and sandbox operations.

## Supported platforms

| Platform | Formula support |
| --- | --- |
| macOS on Apple silicon | Native bottle or source build |
| Linux x86_64 | Native bottle or source build |

Intel Mac, Windows, and Linux aarch64 archives are available through
[Hudson CLI releases](https://github.com/hudson-frontier/hudson-cli/releases).
The formula installs `hudson`. Optional `hudson-cli` and `hudsonbox`
compatibility names are provided by the upstream archives or Cargo installation.

## Upgrade or uninstall

```sh
brew update
brew upgrade hudson-frontier/tap/hudson
brew uninstall hudson
```

Uninstalling the client leaves profiles, credentials, saved request keys, and
service operations intact.

## Maintenance

[Formula/hudson.rb](Formula/hudson.rb) pins immutable CLI source bytes and native
bottle checksums. Prepare updates through the CLI repository's qualified
`main` CI and manual Homebrew preparation workflow.

Publish candidates only for an explicitly authorized, published CLI release.
Review the prepared formula, source manifest, and checksums. Existing releases
and their artifact bytes stay immutable. Follow the
[Homebrew release procedure](https://github.com/hudson-frontier/hudson-cli/blob/main/docs/homebrew.md).

[Tap CI](.github/workflows/ci.yml) runs on macOS and Linux. Each job checks
formula style, performs a strict audit, installs the pinned bottle, and runs
the formula tests.

## Contributing

Wait for all branch checks before opening a PR. Describe the change and
validation, resolve review discussions, and squash merge only after the latest
PR checks pass.

The Hudson CLI is released under
[Apache-2.0](https://github.com/hudson-frontier/hudson-cli/blob/main/LICENSE).
