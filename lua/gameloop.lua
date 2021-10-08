
-- runs once at start to
-- initialize values
function _init()

	initialize()

end

-- updates values every frame
function _update()

	handleinput()

	setslide()

	--local x = 0
	--local y = 0
	-- select a card from the deck if ready
	if (queue > 0) then

		nextcard = topcard[1]
		drawcard()

		queue -= 1

		if (move == true) then

			repeat

				repeat

					coord = moved[((rnd(4)\1)+1)]

				until coord ~= 0

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

			until board[x][y].nextface == 0


			xprint = x
			yprint = y

			move = false
			--direction = "none"



		else

			-- get random coordinates for
			-- an empty space on the board
			repeat

				x=(rnd(4)\1)+1
				y=(rnd(4)\1)+1

			until board[x][y].face == 0

		end

		board[x][y].face = nextcard
		board[x][y].nextface = nextcard
		cardtotal += 1

		for i=1,4 do

			prevmoved[i] = moved[i]
			--moved[i] = 0

		end

	end
	for i=1,4 do

		--prevmoved[i] = moved[i]
		moved[i] = 0

	end
end

-- clears screen and draws the
-- board each frame
function _draw()

		cls()
		map(0,0,0,0,128,32)

		-- display top card
		sspr(sprite[topcard[1]].x,sprite[topcard[1]].y,16,16,56,8)

		-- draws sprites to screen for
		-- each card position in board
		for i=1,4 do

			for j=1,4 do

				if (board[i][j].face ~= 0) then

					sspr(sprite[board[i][j].face].x,sprite[board[i][j].face].y,16,16,(16*(j-1))+32+(board[i][j].move*slide.x\1),(16*(i-1))+32+(board[i][j].move*slide.y\1))

				end

			end

		end

		if click then

			print(direction.." "..slide.x.." "..slide.y.." "..tostr(slide.current).." "..change.x.." "..change.y,4,120,12)

		end

		print(direction,112,4,12)
		print(prevdirection,112,12,12)
		print(angle,112,20,12)
		print("◆",mouse.x,mouse.y,11)

		for i=1,#deck do

			print(deck[i],1,(i*8)-7,0)

		end

		print(#moved,9,1,14)
		print(coord,17,1,12)
		print(xprint,25,1,14)
		print(yprint,33,1,12)
		print(board[x][y].face,41,1,14)

		for i=1,#moved do

			print(moved[i],9,(i*8),0)
			print(prevmoved[i],17,(i*8),0)

		end

end
