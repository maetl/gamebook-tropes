require './lib/gamebook'

story = Gamebook::Story.new
puts story.generate
