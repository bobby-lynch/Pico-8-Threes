
-- removes card from deck and
-- returns its face value
function pullcard()

	-- if deck is empty, reset it
	if(#deck==0) then

		for card in all(cards) do

			add(deck,card)

		end

	end

	-- select random card from the
	-- deck
	index = (rnd(#deck)\1)+1
	topcard[1] = deck[index]

	-- remove selected card from
	-- deck
	for i=index,#deck+1 do

		deck[i] = deck[i+1]

	end

	-- decrease size of deck by 1
 deck[#deck+1] = nil

end

-- get cards from bonus deck
-- and return their face values
function pullbonuscard()

	topcard[1] = bonusdeck[1]

	if #bonusdeck == 2 then

		add(topcard,bonusdeck[2])

	end

	if #bonusdeck >= 3 then

		add(topcard,bonusdeck[(rnd(#bonusdeck - 2)\1) + 2])
		add(topcard,bonusdeck[#bonusdeck])

	end

end

-- place top card from the deck
-- onto the board
function placecard()

	-- check if cards need to be
	-- placed
	if (queue > 0) then

		nextcard = topcard[(rnd(#topcard)\1)+1]

		-- reset size of topcard list
		while #topcard > 1 do

			deli(topcard, #topcard)

		end

		--randnum = (rnd(21)\1)
		--if (highestcard >= 6 and randnum == 0) then
		if (highestcard >= 6 and (rnd(21)\1) == 0) then

			pullbonuscard()

		else

			pullcard()

		end

		queue -= 1

		-- get random coordinates for
		-- an empty space on the board
		repeat

			-- get coordinates in a row/column that
			-- moved if there was a move
			if (move == true) then

				getcoords()

				-- just for testing
				xprint = x
				yprint = y

				move = false

			-- otherwise get random coordinates
			-- for any empty space on the board
			else

				x=(rnd(4)\1)+1
				y=(rnd(4)\1)+1

			end

		until board[x][y].face == 0

		-- place card on board
		board[x][y].face = nextcard
		board[x][y].nextface = nextcard
		cardtotal += 1

		-- set the previous moved rows/columns
		for i=1,4 do

			prevmoved[i] = moved[i]

		end

		-- set the value of highest card after
		-- all cards are placed and moved
		sethighcard()

	end

	-- reset moved rows/columns
	for i=1,4 do

		moved[i] = 0

	end

end

-- get coordinates for a space on the board
-- in a row/column that moved
function getcoords()

	-- select a random space in a
	-- row/column where a move has taken place
	repeat

		coord = moved[((rnd(4)\1)+1)]

	until coord ~= 0

	-- set x,y coordinates based on direction
	if (prevdirection == "⬆️") then

		x = 4
		y = coord

	elseif (prevdirection == "⬅️") then

		x = coord
		y = 4

	elseif (prevdirection == "⬇️") then

		x = 1
		y = coord

	elseif (prevdirection == "➡️") then

		x = coord
		y = 1

	end

end

-- set the value of the highest card on the board
function sethighcard()

	for i=1,4 do

		for j=1,4 do

			if ((board[i][j].face / 8) > highestcard) then

				highestcard = (board[i][j].face / 8)
				add(bonusdeck, highestcard)

			end

		end

	end

end
