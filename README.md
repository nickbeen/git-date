# Git-date

Simple shell script for changing the date of the last local commit.
Useful for old projects that have been build without a version control system, but sorta have their history preserved with snapshots or something like that. :upside_down_face: The script deliberately only focuses on the last local commit to avoid big risk with your git history.

- This script *only* works on the last local commit of the current branch
  - This script has no effect on commits that have already been pushed

## Requirements (Windows only)

- [Git for Windows](https://gitforwindows.org/)
  - Required for local git VCS
  - Required for BASH emulation on Windows

## Installation

Clone this repository with git.

```shell
git clone https://github.com/nickbeen/git-date.git
```

For easy usage, create an alias for the script named e.g. `git-date`.

## Workflow

1. Add file(s) to git or modify existing file(s) in your git project
2. Create a new commit with a useful commit message
3. Run `git-date.sh` to change the date of the commit

## Usage

```shell
Usage: ./git-date.sh <commitDate>

Operands:
  <commitDate>    Date in git internal format, RFC 2822 format, ISO 8601 format or human-centric date format.
```

### Setup

The script accepts one operand, the date, in the following [formats](https://git-scm.com/docs/git-commit#_date_formats).

| Date Type | Date Format | Example |
| ---- | ------ | ------- |
| Git internal format | <unix-timestamp> zzz | 1573821420 +0200 |
| RFC 2822 | ddd, DD MMM YYYY HH:mm:ss zzz | Fri, 15 Nov 2019 13:37:17 +0200 |
| ISO 8601 | YYYY-MM-DDTHH:mm:ss<br>YYYY-MM-DDTHH:mm | 2019-11-15T13:13:37<br>2005-04-07T22:13 |
| Human-centric date formats | | Yesterday<br>last Friday at noon |

Ommiting the date will result in an error with exit code 1.

```shell
Error: operand commitDate is required
```
### Execute

To run the script in Windows:

```shell
"%ProgramFiles%\Git\bin\bash.exe" git-date.sh '2019-11-15T13:37'
```

To run the script in Linux:

```shell
./git-date.sh '2019-11-15T13:37:17'
```

When successful, the script returns the commit log of the last commit.

```shell
commit f44e8dc0adf75b9e4df437152a6ffdfcd85cbe93 (HEAD -> master)
Author: Billy Butcher <33811927+billybutcher@users.noreply.github.com>
Date:   Fri Nov 15 13:37:17 2019 +0100

    Added LICENSE.md

 LICENSE.md | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
```

Otherwise, the script will return an error message with exit code of 1.
```shell
Error: cannot amend the last commit.
```

## License

This script is licensed under the MIT License (MIT). See the [LICENSE](LICENSE.md) for more details.
