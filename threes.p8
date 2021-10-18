pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
#include lua\gameloop.lua
#include lua\initialize.lua
#include lua\draw.lua
#include lua\cards.lua
#include lua\input.lua
#include lua\move.lua
#include lua\sound.lua


__gfx__
000000007777777766666666bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
000000007777777766666666bbbcccccccccccbbbbb88888888888bbbbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
007007007777777766666666bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
000770007777777766666666bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
000770007777777766666666bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
007007007777777766666666bbccccc77ccccccbbb8888877788888bbb7777700077777bbb7777707777777bbb7770077000777bbb7770007070777b00000000
000000007777777766666666bbcccccc7ccccccbbb8888888788888bbb7777777077777bbb7777707777777bbb7777077770777bbb7777707070777b00000000
000000007777777766666666bbcccccc7ccccccbbb8888877788888bbb7777700077777bbb7777700077777bbb7777077000777bbb7770007000777b00000000
000000000000000067777777bbcccccc7ccccccbbb8888878888888bbb7777777077777bbb7777707077777bbb7777077077777bbb7770777770777b00000000
000000000000000067777777bbccccc777cccccbbb8888877788888bbb7777700077777bbb7777700077777bbb7770007000777bbb7770007770777b00000000
000000000000000067777777bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
000000000000000067777777bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
000000000000000067777777bbcccccccccccccbbb8888888888888bbb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
000000000000000067777777bbacccccccccccabbba88888888888abbba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
000000000000000067777777bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
000000000000000067777777bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000766666666666666666666667000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000776666666666666666666677000000000000000000000000bbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
00000000777777777777777777777777000000000000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777000000000000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777000000000000000000000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777000000000000000000000000bb7770707000777bbb7770007077777bbb7007700070007bbb7000700070707b00000000
00000000777777777777777777777777000000000000000000000000bb7770707070777bbb7770707077777bbb7707707077707bbb7770707070707b00000000
00000000777777777777777777777777000000000000000000000000bb7770007000777bbb7770007000777bbb7707700070007bbb7000700070007b00000000
00000000777777777777777777777777766666666666666600000000bb7777707070777bbb7777707070777bbb7707777070777bbb7770707077707b00000000
00000000777777777777777777777777776666666666666700000000bb7777707000777bbb7777707000777bbb7000777070007bbb7000700077707b00000000
00000000777777777777777777777777777777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777777777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
00000000777777777777777777777777777777777777777700000000bb7777777777777bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0000000077dddddddddddddddddddd77dddddddddddddddd00000000bba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
000000007d66666666666666666666d7666666666666666600000000bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
00000000d6666666666666666666666d666666666666666600000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000066666666666666666666666666666666bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000066ddddddddddd6666ddddddddddd6666bbb77777777777bbbbb77777777777bbbbb77777777777bbbbb77777777777bb00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7770077000777bbb7770007000777bbb7770777007777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7777077077777bbb7777707070777bbb7770777707777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7777077000777bbb7770007070777bbb7770007707777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7000707770007bbb7777077770777bbb7777707070777bbb7770707707777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7770707770707bbb7770007000777bbb7770007000777bbb7770007000777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7770700070007bbb7777777777777bbb7777777777777bbb7777777777777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7770707070707bbb7770007077777bbb7770007000777bbb7770707070777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7770700070007bbb7777707077777bbb7777707770777bbb7770707070777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7770007000777bbb7777707000777bbb7770007000777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7777707070777bbb7777707077777bbb7777707770777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bb7777777777777bbb7770007000777bbb7777707000777bbb7777707770777b00000000
0000000000000000000000006ddddddddddddd66ddddddddddddd666bba77777777777abbba77777777777abbba77777777777abbba77777777777ab00000000
00000000000000000000000066ddddddddddd6666ddddddddddd6666bbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabbbbbaaaaaaaaaaabb00000000
00000000000000000000000066666666666666666666666666666666bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
00000000000000000000000066666666666666666666666666666666bbbbbbbbbbbbbbbbbb5555555555555b0000000000000000b8888bbbbbccccbb00000000
0000000000000000000000006666ddddddddddd6666ddddddddddd66bbb77777777777bbb55bbbbbbbbbbb550000000000000000888888bbbccccccb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bb7777777777777bb5bbbbbbbbbbbbb50000000000000000888888bbbccccccb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bb777777a777777bb5bbbbbbbbbbbbb50000000000000000888888bbbccccccb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bb77777aaa77777bb5bbbbbbbbbbbbb50000000000000000888888bbbccccccb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bb77777a7a77777bb5bbbbbbbbbbbbb50000000000000000888888bbbccccccb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bba777aaaaa777abb5bbbbbbbbbbbbb50000000000000000a8888abbbaccccab00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bbaa777777777aabb5bbbbbbbbbbbbb50000000000000000baaaabbbbbaaaabb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bbaaaaa777aaaaabb5bbbbbbbbbbbbb50000000000000000b7777bbbb8b8b8bb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bba000a777a000abb5bbbbbbbbbbbbb50000000000000000777777bbbb8b8b8b00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bba070aa7aa070abb5bbbbbbbbbbbbb50000000000000000777777bbbbbbbbbb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bba000aaaaa000abb5bbbbbbbbbbbbb50000000000000000777777bbbbbbbbbb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bbaaaaa000aaaaabb5bbbbbbbbbbbbb50000000000000000777777bbbbbbbbbb00000000
000000000000000000000000666ddddddddddddd66ddddddddddddd6bbaaaaaa0aaaaaabb5bbbbbbbbbbbbb50000000000000000777777bbbbbbbbbb00000000
0000000000000000000000006666ddddddddddd6666ddddddddddd66bbbaaaaaaaaaaabbb55bbbbbbbbbbb550000000000000000a7777abbbbbbbbbb00000000
00000000000000000000000066666666666666666666666666666666bbbbbbbbbbbbbbbbbb5555555555555b0000000000000000baaaabbbbbbbbbbb00000000
__label__
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666777777777776667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777700077777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777077777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777700077777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777077777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777700077777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777667777777777777667777777777777777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777766a77777777777a667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666aaaaaaaaaaa6667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777666666666666666667777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777766666666666666677777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777776666666666666777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
7777777777777777777777777777777777dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd7777777777777777777777777777777777
777777777777777777777777777777777d666666666666666666666666666666666666666666666666666666666666d777777777777777777777777777777777
77777777777777777777777777777777d66666666666666666666666666666666666666666666666666666666666666d77777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
777777777777777777777777777777776666888888888886666ddddddddddd6666777777777776666ccccccccccc666677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666888887778888866ddddddddddddd66777770007777766ccccc77cccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888878888866ddddddddddddd66777777707777766cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666888887778888866ddddddddddddd66777770007777766cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666888887888888866ddddddddddddd66777777707777766cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666888887778888866ddddddddddddd66777770007777766ccccc777ccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666888888888888866ddddddddddddd66777777777777766ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666a88888888888a66ddddddddddddd66a77777777777a66accccccccccca66677777777777777777777777777777777
777777777777777777777777777777776666aaaaaaaaaaa6666ddddddddddd6666aaaaaaaaaaa6666aaaaaaaaaaa666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
777777777777777777777777777777776666ddddddddddd6666ddddddddddd6666ddddddddddd666677777777777666677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777770007777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777707777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777770007777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777707777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777770007777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66777777777777766677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66ddddddddddddd66ddddddddddddd66a77777777777a66677777777777777777777777777777777
777777777777777777777777777777776666ddddddddddd6666ddddddddddd6666ddddddddddd6666aaaaaaaaaaa666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
777777777777777777777777777777776666777777777776666888888888886666ccccccccccc6666ccccccccccc666677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666777770007777766888887778888866ccccc77cccccc66ccccc77cccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777707777766888888878888866cccccc7cccccc66cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666777770007777766888887778888866cccccc7cccccc66cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777707777766888887888888866cccccc7cccccc66cccccc7cccccc66677777777777777777777777777777777
77777777777777777777777777777777666777770007777766888887778888866ccccc777ccccc66ccccc777ccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666777777777777766888888888888866ccccccccccccc66ccccccccccccc66677777777777777777777777777777777
77777777777777777777777777777777666a77777777777a66a88888888888a66accccccccccca66accccccccccca66677777777777777777777777777777777
777777777777777777777777777777776666aaaaaaaaaaa6666aaaaaaaaaaa6666aaaaaaaaaaa6666aaaaaaaaaaa666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
777777777777777777777777777777776666ddddddddddd6666888888888886666ddddddddddd6666ddddddddddd666677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888887778888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888878888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888887778888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888887888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888887778888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66888888888888866ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
77777777777777777777777777777777666ddddddddddddd66a88888888888a66ddddddddddddd66ddddddddddddd66677777777777777777777777777777777
777777777777777777777777777777776666ddddddddddd6666aaaaaaaaaaa6666ddddddddddd6666ddddddddddd666677777777777777777777777777777777
77777777777777777777777777777777666666666666666666666666666666666666666666666666666666666666666677777777777777777777777777777777
77777777777777777777777777777777766666666666666666666666666666666666666666666666666666666666666777777777777777777777777777777777
77777777777777777777777777777777776666666666666666666666666666666666666666666666666666666666667777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777777777777777777777777777777b777777777777777777777777777777777777777777777
777777777777777777777777777777777777777777777777777777777777777777777777777777777bbb77777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777bbbbb7777777777777777777777777777777777777777777
777777777777777777777777777777777777777777777777777777777777777777777777777777777bbb77777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777777777777777777777777777777b777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777

