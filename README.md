# devcontainer-phys2200

Configure a Virtual Machine aka devcontainer aka GitHub codespaces for a 'Computational Physics' class. The class uses Julia as the programming language and Jupyter notebooks as the primary programming interface.

## Note to self:

1. The container uses `mcr.microsoft.com/devcontainers/universal:latest` which is a prebuilt container image published by Microsoft. Presumably, GitHub doesn't charge for the disk space used by prebuilt 'official' images. The image comes with non-root container user named `codespace`.
2. The build process installs IJulia. This step is mandatory for using Jupyter Julia notebooks.
3. The build process installs PyPlot. This step is only needed if PyPlot is used. 

## Quick start:

1. Clone this repository, or use it as a template, or copy the repository's content while keeping the directory structure. 
2. In your cloned repository, navigate to repository's root directory (../devcontainer-phys2200/ in my case)
3. Click the green `Code` button, then click the `Codespaces` tab.
4. Click the `Create codespace on main` button.
5. Watch your codespace is being created.
6. Start using your virtual machine. 
