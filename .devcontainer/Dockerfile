# FROM mcr.microsoft.com/devcontainers/universal:linux 
# FROM mcr.microsoft.com/devcontainers/universal:2-linux
FROM mcr.microsoft.com/devcontainers/universal:latest
# FROM mcr.microsoft.com/devcontainers/base:ubuntu
# FROM mcr.microsoft.com/devcontainers/python:3

# Non-root user of the image
ARG USERNAME="codespace"
# ARG USERNAME="vscode"

# Install ffmpeg
# RUN apt-get update && apt-get install -y ffmpeg

# Install julia; set a juliaup channel to keep it the same for the whole semester
RUN su - ${USERNAME} -c "curl -fsSL https://install.julialang.org | sh -s -- -y --default-channel 1.11" 

# Disable all juliaup automatic updates
RUN su - ${USERNAME} -c "juliaup config backgroundselfupdateinterval 0 \
&& juliaup config startupselfupdateinterval 0 && juliaup config versionsdbupdateinterval 0"

# URL for downloads of the course-specific files
ARG URL="https://www.phys.uconn.edu/~rozman/Courses/P2200_25F/downloads"

# Add startup.jl specific for the course
RUN su - ${USERNAME} -c "mkdir -p ~/.julia/config \
&& wget ${URL}/sample.startup.jl -O ~/.julia/config/startup.jl"

# (Pre)install selected Julia packages.
RUN su - ${USERNAME} -c "julia -e 'ENV[\"PYTHON\"]=\"\"; using Pkg; Pkg.activate(temp=true); Pkg.add([\"IJulia\", \"PyPlot\"]); using PyPlot'"
# RUN su - ${USERNAME} -c "julia -e 'ENV[\"PYTHON\"]=\"\"; using Pkg; Pkg.activate(temp=true); Pkg.add([\"IJulia\", \"PyPlot\"])'"

# Disable Jupyter annoyances
RUN su - ${USERNAME} -c "jupyter labextension disable \"@jupyterlab/apputils-extension:announcements\" || true" 

# Add bash setting specific for the class
RUN su - ${USERNAME} -c "wget ${URL}/bash_phys2200.txt -O ~/.bash_phys2200"
RUN su - ${USERNAME} -c "echo \"[ -f ~/.bash_phys2200 ] && . ~/.bash_phys2200\" >> ~/.bashrc || true"
