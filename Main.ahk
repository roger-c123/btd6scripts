; F8 to exit
; DO NOT TAB OUT

#Include C:\Users\roger\Desktop\BTD6_Scripts\CustomFunctions.ahk

WinActivate("BloonsTD6")
Sleep(700)

Loop {
	;Impoppable()
	Complete()
}


return
F8:: ExitApp()

Complete() {
	page := 1

	Loop 12
	{
		map := 0
		
		maxMaps := 6
		
		if (page == 3) {
			maxMaps := 4
		}
		if (page == 7) {
			maxMaps := 3
		}
		if (page == 10) {
			maxMaps := 4
		}
		
		
		Loop maxMaps
		{
			; Easy
			Play(page, map, 0, 0, 0)
			Play(page, map, 0, 1, 1)
			Play(page, map, 0, 1, 2)
		
		
		/*	; Medium
			Play(page, map, 1, 0, 0)
			Play(page, map, 1, 0, 1)			
			Play(page, map, 1, 1, 1)
			Play(page, map, 1, 1, 2)
		*/	
		
			; Hard
			Play(page, map, 2, 0, 0)
			Play(page, map, 2, 1, 1)
			Play(page, map, 2, 1, 2)
			Play(page, map, 2, 1, 3)
			Play(page, map, 2, 0, 1)
			Play(page, map, 2, 0, 2)


			map++
		}

		page++  ; Increment the counter
	}
}

Impoppable() {
	SelectMap(12, 3, 2, 0, 2)

    Farm(0)

    ClickAndWait(200, 200, 500)   ; Remove Trees
    ClickAndWait(950, 600, 500)   ; Remove Trees
    
    ClickAndWait(200, 400, 500)   ; Remove Trees
    ClickAndWait(950, 600, 500)   ; Remove Trees
    
    ClickAndWait(200, 700, 500)   ; Remove Trees
    ClickAndWait(950, 600, 500)   ; Remove Trees
    
    ClickAndWait(200, 900, 500)   ; Remove Trees
    ClickAndWait(950, 600, 500)   ; Remove Trees
    
    Deploy("s", 200, 550, 0, 5, 2)   ; Super AntiBloon
    Deploy("s", 200, 300, 0, 5, 2)   ; Super AntiBloon
    Deploy("s", 200, 800, 0, 5, 2)   ; Super AntiBloon
	
	PlaceAceParagon()

    Send("{Space}")                 ; Start game
    Sleep(500)
    Send("{Space}")                 ; Increase Speed

    Loop {   					; Auto Click To Clear Level Ups
        lose := PixelGetColor(968, 330)
		win := PixelGetColor(1029, 161)

        if (lose == "0xFF4300") {
		    ClickAndWait(650, 800, 5000)   ; Home
            return
        }
		if (win == "0xFFF700") {
			Sleep(1000)
			break
		}
    
        ClickAndWait(1450, 15, 950)
    }

    ClickAndWait(955, 905, 3000)   ; Next
    ClickAndWait(712, 840, 3000)   ; Home
	
	HandleCollectionEvent()
}

