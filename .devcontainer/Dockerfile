FROM mcr.microsoft.com/devcontainers/universal:linux 

# Install julia
RUN su - codespace -c "curl -fsSL https://install.julialang.org | sh -s -- -y" 

# URL for downloads of the course-specific files
ARG URL="https://www.phys.uconn.edu/~rozman/Courses/P2200_24F/downloads"

# Add startup.jl specific for the course
RUN su - codespace -c "mkdir -p ~/.julia/config \
&& wget --no-check-certificate ${URL}/sample.startup.jl -O ~/.julia/config/startup.jl"

# (Pre)install selected Julia packages.
RUN su - codespace -c "julia -e 'ENV[\"PYTHON\"]=\"\"; using Pkg; Pkg.activate(temp=true); Pkg.add([\"IJulia\", \"PyPlot\"])'"

# Disable Jupyter annoyances
RUN su - codespace -c "jupyter labextension disable \"@jupyterlab/apputils-extension:announcements\" || true" 

# Add bash setting specific for the class
RUN su - codespace -c "wget --no-check-certificate ${URL}/bash_phys2200.txt -O ~/.bash_phys2200"
RUN su - codespace -c "echo \"[ -f ~/.bash_phys2200 ] && . ~/.bash_phys2200\" >> ~/.bashrc || true"
