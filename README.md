# DocumenterMermaid

A [Documenter](https://github.com/JuliaDocs/Documenter.jl) plugin package that enables native support for [mermaid.js](https://mermaid.js.org/) diagrams in Documenter documents (in HTML builds only).

| **Documentation**                                                         | **Build Status**                                                                               |
|:-------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------:|
| [![][docs-stable-img]][docs-stable-url] [![][docs-dev-img]][docs-dev-url] | [![][GHA-img]][GHA-url] [![][codecov-img]][codecov-url] [![PkgEval][pkgeval-img]][pkgeval-url] |

To enable the package, simply load it in the `make.jl` script. Any code blocks tagged as `mermaid` will be rendered as diagrams in the generated HTML.

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://juliadocs.org/DocumenterMermaid.jl/dev
[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://juliadocs.org/DocumenterMermaid.jl/stable
[GHA-img]: https://github.com/JuliaDocs/DocumenterMermaid.jl/workflows/CI/badge.svg
[GHA-url]: https://github.com/JuliaDocs/DocumenterMermaid.jl/actions?query=workflows/CI
[codecov-img]: https://codecov.io/gh/JuliaDocs/DocumenterMermaid.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/JuliaDocs/DocumenterMermaid.jl
[pkgeval-img]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/D/DocumenterMermaid.svg
[pkgeval-url]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/D/DocumenterMermaid.html
