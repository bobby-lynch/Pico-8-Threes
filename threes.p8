pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- initializegame()

-- set values for the board and
-- cards to their default values
function initializegame()

		-- initialize board positions
 board = {}
	
	for i=1,4 do
	
		board[i] = {}
		
		for j=1,4 do
			
			board[i][j] = {face=0,move=0,nextface=0}
		
		end
	
	end
	
	-- initialize set of cards and
	-- empty deck
	cards = {1,1,1,1,2,2,2,2,3,3,3,3}
	deck = {}
	
	-- face value of card on top of deck
	topcard = {0}
	
	-- face value of next card
	nextcard = 0
	
	-- total number of cards on
	-- the board
	cardtotal = 0
	
	-- number of cards to be drawn and placed on the board
	queue = 9
	
	slide = {x=0,y=0}
	
	-- the rows or columns that had
	-- cards that moved
	moved = {}

	move = false
	
end
-->8

-->8
-- _init() game loop

-- runs once at start to
-- initialize values
function _init()

	poke(0x5f2d,0x01)

	palt(11,true)
	palt(0,false)
	
	cls()
	
	pos = {x=0,y=0}
	
	change = pos
	
	click = false
	
	angle = 0
	
	direction = "none"
	
	-- x,y coordinates of sprites
	-- indexed by face value
	sprite = {
	[0]={x=8,y=0},
	[1]={x=24,y=0},[2]={x=40,y=0},
	[3]={x=56,y=0},[6]={x=72,y=0},
	[12]={x=88,y=0},[24]={x=104,y=0},
	[48]={x=56,y=16},[96]={x=72,y=16},
	[192]={x=88,y=16},[384]={x=104,y=16},
	[768]={x=56,y=32},[1536]={x=72,y=32},
	[3072]={x=88,y=32},[6144]={x=104,y=32},
	[12244]={x=56,y=48}
	}
	
	initializegame()
	
end
-->8
-- _update() game loop

