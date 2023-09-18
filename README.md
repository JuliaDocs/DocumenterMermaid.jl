# DocumenterMermaid

A [Documenter](https://github.com/JuliaDocs/Documenter.jl) plugin package that enables native support for [mermaid.js](https://mermaid.js.org/) diagrams in Documenter documents (in HTML builds only).

To enable the package, simply load it in the `make.jl` script. Any code blocks tagged as `mermaid` will be rendered as diagrams in the generated HTML.
