# Bit Swap

## General :speech_balloon:

Repository of **Bit Swap** game, created to take part in [midyear Flame Game Jam](https://itch.io/jam/2nd-flame-game-jam).

## Dependencies :link:
This app is using [fvm](https://fvm.app) to manage flutter version.

To install fvm call `pub global activate fvm`.Then go to project directory and call `fvm install` and set correct [project SDK path](https://pub.dev/packages/fvm#configure-your-ide).
From now on call `fvm flutter` instead of `flutter` in terminal commands.

## Git setup :scroll:

### workflow

[GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
Please:
- work on feature branches
- create pull requests to `develop` branch
- push to `main` branch to release new version

### Branches and commits

Please name branches with `feature` of `bugfix` and a brief description. For example: `feature/Handle-player-movement`.

This repository is using [conventional commits](https://h.daily-dev-tips.com/git-basics-conventional-commits) to keep commits well organized.
[Git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) are used to ensure that the commit message have proper syntax.

Please run following commands from root of this repository to set it up:

```bash
git config core.hooksPath .githooks/  # To change default .git hooks directory
chmod ug+x .githooks/commit-msg  # To allow execution in commit-msg file
```

Example of valid commit message: `feat: Handle player movement`

## Installation :gear:

Call these command from main directory.

```bash
fvm install
fvm flutter pub get
```

in both of them.

## Run :rocket:

To run the application call this command or simply debug the app from vscode.


```bash
fvm flutter run -t lib/main.dart
```

## Tips :information_desk_person:

Run those commands from terminal to:

* `sort_imports.sh` - automatically sort all imports and format code.
* `intl_utils.sh` - regenerate localization files. You should call it after making changes in `.arb` files.
