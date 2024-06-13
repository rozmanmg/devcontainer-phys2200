# devcontainer-phys2200

Configure a Virtual Machine aka devcontainer aka GitHub codespaces for a 'Computational Physics' class. The class uses Julia as the programming language and Jupyter notebooks as the primary programming interface.

## Note to self:

1. The container uses `mcr.microsoft.com/devcontainers/universal:linux` which is a prebuilt container image published by Microsoft. Presumably, GitHub doesn't charge for the disk space used by prebuilt 'official' images.
2. The build process installs IJulia. This step is mandatory for using Jupyter Julia notebooks.
3. The build process installs PyPlot. This step is only needed if PyPlot is used. For the time being (as of June 2024) the master branch of PyPlot.jl is installed because the importand pull request https://github.com/JuliaPy/PyPlot.jl/pull/583 has been merged into PyPlot.jl.git but there has been no the corresponding release yet.

## Quick start:

1. Copy the repository content while keeping the directory structure, or clone the repository
2. Navigate to repository's root directory (../devcontainer-phys2200/ in my case)
3. Click the green `Code` button, then click the `Codespaces` tab.
4. Click the `Create codespace on main` button.
5. Watch your codespace is being created.
6. Start using your virtual machine. 
