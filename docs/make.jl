using Documenter
using DocumenterMermaid

makedocs(sitename="DocumenterMermaid")

deploydocs(
    repo = "git@github.com:JuliaDocs/DocumenterMermaid.jl"
)
