# devcontainer-phys2200

Configure a dev container for PHYS 2200 class

## Note to self:

1. The container uses `mcr.microsoft.com/devcontainers/universal:linux` which is a pre-built dev container image. Presumably GitHub doesn't charge for the disk space used by pre-built images.
2. The build process installs IJulia. This step is mandatory to be able to run Jupyter Julia notebooks.
3. The build process installs PyPlot. Of course, this step is only needed if PyPlot is used. For the time being (June 2024) the master branch of PyPlot.jl is installed since the importand pull request https://github.com/JuliaPy/PyPlot.jl/pull/583 has been merged but there is no corresponding release yet.    
