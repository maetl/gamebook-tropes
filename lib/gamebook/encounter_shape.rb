module Gamebook
  class EncounterShape
    def undetectable_trap(graph, previous_node)
      enter = graph.add_node(label: :enter_trap)
      leave = graph.add_node(label: :leave_trap)
      trigger = graph.add_node(label: :trigger_trap)
      graph.add_edge(from: previous_node, to: enter)
      graph.add_edge(label: :avoid_trap, from: enter, to: leave)
      graph.add_edge(label: :trigger_trap, from: enter, to: trigger)
      graph.add_edge(label: :survive_trap, from: trigger, to: leave)
      leave
    end

    def detectable_trap(graph, previous_node)
      enter = graph.add_node(label: :enter_trap)
      detect = graph.add_node(label: :detect_trap)
      miss = graph.add_node(label: :miss_trap)
      leave = graph.add_node(label: :leave_trap)
      trigger = graph.add_node(label: :trigger_trap)
      graph.add_edge(from: previous_node, to: enter)
      graph.add_edge(label: :detect_trap, from: enter, to: leave)
      graph.add_edge(label: :miss_trap, from: enter, to: miss)
      graph.add_edge(label: :avoid_trap, from: miss, to: leave)
      graph.add_edge(label: :trigger_trap, from: miss, to: trigger)
      graph.add_edge(label: :survive_trap, from: trigger, to: leave)
      leave
    end
  end
end
