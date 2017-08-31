<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### kube-utils

> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

Provides functions for working with Kubernetes clusters, specifically those running in AWS.


## Prerequisites

- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [jq](https://stedolan.github.io/jq/)
- [AWS CLI](https://aws.amazon.com/cli/)


## Install

```fish
$ omf install git@github.com:mgoodness/plugin-kube-utils.git
```


## Usage

```fish
$ kube-context <context>
```

Sets the current Kubernetes context.

```fish
$ kube-instance <node>
```

Retrieves the given Kubernetes node's AWS instance ID.

```fish
$ kube-rotate <node>
```

Drains & deletes the given Kubernetes node, then terminates the AWS instance.

```fish
$ unschedulable
```

Lists unschedulable Pods in all Namespaces.


# License

[MIT][mit] © [Michael Goodness][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[contributors]:   https://github.com/{{USER}}/plugin-kube-utils/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
