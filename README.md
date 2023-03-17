# Template for writing paper with markdown+pandoc

**Please change "Workflow permissions" in repository settings otherwise your ALL GitHub Actions will fail.

## Setup your develop environment

```console
pip install -r requirements.txt
```

## How to build, commit, and push

Build:

```console
make
```

Commit:

```console
make format
git commit -m "Add insight into conclusion"
```

Push:

```console
git push origin <your branch name>
```
