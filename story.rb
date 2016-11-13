require './lib/gamebook'

story = Gamebook::Story.new
graph = story.generate

require 'graphviz'

viz = GraphViz.new(:G, type: :digraph)

graph.edges.each do |edge|
  from = edge.from
  to = edge.to
  viz.add_edge("#{from.id}:#{from.label}", "#{to.id}:#{to.label}")
end

viz.output(png: 'out/two-branches.png')
