using DocumenterMermaid
using Documenter
using Test

makedocs(sitename = "DocumenterMermaid Test")

@testset "DocumenterMermaid.jl" begin
    index_html_file = joinpath(@__DIR__, "build", "index.html")
    @test isfile(index_html_file)
    s = read(index_html_file, String)
    @test contains(s, DocumenterMermaid.MERMAID)
    @test contains(s, "<div class=\"mermaid\">")
end
