module Gamebook
  class Story
    def initialize()
      @story_types = [:pursuit, :quest]
      @nodes = []
    end

    def add_node(type)
      @nodes << type
    end

    def generate_pursuit
      # TODO: not implemented yet
      generate_quest
    end

    def generate_quest
      Mementus::Graph.new do |graph|
        previous_node = graph.add_node(label: :intro)

        rand(35..50).times do |inc|
          next_node = graph.add_node(label: :star)

          graph.add_edge(
            from: previous_node,
            to: next_node
          )

          previous_node = next_node
        end

        next_node = graph.add_node(label: :finale)

        graph.add_edge(
          from: previous_node,
          to: next_node
        )
      end
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