__map__
0101010101010102021201010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010102021201010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010102021201010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010131323234353232330101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010163646566434445460101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010173747576535455560101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010163646566434445460101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010173747576535455560101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010163646566434445460101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010173747576535455560101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010163646566434445460101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010173747576535455560101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010121222222222222230101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01010f000c6140e6210f62110621126311464116641186511a6511c6611e671216711f661196410d6251b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b00000000
01010f00246142662127621286212a6312c6412e64130651326513466136671396713766131641256251b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b0001b00000000
011200000b0000b0000b0000b0000b0000b0000000000000000000c0000c0000c0000c0000c0000c0000c0000c000000000000000000000000000000000000000000000000000000000000000000000000000000
01090000000000000000000000000000000000000000000000000280002b000300000000000000180000000000000000001800000000000000000000000000002b0002f000320003700000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0112000000000000000c0000c0000c0000c0000c0000c0000c0000c0000f0000f0000f0000f0000f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010900000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01120c000c5540c5520c5520c5520c5520c5520c5520c5520c5550c5020c5020b5020b5000b5000b5000b5000b5000b5000b5000b5000b5000050000500005000c5000c5000c5000c5000c5000c5000c5000c500
01120c000b5540b5520b5520b5520b5520b5520b5520b5520b555005000e5000e5000f5000f5000f5000f5000f5000f5000f5000f5000f5000050000500005000050000500005000050000500005000050000500
01120c000c5540c5520c5520c5520c5520c5520c5520c5520c5550e5540e5520e5550f5000f5000f5000f5000f5000f5000f5000f5000f5000050000500005000050000500005000050000500005000050000500
01120c000f5540f5520f5520f5520f5520f5520f5520f5520f5550050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
01120c001155411552115521155211552115521155211552115550c5000c500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
01120c000e5540e5520e5520e5520e5520e5520e5520e5520e5550c5000c50000500005000050000500005000e5000e5000e50000500005000050000500005000050000500005000050000500005000050000500
011000000e5000e5000e5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01091800000000000000000000000000000000000000000000000280002b05230052330523705200000180000000000000000001800000000000000000000000000002b0002f0003200037000000000000000000
0109180000000000002b0002f0003200037000000000000000000000002b0522f05232052370520000000000000000000000000000000000000000000000000000000000002b0003000033000370000000200002
01091800000000000000000000000000000000000000000000000000002e05233052370523a052000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0109180000000000000000000000000000000000000000000000028000300523505238052180000000000000000001800000000000000000000000000002b0002f00032000370000000000000000000000000000
01091800000000000000000000000000000000000000000000000280002e0523305237052180000000000000000001800000000000000000000000000002b0002f00032000370000000000000000000000000000
010918000000000000000000000000000000000000000000000002800026052290522b052370520000000000000001800000000000000000000000000002b0002f00032000370000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01120c00185541855218552185521855218552185521855218555185021850223502235000b5000b5000b5000b5000b5000b5000b5000b5000050000500005000c5000c5000c5000c5000c5000c5000c5000c500
01120c001755417552175521755217552175521755217552175550c5000e5000e5000f5000f5000f5000f5000f5000f5000f5000f5000f5000050000500005000050000500005000050000500005000050000500
01120c001855418552185521855218552185521855218552185551a5541a5521a5551b5001b5001b5001b5001b5001b5001b5001b5000f5000050000500005000050000500005000050000500005000050000500
01120c001b5541b5521b5521b5521b5521b5521b5521b5521b5551850018500185001850018500185001850000500005000050000500005000050000500005000050000500005000050000500005000050000500
01120c001d5541d5521d5521d5521d5521d5521d5521d5521d5550050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
01120c001a5541a5521a5521a5521a5521a5521a5521a5521a555185541855218555005000050000500005000e5000e5000e50000500005000050000500005000050000500005000050000500005000050000500
__music__
01 10081844
00 11091944
00 100a1a44
00 120b1b44
00 130c1c44
00 140b1b44
00 150d1d44
02 11091944

