
Play(page, map, diff, upper, mode) {
	SelectMap(page, map, diff, upper, mode)
	
	halfcash := 0
	
	if (diff == 2 && upper == 1 && mode == 3) {
		halfcash := 1
	}
	
	Farm(halfcash)
	
	if (diff == 2 && upper == 1 && mode == 1) { 		; Magic monkey only
		PlaceWizardParagon()
	}
	else if (diff == 0 && upper == 1 && mode == 1) {	; Primary Only 
		PlaceDartParagon()
	}
	else if (diff == 2 && upper == 0 && mode == 2) {	; Impoppable
		PlaceWizardParagon()
		PlaceDartParagon()
	}
	else {
		PlaceAce()
		PlaceSniper()
	}
	
	
	if (diff == 1 && upper == 1 && mode == 2) {
	}
	else {
		Send("{Space}")                 ; Start game
	}
    Sleep(1000)
    Send("{Space}")                 ; Increase Speed

    Loop {   					; Auto Click To Clear Level Ups
        lose := PixelGetColor(968, 330)
		win := PixelGetColor(1029, 161)

        if (lose == "0xFF4300") {
			Loop {
				Sleep(1000000)
			}
		
		    ClickAndWait(650, 800, 5000)   ; Home
            return
        }
		if (win == "0xFFF700") {
			Sleep(1000)
			break
		}
    
        ClickAndWait(1450, 15, 950)
    }

    ClickAndWait(955, 905, 2000)   ; Next 
    ClickAndWait(712, 840, 5000)   ; Home
	
	HandleCollectionEvent()
}


PlaceWizardParagon() {
	coords := FindFreeSpot("u")
	Deploy("a", coords.x, coords.y, 0, 0, 5)
	
	coords := FindFreeSpot("u")
	Deploy("a", coords.x, coords.y, 5, 0, 0)
	
	coords := FindFreeSpot("u")
	Deploy("a", coords.x, coords.y, 0, 5, 0)
	
	ClickAndWait(coords.x, coords.y, 500)
	Send(".")
	Sleep(500)
	ClickAndWait(1150, 850, 500)
}


PlaceDartParagon() {
	coords := FindFreeSpot("q")
	Deploy("q", coords.x, coords.y, 0, 0, 5)
	
	coords := FindFreeSpot("q")
	Deploy("q", coords.x, coords.y, 5, 0, 0)
	
	coords := FindFreeSpot("q")
	Deploy("q", coords.x, coords.y, 0, 5, 0)
	
	ClickAndWait(coords.x, coords.y, 500)
	Send(".")
	Sleep(500)
	ClickAndWait(1150, 850, 500)
}

PlaceAceParagon() {
	coords := FindFreeSpot("v")
	Deploy("v", coords.x, coords.y, 0, 0, 5)
	
	coords := FindFreeSpot("v")
	Deploy("v", coords.x, coords.y, 5, 0, 0)
	
	coords := FindFreeSpot("v")
	Deploy("v", coords.x, coords.y, 0, 5, 0)
	
	ClickAndWait(coords.x, coords.y, 500)
	Send(".")
	Sleep(500)
	ClickAndWait(1150, 850, 500)
}

PlaceAce() {
	coords := FindFreeSpot("v")
	Deploy("v", coords.x, coords.y, 0, 2, 5)
}


PlaceSniper() {
	coords := FindFreeSpot("q")
	Deploy("z", coords.x, coords.y, 0, 2, 5)
}


