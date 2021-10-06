
-- read input stats and process
-- input related data
function handleinput()

	-- reset if x is clicked
	if btn(5) then

		resetgame()

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
