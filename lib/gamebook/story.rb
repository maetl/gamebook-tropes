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
      add_node(:intro)

      add_node([:branch, :merge]).sample

      rand(35..50).times do |inc|
        add_node(:star)
      end

      add_node(:finale)

      @nodes
    end

    def generate_quest
      add_node(:intro)

      rand(35..50).times do |inc|
        add_node(:star)
      end

      add_node(:finale)

      @nodes
    end

    def generate
      send("generate_#{@story_types.sample}".to_sym)
    end
  end
end
