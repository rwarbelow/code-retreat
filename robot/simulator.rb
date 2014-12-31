class Simulator
	def instructions(commands)
		commands.chars.map { |letter| letter_directions[letter] }
	end

	def letter_directions
		{
			"L" => :turn_left,
			"R" => :turn_right,
			"A" => :advance
		}
	end

	def place(robot, orders)
		robot.orient(orders[:direction])
		robot.at(orders[:x], orders[:y])
	end

	def evaluate(robot, moves)
		instructions(moves).each do |direction|
			robot.send(direction)
		end
	end
end
