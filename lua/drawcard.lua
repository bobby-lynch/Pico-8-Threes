
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
