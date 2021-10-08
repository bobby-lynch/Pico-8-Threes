
-- check to see which cards can
-- move in the given direction
function checkmoves()

	istart = 1
	iend = 4
	inext = 1

	if (direction == "⬇️" or direction == "➡️") then

		istart = 4
		iend = 1
		inext = -1

	end

	for i=istart,iend,inext do

		for j=1,4 do

			if direction == "⬆️" then

				x = i
				y = j
				u = i-1
				v = j

			elseif direction == "⬅️" then

				x = j
				y = i
				u = j
				v = i-1

			elseif direction == "⬇️" then

				x = i
				y = j
				u = i+1
				v = j

			elseif direction == "➡️" then

				x = j
				y = i
				u = j
				v = i+1

			end

			if i==istart then

				board[x][y].move = 0
				board[x][y].nextface = board[x][y].face

			else

				if (board[x][y].face == 0) then

					board[x][y].move = 0
					board[x][y].nextface = 0

				elseif (board[u][v].face == 0) then

					board[x][y].move = 1
					board[u][v].nextface = board[x][y].face
					board[x][y].nextface = 0

				elseif (board[u][v].move == 1) then

					board[x][y].move = 1
					board[u][v].nextface = board[x][y].face
					board[x][y].nextface = 0

				elseif (board[x][y].face >= 3 and board[u][v].face == board[x][y].face) then

						board[x][y].move = 1
						board[u][v].nextface += board[x][y].face
						board[x][y].nextface = 0

				elseif ((board[u][v].face + board[x][y].face) == 3) then

						board[x][y].move = 1
						board[u][v].nextface += board[x][y].face
						board[x][y].nextface = 0

				else

					board[x][y].move = 0

				end

			end

		end

	end

end

-- move cards on the board if they
-- can be moved,
function completemove()

	-- loop through spaces on board
	for i=1,4 do

		for j=1,4 do

			if board[i][j].move == 1 then

				-- indicates at least one card
				-- is being moved
				move = true

				if (direction == "⬆️" or direction == "⬇️") then

					--moved[i] = i
					moved[j] = j

				elseif (direction == "⬅️" or direction == "➡️") then

					moved[i] = i
					--moved[j] = j

				end

			end

			-- move card to new space on board
			-- and reset move
			board[i][j].face = board[i][j].nextface
			board[i][j].move = 0

		end

	end

	-- if at least one card is
	-- moved, add a new card to
	-- the queue
	if move then

		queue += 1

	end

end

-- reset the move value for all spaces
-- on the board
function resetmove()

	for i=1,4 do

		for j=1,4 do

			board[i][j].move = 0
			board[i][j].nextface = board[i][j].face

		end

	end

end

-- set the distance each card
-- slides during a swipe based
-- on the direction and distance
-- of the swipe
function setslide()

	if direction == "⬆️" then

		slide.x = 0

		if (change.y <= -15) then

			slide.y = -15

		elseif (change.y >= 0) then

			slide.y = 0

		else

			slide.y = change.y

		end

	elseif direction == "⬅️" then

		slide.y = 0

		if (change.x <= -15) then

			slide.x = -15

		elseif (change.x >= 0) then

			slide.x = 0

		else

			slide.x = change.x

		end

	elseif direction == "⬇️" then

		slide.x = 0

		if (change.y >= 15) then

			slide.y = 15

		elseif (change.y <= 0) then

			slide.y = 0

		else

			slide.y = change.y

		end

	elseif direction == "➡️" then

		slide.y = 0

		if (change.x >= 15) then

			slide.x = 15

		elseif (change.x <= 0) then

			slide.x = 0

		else

			slide.x = change.x

		end

	end

end
