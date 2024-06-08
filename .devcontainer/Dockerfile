FROM mcr.microsoft.com/devcontainers/universal:linux 

# Install julia
# https://github.com/JuliaLang/juliaup/issues/253#issuecomment-1969737244
RUN su codespace -c "curl -fsSL https://install.julialang.org | sh -s -- -y" 

RUN su codespace -c "mkdir -p ~/.julia/config \
&& wget --no-check-certificate https://www.phys.uconn.edu/~rozman/Courses/P2200_24F/downloads/sample.startup.jl -O ~/.julia/config/startup.jl"

RUN su codespace -c 'julia -e "using Pkg; Pkg.activate(;temp=true); Pkg.add(\"IJulia\"); ENV[\"PYTHON\"]=\"\"; Pkg.add(\"PyPlot\")"'