SelectMap(page, map, diff, upper, mode) {
    ClickAndWait(800, 900, 1000)   	; Play
    ClickAndWait(850, 950, 500)   	; Intermediate
    ClickAndWait(600, 950, 500)  	; Beginner

    Loop page {						; Next Page
        ClickAndWait(1650, 430, 300)   
    }

    ClickAndWait(550 + 400 * Mod(map, 3), 300 * ((map // 3) + 1), 2000)   	; Click Map
	
    ClickAndWait(650 + diff * 300, 400, 3000)   							; Click Difficulty
	
    ClickAndWait(650 + mode * 300, 700 - upper * 300, 6000)   				; Click Mode
	
    ClickAndWait(980, 760, 2000)   											; Ok Button
}

HandleCollectionEvent() {
    Sleep(3000)

    color := PixelGetColor(100, 100)
	color2 := PixelGetColor(104, 125)

    if (color = "0x1B361F" || color == "0x1F361B" || color == "0x20381C") {
        ClickAndWait(950, 700, 3000)   	; Collect
        
        ClickAndWait(800, 550, 1000)   	; Left1
        ClickAndWait(800, 550, 2000)   	; Left1

        ClickAndWait(1100, 550, 1000)   ; Right1
        ClickAndWait(1100, 550, 2000)   ; Right1

        ClickAndWait(650, 550, 1000)   	; Left2
        ClickAndWait(650, 550, 2000)   	; Left2

        ClickAndWait(950, 550, 1000)   	; Middle
        ClickAndWait(950, 550, 2000)   	; Middle
        
        ClickAndWait(1250, 550, 1000)   ; Right2
        ClickAndWait(1250, 550, 2000)   ; Right2
    
        ClickAndWait(950, 1000, 2000)   ; Continue
        Send("{Escape}")
    }
    Sleep(1000)
}


FindFreeSpot(key) {
    Send(key)

    minX := 100, maxX := 1500
    minY := 100, maxY := 1000
		
    while (true) {
        x := Random(minX, maxX)
        y := Random(minY, maxY)

        MouseMove(x, y)
        Sleep(300)

        color := PixelGetColor(x, y)
		color2 := PixelGetColor(x, y - 42)
		color3 := PixelGetColor(x + 38, y - 52)

        if (color == "0xFFFFFF" || color == "0xB19B8B" || color2 == "0xFFFFFF" || color3 == "0xFFFFFF") {
			Send("{Escape}")
			Sleep(500)
            return {x: x, y: y}  ; Return the coordinates as an object
        }
    }
}

Farm(halfcash) {
	if (halfcash == 1) {
		coordsDart := FindFreeSpot("q")
		
		Deploy("q", coordsDart.x, coordsDart.y, 2, 0, 0)
		ClickAndWait(coordsDart.x, coordsDart.y, 500)
		Send("{Backspace}")
		Sleep(300)
		
		Deploy("q", coordsDart.x, coordsDart.y, 2, 0, 0)
		ClickAndWait(coordsDart.x, coordsDart.y, 500)
		Send("{Backspace}")
		Sleep(300)
	}
	
	coordsQuincy := FindFreeSpot("u")
	
	Loop 5 {
		Deploy("u", coordsQuincy.x, coordsQuincy.y, 10, 0, 0)
		ClickAndWait(coordsQuincy.x, coordsQuincy.y, 500)
		Send("{Backspace}")
		Sleep(300)
	}
	
	Loop 7 {
		Deploy("u", coordsQuincy.x, coordsQuincy.y, 20, 0, 0)
		ClickAndWait(coordsQuincy.x, coordsQuincy.y, 500)
		Send("{Backspace}")
		Sleep(300)
	}
	
	Sleep(1000)
	
}

ClickAndWait(x, y, delay) {
	MouseMove(x, y)
	Sleep(50)
    Click(x, y)
    Sleep(delay)
}

Deploy(key, x, y, a, b, c) {
    Send(key)
    ClickAndWait(x, y, 500)
    ClickAndWait(x, y, 500)

    Loop a {
        Send(",")
        Sleep(50)
    }
    Loop b {
        Send(".")
        Sleep(50)
    }
    Loop c {
        Send("/")
        Sleep(50)
    }
	Sleep(300)
	Send("{Escape}")
    Sleep(500)
}
