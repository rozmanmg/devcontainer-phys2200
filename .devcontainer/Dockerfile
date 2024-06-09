FROM mcr.microsoft.com/devcontainers/universal:linux 

# Install julia
RUN su codespace -c "curl -fsSL https://install.julialang.org | sh -s -- -y" 

# Add startup.jl
RUN su codespace -c "mkdir -p ~/.julia/config \
&& wget --no-check-certificate https://www.phys.uconn.edu/~rozman/Courses/P2200_24F/downloads/sample.startup.jl -O ~/.julia/config/startup.jl"

# (Pre)install selected Julia packages
RUN su - codespace -c "julia -e 'ENV[\"PYTHON\"]=\"\"; using Pkg; Pkg.activate(temp=true); Pkg.add([\"IJulia\", \"PyPlot\"]);'"

# Fix PyPlot. This step is needed temporarily, until the pull request https://github.com/JuliaPy/PyPlot.jl/pull/583 is merged
RUN su - codespace -c "mv ~/.julia//packages/PyPlot/2MlrT/src/colormaps.jl ~/.julia//packages/PyPlot/2MlrT/src/colormaps.jl.bak \
&& mv /workspaces/devcontainer-test/.colormaps.jl ~/.julia//packages/PyPlot/2MlrT/src/colormaps.jl || true"

# Disable annoyances
RUN su - codespace -c "jupyter labextension disable \"@jupyterlab/apputils-extension:announcements\" || true" 

# RUN su codespace -c '. ~/.bashrc \
# && julia -e "using Pkg; Pkg.activate(\".\"); Pkg.add(\"IJulia\"); ENV[\"PYTHON\"]=\"\"; Pkg.add(url=\"https://github.com/JuliaPy/PyPlot.jl.git#master\")"'
