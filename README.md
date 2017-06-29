# :sparkles: magic :sparkles:

Simple bash script to act as a common interface for directory specific script / tasks / commands.

Useful for those common project tasks, like `push`, `deploy`, `build` etc. which will consist of largely different commands to run depending on the project.

Literally runs Bash scripts in a `.magic/` folder in your current working directory.

## Installation
`curl` to download the script to somewhere on your path, like `/usr/local/bin/magic` or `~/bin/magic`

```
curl https://raw.githubusercontent.com/zweicoder/magic/master/magic.sh -o /usr/local/bin/magic
```

or use `wget`

```
wget https://raw.githubusercontent.com/zweicoder/magic/master/magic.sh -O /usr/local/bin/magic
```

## Usage

Create a new script with `#!/usr/bin/env bash` header and gives it executable permissions. Yes I'm that lazy.
```
magic new <name>
```

Run a script in `.magic/`
```
magic <name>
```
