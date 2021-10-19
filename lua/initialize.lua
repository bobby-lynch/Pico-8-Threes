
--initialize general game settings
--and reset the game's values
function initialize()

    poke(0x5f2d,0x01)

	palt(11,true)
	palt(0,false)

	cls()

    playmusic()

	pos = {x=0,y=0}

	change = pos

	click = false

	angle = 0

	direction = "none"
    prevdirection = direction

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

    position = {
        [1]={x=33,y=32},[2]={x=48,y=48},[3]={x=63,y=64},[4]={x=78,y=80}
    }

    resetgame()

end

-- set values for the board and
-- cards to their default values
function resetgame()

	-- initialize board positions
    board = {}

	for i=1,4 do

		board[i] = {}

		for j=1,4 do

			board[i][j] = {face=0,move=0,nextface=0}

		end

	end

	-- initialize set of cards, bonus deck,
	-- and empty deck
	cards = {1,1,1,1,2,2,2,2,3,3,3,3}
	deck = {}
    bonusdeck = {}

    -- highest card divided by 8
    highestcard = 3
    --randnum = 21

	-- face value of card on top of deck
	topcard = {0}

	-- face value of next card
	nextcard = 0

	-- total number of cards on
	-- the board
	cardtotal = 0

	-- number of cards to be drawn and placed on the board
	queue = 10

	slide = {x=0,y=0}

	-- the rows or columns that had
	-- cards that moved
	moved = {0,0,0,0}
    -- previous moved rows/columns
    -- just for testing
    prevmoved = {0,0,0,0}

	move = false

end
