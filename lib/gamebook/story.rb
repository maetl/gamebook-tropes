module Gamebook
  class Story
    def initialize()
      @story_types = [:pursuit, :quest]
    end

    def generate
      narrative_shape = NarrativeShape.new
      narrative_shape.generate(@story_types.sample)
    end
  end
end
