push!(LOAD_PATH, ".")

ENV["JULIA_CONDAPKG_VERBOSITY"] = "-1"
ENV["JULIA_CONDAPKG_LOG"] = "warn"

try
    import Pkg
    # https://discourse.julialang.org/t/disable-automatic-pkg-garbage-collection/
    Pkg._auto_gc_enabled[] = false
catch ex
    @warn "Could not load Pkg: $ex"
end

if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end