-- updates values every frame
function _update()

	handleinput()
	
	setslide()
	
	-- select a card from the deck if ready
	if (queue > 0) then
	
		nextcard = topcard[1]
		drawcard()
			
		queue -= 1
		
		if (move == true) then
			
			if (direction == "⬆️") then
				
				x = 4
				y = moved[(rnd(#moved)\1)+1]
				
			elseif (direction == "⬅️") then
			
				x = moved[(rnd(#moved)\1)+1]
				y = 4
				
			elseif (direction == "⬇️") then
			
				x = 1
				y = moved[(rnd(#moved)\1)+1]
			
			elseif (direction == "➡️") then
			
				x = moved[(rnd(#moved)\1)+1]
				y = 1
				
			end
			
			move = false
			direction = "none"
			
			for i=1,4 do
			
				deli(moved,i)
				
			end
		
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
		
	end
	
end


-->8
-- _draw() game loop

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
		print(angle,112,12,12)
		print("◆",mouse.x,mouse.y,11)
		
		for i=1,#deck do
		
			print(deck[i],1,(i*8)-7,0)
		
		end
		
		print(#moved,9,1,0)
		
		for i=1,#moved+1 do
			
			print(moved[i],9,(i*8),0)
			
		end
	
end
-->8
-- handleinput()

-- read input stats and process
-- input related data
function handleinput()

	-- reset if x is clicked
	if btn(5) then
	
		initializegame()
		
	end

	-- gets current mouse position
	mouse = {x=stat(32),y=stat(33)}
	
	-- checks if left mouse button
	-- is being pressed
	if (stat(34) == 1) then
		
		-- set position of mouse when
		-- the left mouse button is
		-- initially clicked
		if click ~= true then
		
			click = true
			pos = mouse
			
		end
		
		-- set the change in x and y
		-- of the mouse button from
		-- the click until now
		change.x = mouse.x - pos.x
		change.y = mouse.y - pos.y
		
		-- get local angle based on
		-- change in position
		angle = atan2(change.x,change.y)
		
		-- set direction of the mouse
		-- and check which cards can
		-- move when there is a swipe
		if (direction == "none") then
			
			if (abs(change.x) > 4 or abs(change.y) > 4) then
				
				setdirection()
				checkmoves()

			end
			
		end
	
	else
		
		-- reset click when left mouse
		-- button is released
		if click then
		
		 -- make a move if there has
		 -- been a swipe
			if (abs(slide.x) > 4 or abs(slide.y) > 4) then
				
				completemove()
			
			-- cancel move if mouse
			-- returns to original
			-- position
			else
				
				resetmove()

			end
		
			click = false
			direction = "none"
			
		end
		
	end	

end
-->8
-- drawcard()

-- removes card from deck and
-- returns its face value
function drawcard()
	
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

-->8
-- setdirection()

-- given the local angle, finds
-- the direction of the mouse
function setdirection()

	prevdirection = direction
	
	if (angle >= 0.125 and angle < 0.375) then
	
		direction = "⬆️"
		
	elseif (angle >= 0.375 and angle < 0.625) then
		
		direction = "⬅️"
		
	elseif (angle >= 0.625 and angle < 0.875) then
	
		direction = "⬇️"
		
	elseif (angle < 0.125 or angle >= 0.875) then
	
		direction = "➡️"
		
	end
	
end
-->8
-- checkmoves()

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
-->8
-- setslide()

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
-->8
-- completemove()

--
function completemove()

	for i=1,4 do
		
		for j=1,4 do
		
			if board[i][j].move == 1 then
				
				move = true
				
				if (direction == "⬆️" or direction == "⬇️") then
					
					del(moved,i)
					add(moved,i)
			
				elseif (direction == "⬅️" or direction == "➡️") then
				
					del(moved,j)
					add(moved,j)
				
				end
				
			end
	
			board[i][j].face = board[i][j].nextface
			board[i][j].move = 0
		
		end
	
	end
	
	if move then
	
		queue += 1
		
	end

end
-->8
-- resetmove()

--
function resetmove()

	for i=1,4 do
		
		for j=1,4 do
	
			board[i][j].move = 0
			board[i][j].nextface = board[i][j].face
		
		end
	
	end

end
__gfx__
000000006666666666666666bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000666ddddddddddd66bbbcccccccccccbbbbb88888888888bbbbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
0070070066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0007700066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0007700066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0070070066ddddddddddddd6bbccccc77ccccccbbb8888877788888bbb7777700077777bbb7777707777777bbb7770077000777bbb7770007070777b00000000
0000000066ddddddddddddd6bbcccccc7ccccccbbb8888888788888bbb7777777077777bbb7777707777777bbb7777077770777bbb7777707070777b00000000
0000000066ddddddddddddd6bbcccccc7ccccccbbb8888877788888bbb7777700077777bbb7777700077777bbb7777077000777bbb7770007000777b00000000
0000000066ddddddddddddd6bbcccccc7ccccccbbb8888878888888bbb7777777077777bbb7777707077777bbb7777077077777bbb7770777770777b00000000
0000000066ddddddddddddd6bbccccc777cccccbbb8888877788888bbb7777700077777bbb7777700077777bbb7770007000777bbb7770007770777b00000000
0000000066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0000000066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0000000066ddddddddddddd6bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0000000066ddddddddddddd6bbacccccccccccabbba88888888888abbba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
00000000666ddddddddddd66bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
000000006666666666666666bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000666777777777776666666666666777777777777700000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000667777777777777666666666666777777777777700000000bbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
00000000677777777777777766666666666777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777666777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777666777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777666777777777777700000000bb7770707000777bbb7770007077777bbb7007700070007bbb7000700070707b00000000
00000000777777777777777777777777666777777777777700000000bb7770707070777bbb7770707077777bbb7707707077707bbb7770707070707b00000000
00000000777777777777777777777777666777777777777700000000bb7770007000777bbb7770007000777bbb7707700070007bbb7000700070007b00000000
00000000777777777777777777777766777777770000000000000000bb7777707070777bbb7777707070777bbb7707777070777bbb7770707077707b00000000
00000000777777777777777777777766777777770000000000000000bb7777707000777bbb7777707000777bbb7000777070007bbb7000700077707b00000000
00000000777777777777777777777766777777770000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777766777777770000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777766777777770000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000d77777777777777777777766dddddddd0000000000000000bba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
000000006d7777777777777d77777766666666660000000000000000bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
00000000666777777777776677777766666666660000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7770077000777bbb7770007000777bbb7770777007777b00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7777077077777bbb7777707070777bbb7770777707777b00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7777077000777bbb7770007070777bbb7770007707777b00000000
00000000000000000000000000000000000000000000000000000000bb7000707770007bbb7777077770777bbb7777707070777bbb7770707707777b00000000
00000000000000000000000000000000000000000000000000000000bb7770707770707bbb7770007000777bbb7770007000777bbb7770007000777b00000000
00000000000000000000000000000000000000000000000000000000bb7770700070007bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000000000000000000000000000000000000000000000000000bb7770707070707bbb7770007077777bbb7770007000777bbb7770707070777b00000000
00000000000000000000000000000000000000000000000000000000bb7770700070007bbb7777707077777bbb7777707770777bbb7770707070777b00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7770007000777bbb7777707000777bbb7770007000777b00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7777707070777bbb7777707077777bbb7777707770777b00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777bbb7770007000777bbb7777707000777bbb7777707770777b00000000
00000000000000000000000000000000000000000000000000000000bba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
00000000000000000000000000000000000000000000000000000000bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb00000000000000000000000000000000b8888bbbbbccccbb00000000
00000000000000000000000000000000000000000000000000000000bbb77777777777bb00000000000000000000000000000000888888bbbccccccb00000000
00000000000000000000000000000000000000000000000000000000bb7777777777777b00000000000000000000000000000000888888bbbccccccb00000000
00000000000000000000000000000000000000000000000000000000bb777777a777777b00000000000000000000000000000000888888bbbccccccb00000000
00000000000000000000000000000000000000000000000000000000bb77777aaa77777b00000000000000000000000000000000888888bbbccccccb00000000
00000000000000000000000000000000000000000000000000000000bb77777a7a77777b00000000000000000000000000000000888888bbbccccccb00000000
00000000000000000000000000000000000000000000000000000000bba777aaaaa777ab00000000000000000000000000000000a8888abbbaccccab00000000
00000000000000000000000000000000000000000000000000000000bbaa777777777aab00000000000000000000000000000000baaaabbbbbaaaabb00000000
00000000000000000000000000000000000000000000000000000000bbaaaaa777aaaaab00000000000000000000000000000000b7777bbbb8b8b8bb00000000
00000000000000000000000000000000000000000000000000000000bba000a777a000ab00000000000000000000000000000000777777bbbb8b8b8b00000000
00000000000000000000000000000000000000000000000000000000bba070aa7aa070ab00000000000000000000000000000000777777bbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bba000aaaaa000ab00000000000000000000000000000000777777bbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbaaaaa000aaaaab00000000000000000000000000000000777777bbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbaaaaaa0aaaaaab00000000000000000000000000000000777777bbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbbaaaaaaaaaaabb00000000000000000000000000000000a7777abbbbbbbbbb00000000
00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb00000000000000000000000000000000baaaabbbbbbbbbbb00000000
__map__
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253234343434343434343125252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253301020102010201022425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253311121112111211122425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253301020102010201022425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253311121112111211122425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253301020102010201022425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253311121112111211122425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253301020102010201022425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525253311121112111211122425252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252223232323232323232125252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2525252525252525252525252525252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
