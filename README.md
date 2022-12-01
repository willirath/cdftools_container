# CDFTOOLS Container

## Build

(We use [@kathoef](https://github.com/kathoef)'s [docker2singularity](https://github.com/kathoef/docker2singularity) here.)

```shell
$ docker pull kathoef/docker2singularity:latest
$ docker build -f Dockerfile -t localhost/cdftools .
$ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro -v ${PWD}:/output \
  kathoef/docker2singularity singularity build cdftools.sif docker-daemon://localhost/cdftools:latest
```

Then, `scp` or `rsync` the `cdftools.sif` to wherever you want to use it.

See the [Dockerfile](Dockerfile) for details.

## Run

To see the help dialogue of `cdfmoc` with Docker:

```shell
$ docker run -v $PWD:/work -w /work cdftools:latest cdfmoc
```

And with Singularity / Apptainer:

```shell
$ singularitu run -B $PWD:/work -W /work cdftools.sif cdfmoc
```
