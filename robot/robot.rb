class Robot
	attr_reader :bearing, :x, :y

	def orient(direction)
		raise ArgumentError unless valid_directions.include?(direction)
		@bearing = direction
	end

	def turn_right
		@bearing = valid_directions[current_position - (valid_directions.length - 1)]
	end

	def turn_left
		@bearing = valid_directions[current_position - 1]
	end

	def current_position
		valid_directions.index(@bearing)
	end

	def valid_directions
		[:north, :east, :south, :west]
	end

	def at(x, y)
		@x = x
		@y = y
	end

	def coordinates
		[x, y]
	end

	def advance
		case @bearing
		when :north then @y += 1
		when :east then @x += 1
		when :south then @y -= 1
		when :west then @x -= 1
		end
	end
end
