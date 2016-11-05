module Gamebook
  class Story
    def initialize()
      @story_types = [:pursuit, :escape, :repair]
      @nodes = []
    end

    def add_node(type)
      @nodes << type
    end

    def generate_pursuit
      rand(35..50).times do |inc|
        add_node(:star)
      end

      @nodes
    end

    def generate_escape
      rand(35..50).times do |inc|
        add_node(:star)
      end

      @nodes
    end

    def generate_repair
      rand(35..50).times do |inc|
        add_node(:star)
      end

      @nodes
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
