require './lib/gamebook'

story = Gamebook::Story.new
graph = story.generate

require 'graphviz'

viz = GraphViz.new(:G, type: :digraph)
viz[:bgcolor] = 'transparent'

graph.edges.each do |edge|
  from = edge.from
  to = edge.to
  viz.add_node(from.id.to_s, label: from.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_node(to.id.to_s, label: to.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_edge(from.id.to_s, to.id.to_s)
end

viz.output(png: 'out/encounters.png')
