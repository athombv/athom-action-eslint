# GitHub ESLint runner

This action executes ESLint linter on specified javascript files without any previous action/build step or Docker required.

## Prerequisites

### ESLint
You must have the ESLint running locally for the action to execute. It will use the same rules as you do locally.
More info [on the ESLint getting started guide](https://eslint.org/docs/user-guide/getting-started#installation-and-usage)

This action will run `npm install --only=dev` to install the necessary dev dependencies to run ESLint, make sure `eslint` and any other configuration packages (e.g. `eslint-config-athom`) are included in the dev dependencies.

## Usage

### main.yml

Add to your existing `main.yml` file or create a new file named `.github/workflows/lint.yml` and copy over one of the examples below to your new workflow file

This is the simplest example to get it running:
```yml
name: Lint

on: [push]

jobs:
  eslint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: athombv/athom-action-eslint@1.0.3
```

By default it will run ESLint through all the files in the project. But you can also specify a glob of files to lint using the `with:` argument on your YAML file. The example below shows ESLint running only on the files under the `src/` folder:

```yml
name: Lint

on: [push]

jobs:
  eslint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: athombv/athom-action-eslint@1.0.3
        with:
          files: src/
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
