# FastAPI endpoints

This repo hosts FastAPI endpoints that can be deployed in a container run on Google
Cloud Run. Cloud Build is configured so that once a PR is merged into `main`, a new
build process is triggered and the Cloud Run container is re-deployed.

## Developing the code locally

We strongly recommend using a Python package management tool to manage the dependencies
of this project. The tool chosen for this project is `rye`, a new Python packaging tool
written in Rust with high performances. Since `rye` is compatible with PEP 621
`pyproject.toml`, other packaging management tools such as `hatch` or `pdm` should also
work. It, however, won't work with `poetry`.

### Step 1: Create a repo from this template Clone this repo

First, please create a new repo using this template and use the following command to
clone this repo to your local development machine:

```sh
git clone https://github.com/{YOUR_ORG_NAME}/{YOUR_REPO_NAME}.git
cd {YOUR_REPO_NAME}
```

### Step 2: Inspect project names and path for the package

By default, the name for this project in `pyproject.toml` is `fastapi-image`. If this is
not the name you prefer, please feel free to change it. Please also remember to change:

* the path of the project
* the paths in `pyproject.toml`
* the paths in `Dockerfile`
* the paths in the github workflow
* the package path in tests

### Step 3: Install `rye` and dependencies

If you don't already have `rye` installed on your computer, please follow [their
installation guide](https://rye.astral.sh/) to have it installed.

With `rye`, setting up a development environment is very easy. Just run this command:

```sh
rye sync
```

You will have a virtual environment automatically set up under your project directory
with all dependencies and dev dependencies installed.

### Step 4: Develop in dev mode

Run the following command to spin up a dev server:

```sh
rye run dev
```

This is equivalent to running

```sh
fastapi dev ./src/fastapi_image/main.py
```

### Step 5: Test the code with `pytest`

Test scripts are located in the `tests` directory. To run tests, use

```sh
rye run tests
```

**Note**: Simply calling the `pytest` cli or `rye test` will result in errors because
the project is defined as "virtual" in `rye`, meaning that the project itself won't be
installed as a package. We need to run `python -m pytest` to add the root directory to
`sys.path` to allow the correct modules to be installed.

### Step 6: Build the docker image and run in a container

We have also set up the commands to build the docker image and run it in a container:

```sh
rye run build
rye run container
```

The container will be available at https://127.0.0.1:8080/
