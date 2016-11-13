module Gamebook
  class Story
    def initialize()
      @story_types = [:pursuit, :quest]
    end

    def generate_branch(graph, previous_node)
      rand(1..5).times do |inc|
        next_node = graph.add_node(label: :star_system)
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
        intro = add_node(label: :interstellar_space)
        branches = []

        rand(1..5).times do
          branches << generate_branch(self, intro)
        end

        next_node = add_node(label: :interstellar_space)

        branches.each do |branch|
          add_edge(from: branch, to: next_node)
        end
      end
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
