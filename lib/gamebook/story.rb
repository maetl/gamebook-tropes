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
        intro = add_node(label: :intro)
        first_ref = intro.id
        second_ref = intro.id
        first_branch = generate_branch(self, first_ref)
        second_branch = generate_branch(self, second_ref)
        next_node = add_node(label: :finale)
        add_edge(from: first_branch, to: next_node)
        add_edge(from: second_branch, to: next_node)
      end
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
