# AtoUtransform
Transformation from an additive to ultrametric tree

- Build a Docker image from Dockerfile

```
docker build -t atoutranform:1.0 .
```

- Run atoutranform on sample dataset

```
git clone https://github.com/upendrak/AtoUtransform.git
cd AtoUtransform
```

```
docker run --rm -u $(id -u):$(id -g) -v $PWD:/data -w /data atoutranform:1.0 -i malvaceae.dat -o malvaceae_out
```

Expect to get the following output files

* malvaceae.dat.out: 

* malvaceae.treefile: Tree file

* malvaceae.original.png: 

* malvaceae.testing.png:
