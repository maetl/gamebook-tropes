require './lib/gamebook'

story = Gamebook::Story.new
graph = story.generate

require 'graphviz'

viz = GraphViz.new(:G, type: :digraph)

graph.nodes.each do |node|
  viz.add_edge(node.id.to_s, node.outgoing.first.id.to_s) if !node.outgoing_edges.empty?
end

viz.output(png: 'out/linearity.png')
