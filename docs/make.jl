using Changelog
using Documenter
using DocumenterMermaid

# Generate a Documenter-friendly changelog from CHANGELOG.md
Changelog.generate(
    Changelog.Documenter(),
    joinpath(@__DIR__, "..", "CHANGELOG.md"),
    joinpath(@__DIR__, "src", "release-notes.md");
    repo = "JuliaDocs/DocumenterMermaid.jl",
)

makedocs(
    sitename="DocumenterMermaid",
    pages = [
        "index.md",
        "release-notes.md",
    ]
)

deploydocs(
    repo = "git@github.com:JuliaDocs/DocumenterMermaid.jl"
)
