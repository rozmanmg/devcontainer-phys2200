FROM mcr.microsoft.com/devcontainers/universal:latest

# Non-root user of the image
ARG USERNAME="codespace"

# Use the same version of python under Conda as the jupyter running in the container
ARG PYTHONVER="3.12.1"

# Set a julia version to keep it the same for the whole semester
ARG JULIAVER="1.12.6"

# Use the same version of IJulia for the whole semester
ARG IJULIAVER="\"1.34.4\""

# Update everything
# RUN apt-get update && apt-get upgrade -y

# Install ffmpeg
# RUN apt-get update && apt-get install --no-install-recommends -y ffmpeg

# Install software for converting jupyter notebooks to pdf
# RUN apt-get update && apt-get install --no-install-recommends -y inkscape pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic

# Install julia; set a julia version to keep it the same for the whole semester
RUN su - ${USERNAME} -c "curl -fsSL https://install.julialang.org | sh -s -- -y --default-channel ${JULIAVER}" 

# Disable all juliaup automatic updates
RUN su - ${USERNAME} -c "juliaup config backgroundselfupdateinterval 0 \
&& juliaup config startupselfupdateinterval 0 && juliaup config versionsdbupdateinterval 0"

# Add startup.jl 
RUN su - ${USERNAME} -c "mkdir -p ~/.julia/config"
COPY --chown=${USERNAME}:${USERNAME} sample.startup.jl /home/${USERNAME}/.julia/config/startup.jl

# Prepare reproducible python environment for PythonPlot
RUN su - ${USERNAME} -c "conda config --append channels conda-forge && conda install python=${PYTHONVER} matplotlib jupyter ipywidgets -y \ 
&& conda clean --all -y || true"

# Install IJulia and prepare the default IJulia kernel with JULIA_NUM_THREAS="auto" 
RUN su - ${USERNAME} -c "julia -e 'using Pkg; Pkg.activate(temp=true); Pkg.add(name=\"IJulia\", version=${IJULIAVER}); \
using IJulia; installkernel(\"julia\", env=Dict(\"JULIA_NUM_THREADS\"=>\"auto\"))'"
# RUN su - ${USERNAME} -c "julia -e 'ENV[\"PYTHON\"]=\"\"; using Pkg; Pkg.activate(temp=true); Pkg.add([\"IJulia\", \"PyPlot\"]); using PyPlot'"

# Disable Jupyter annoyances
RUN su - ${USERNAME} -c "jupyter labextension disable \"@jupyterlab/apputils-extension:announcements\" || true" 

# Add bash setting specific for the class
COPY --chown=${USERNAME}:${USERNAME} bash_phys2200.txt /home/${USERNAME}/.bash_phys2200
RUN su - ${USERNAME} -c 'echo "[ -f ~/.bash_phys2200 ] && . ~/.bash_phys2200" >> ~/.bashrc || true'
