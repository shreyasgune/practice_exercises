# Practice Python for DevOps stuff

## Container Stuff

```
Make sure your PIP FREEZE is updated:
pip freeze > requirements.txt

THEN:

podman build --rm -t gman-python .

podman run --rm gman-python:latest

podman run -v "$(pwd)":/app -it gman-python:latest sh
```