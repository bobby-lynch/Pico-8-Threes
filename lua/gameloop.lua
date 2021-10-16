
-- runs once at start to
-- initialize values
function _init()

	initialize()

end

-- updates values every frame
function _update()

	handleinput()

	setslide()

	placecard()

end

-- clears screen and draws the
-- board each frame
function _draw()

		cls()
		map(0,0,0,0,128,32)

		drawpreview()

		drawcards()
		
		--displayinfo()

		-- print cursor to screen
		print("◆",mouse.x,mouse.y,11)

end
