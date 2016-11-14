require 'graphviz'
require './lib/gamebook'

encounters = Gamebook::EncounterShape.new

graph = Mementus::Graph.new do
  start_node = add_node(label: :start)
  end_node = add_node(label: :end)
  leave_node = encounters.detectable_trap(self, start_node)
  add_edge(from: leave_node, to: end_node)
end

viz = GraphViz.new(:G, type: :digraph)
viz[:bgcolor] = 'transparent'

graph.edges.each do |edge|
  from = edge.from
  to = edge.to
  viz.add_node(from.id.to_s, label: from.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_node(to.id.to_s, label: to.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_edge(from.id.to_s, to.id.to_s)
end

viz.output(png: 'out/detectable-trap.png')

graph = Mementus::Graph.new do
  start_node = add_node(label: :start)
  end_node = add_node(label: :end)
  leave_node = encounters.undetectable_trap(self, start_node)
  add_edge(from: leave_node, to: end_node)
end

viz = GraphViz.new(:G, type: :digraph)
viz[:bgcolor] = 'transparent'

graph.edges.each do |edge|
  from = edge.from
  to = edge.to
  viz.add_node(from.id.to_s, label: from.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_node(to.id.to_s, label: to.label, fontname: 'Lucida Grande', fontsize: '12', shape: 'rectangle', style: 'rounded,filled', fillcolor: '.7 .3 1.0')
  viz.add_edge(from.id.to_s, to.id.to_s)
end

viz.output(png: 'out/undetectable-trap.png')
