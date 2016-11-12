module Gamebook
  class Story
    def initialize()
      @story_types = [:pursuit, :quest]
    end

    def generate_branch(graph, previous_node)
      rand(1..5).times do |inc|
        next_node = graph.add_node(label: :star)
        graph.add_edge(from: previous_node, to: next_node)
        previous_node = next_node
      end

      previous_node
    end

    def generate_pursuit
      # TODO: not implemented yet
      generate_quest
    end

    def generate_quest
      Mementus::Graph.new do
        previous_node = generate_branch(self, add_node(label: :intro))
        next_node = add_node(label: :finale)
        add_edge(from: previous_node, to: next_node)
      end
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
