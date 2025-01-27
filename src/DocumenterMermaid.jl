module DocumenterMermaid
using MarkdownAST: MarkdownAST, Node
using Documenter: Documenter, Selectors, DOM
using Documenter.HTMLWriter: DCtx

const MERMAID = "https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs"

# This digs deeper into Documenter internals, by defining a new at-block that gets evaluated
# during the Documenter "expansion" step. The expansion of CollapsedExample re-uses the
# standard runner for @example blocks, but creates a custom MarkdownAST block, which then
# is dispatched on in the HTMLWriter (domify).
abstract type MermaidExpander <: Documenter.Expanders.ExpanderPipeline end
Selectors.matcher(::Type{MermaidExpander}, node, page, doc) = Documenter.iscode(node, "mermaid")
Selectors.order(::Type{MermaidExpander}) = 7.9
function Selectors.runner(::Type{MermaidExpander}, node, page, doc)
    node.element = MermaidBlock(node.element)
    return
end
# This is the MarkdownAST element that replaces Documenter.MultiOutput so that we could
# dispatch on it in the writer.
struct MermaidBlock <: Documenter.AbstractDocumenterBlock
    codeblock :: MarkdownAST.CodeBlock
end
function Documenter.HTMLWriter.domify(dctx::DCtx, node::Node, ::MermaidBlock)
    DOM.@tags div
    div[:class => "mermaid"](node.element.codeblock.code)
end

struct MermaidScriptBlock <: Documenter.AbstractDocumenterBlock end
function Documenter.HTMLWriter.domify(dctx::DCtx, node::Node, ::MermaidScriptBlock)
    DOM.@tags script
    script[:type => "module"]("""
    import mermaid from '$MERMAID';
    mermaid.initialize({
        startOnLoad: true,
        theme: "neutral"
    });
    """)
end

abstract type MermaidBuilder <: Documenter.Builder.DocumentPipeline end
Selectors.order(::Type{MermaidBuilder}) = 5.5
function Selectors.runner(::Type{MermaidBuilder}, doc::Documenter.Document)
    for page in values(doc.blueprint.pages)
        push!(page.mdast.children, Node(MermaidScriptBlock()))
    end
end

Documenter.MDFlatten.mdflatten(io, node::MarkdownAST.Node, e::MermaidScriptBlock) = nothing

end
