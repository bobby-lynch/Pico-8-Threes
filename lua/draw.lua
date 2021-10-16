-- draws the preview of the next card to
-- be played from the top of the deck or
-- from a subset of the bonus deck
function drawpreview()

    if #topcard == 1 then

        -- draw card border
        sspr(72,48,16,16,56,8)
        -- draw card
    	sspr(sprite[topcard[1]].x,sprite[topcard[1]].y,16,16,56,8)

    elseif #topcard == 2 then

        sspr(72,48,16,16,47,8)
        sspr(sprite[topcard[1]].x,sprite[topcard[1]].y,16,16,47,8)
        sspr(72,48,16,16,63,8)
        sspr(sprite[topcard[2]].x,sprite[topcard[2]].y,16,16,63,8)

    else
        
        sspr(72,48,16,16,40,8)
        sspr(sprite[topcard[1]].x,sprite[topcard[1]].y,16,16,40,8)
        sspr(72,48,16,16,56,8)
        sspr(sprite[topcard[2]].x,sprite[topcard[2]].y,16,16,56,8)
        sspr(72,48,16,16,72,8)
        sspr(sprite[topcard[3]].x,sprite[topcard[3]].y,16,16,72,8)

    end

end

-- draws the cards that are on the board
function drawcards()

    -- draws sprites to screen for
    -- each card position in board
    for i=1,4 do

        for j=1,4 do

            if (board[i][j].face ~= 0) then
                --sspr(sprite[board[i][j].face].x,sprite[board[i][j].face].y,16,16,(16*(j-1))+32+(board[i][j].move*slide.x\1),(16*(i-1))+32+(board[i][j].move*slide.y\1))
                sspr(sprite[board[i][j].face].x,sprite[board[i][j].face].y,16,16,position[j].x+(board[i][j].move*slide.x\1),position[i].y+(board[i][j].move*slide.y\1))

            end

        end

    end

end


-- display game data on the screen for testing
function displayinfo()

	-- when the mouse is being clicked, print the direction of the swipe,
	-- the change in x,y for the swiped cards, and the change in x,y of
	-- the current mouse position from where it was clicked
	if click then

		print(direction.." "..slide.x.." "..slide.y.." "..change.x.." "..change.y,4,120,12)

	end

	-- print the current direction, previous direction, and the
	-- relative angle of the cursor from where it was clicked
	print(direction,112,4,12)
	print(prevdirection,112,12,12)
	print(angle,112,20,12)
	print(highestcard,112,28,12)
	print(#topcard,112,36,12)
	--print(randnum,112,44,12)

	-- print the face values of the cards currently in the deck
	for i=1,#deck do

		print(deck[i],1,(i*8)-7,0)

	end

	-- print the row/column of the next card to be placed,
	-- the x,y value of its position on the board, and the
	-- face value of the card already at that position
	print(coord,17,1,12)
	print(xprint,25,1,14)
	print(yprint,33,1,12)
	print(board[x][y].face,41,1,14)

	-- print the rows/columns that contained a card that moved
	-- and the previous rows/columns
	for i=1,#moved do

		print(moved[i],9,(i*8),0)
		print(prevmoved[i],17,(i*8),0)

	end

	for i=1,#topcard do

		print(topcard[i],25,(i*8),0)

	end

	for i=1,#bonusdeck do

		print(bonusdeck[i],33,(i*8),0)

	end

	--rect(63,0,64,8,8)
	--rect(63,63,64,64,8)
end
