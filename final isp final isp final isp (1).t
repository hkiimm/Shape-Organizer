%May 22, 2018
%Hannah Kim
%Ms. Krasteva
%This program will output a program where you have to organize five different size boxes in order from smallest to largest.

%Note to Ms. Krasteva : the music is in korean (titles are "so what" and "the truth untold" by bts)

%setscreen
import GUI
var mainWindow := Window.Open ("graphics:640;400;position:center;center")
setscreen ("offscreenonly")
setscreen ("noecho")
setscreen ("nocursor")

%forward procedure
forward procedure mainMenu
forward procedure instruction
forward procedure userInput
forward procedure display
forward procedure goodbye

%declaration section
var menu : int := GUI.CreateButton (260, 50, 125, "Main Menu", mainMenu)
var instructionButton : int := GUI.CreateButton (100, 200, 125, "Instructions", instruction)
var testButton : int := GUI.CreateButton (260, 200, 125, "Take Test", userInput)
var exitButton : int := GUI.CreateButton (415, 200, 125, "Exit", GUI.Quit)
var boxRandom : int
var mouseX, mouseY, button : int := 0
var smallSquare, secondSquare, mediumSquare, bigSquare, biggestSquare : int
var pictureID : int

%program title
procedure title
    %delaration
    cls
    locate (1, 33)
    put "Moving Boxes Test"
end title

%Procedure PauseProgram
procedure pauseProgram
    var reply : string (1)
    put " "
    put "Press any key to continue...." ..
    getch (reply)
end pauseProgram

%introduction music
process music
    Music.PlayFile ("thetruthuntold.mp3")
end music

%program introduction
procedure introduction
    title
    %music
    fork music
    locate (3, 13)
    put "Hi! You will be tested on your ability to order different"
    locate (4, 22)
    put "size objects from smallest to largest."
    GUI.Show (menu)
    %boxes moving across the screen
    for i : 1 .. 900
	%erase
	drawfillbox (0 + i, 89, -500 + i, 325, white)
	%smallest box
	drawfillbox (-5 + i, 125, -25 + i, 145, 87)
	%second smallest box
	drawfillbox (-60 + i, 200, -90 + i, 170, 66)
	%medium box
	drawfillbox (-220 + i, 260, -260 + i, 220, 82)
	%second largest box
	drawfillbox (-115 + i, 240, -165 + i, 290, 99)
	%largest box
	drawfillbox (-200 + i, 100, -140 + i, 160, 96)
	delay (5)
	View.Update
    end for
    %setscreen
    setscreen ("nooffscreenonly")
end introduction

%program main menu
body procedure mainMenu
    locate (8, 1)
    GUI.Disable (menu)
    title
    GUI.Enable (instructionButton)
    GUI.Enable (testButton)
    GUI.Enable (exitButton)
    GUI.Show (instructionButton)
    GUI.Show (testButton)
    GUI.Show (exitButton)
end mainMenu

%program instruction
body procedure instruction
    var instructionWindow := Window.Open ("graphics:500;400;position: 600;400")
    Window.Show (instructionWindow)
    colorback (90)
    cls
    locate (1, 27)
    put "Instructions"
    locate (3, 1)
    put "1. Once you start your test, there will be five different"
    put "   size boxes displayed at the top of the screen."
    locate (6, 1)
    put "2. Your goal is to order the boxes from the"
    put "   smallest size to the largest size."
    locate (9, 1)
    put "3. To move a box , you click the box you would like to move, "
    put "   and then click the box you would like to move it into."
    locate (12, 1)
    put "4. After you have finished moving all the boxes,"
    put "   click done to get your results."
    locate (16, 1)
    put "** WARNING"
    locate (18, 1)
    put "** You will not be able to press done and get your results,"
    put "   until you have finished moving all the boxes into the"
    put "   designated spaces below."
    pauseProgram
    Window.Close (instructionWindow)
end instruction

%program user input
body procedure userInput
    GUI.Disable (instructionButton)
    GUI.Disable (testButton)
    GUI.Disable (exitButton)
    title

    %stop music
    Music.PlayFileStop

    %declaration
    var smallest, secondSmallest, medium, secondBiggest, biggest : boolean := true
    var boxA, boxB, boxC, boxD, boxE : boolean := false
    var font := Font.New ("Calibri:13")
    var complete : boolean := true

    %initial values
    smallSquare := 0
    secondSquare := 0
    mediumSquare := 0
    bigSquare := 0
    biggestSquare := 0

    %randomization of box orders (preset)
    randint (boxRandom, 1, 4)

    %done button
    drawfillbox (620, 20, 495, 40, 29)
    %done writing
    Font.Draw ("Done", 540, 25, font, 20)

    %boxes the objects have to move into
    %furthest left
    drawbox (50, 70, 130, 150, black)
    %furthest right
    drawbox (590, 70, 510, 150, black)
    %middle
    drawbox (280, 70, 360, 150, black)
    %left
    drawbox (165, 70, 245, 150, black)
    %right
    drawbox (395, 70, 475, 150, black)

    %text message at the top of the screen
    locate (3, 20)
    put "Remember to order from smallest to largest!"

    %first random option
    if boxRandom = 1 then
	%moving boxes
	%smallest box
	drawfillbox (40, 250, 60, 270, 82)
	%medium box
	drawfillbox (150, 240, 190, 280, 82)
	%largest box
	drawfillbox (280, 230, 340, 290, 82)
	%second smallest box
	drawfillbox (430, 245, 460, 275, 82)
	%second largest box
	drawfillbox (550, 235, 600, 285, 82)

	loop
	    %smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 40 and mouseX <= 60) and (mouseY >= 250 and mouseY <= 270) then
		    if smallest = true then
			%if user clicks on the box (colour changes)
			drawfillbox (40, 250, 60, 270, 81)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (80, 100, 100, 120, 82)
					boxA := true
					smallest := false
					smallSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (195, 100, 215, 120, 82)
					boxB := true
					smallest := false
					smallSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (310, 100, 330, 120, 82)
					boxC := true
					smallest := false
					smallSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (425, 100, 445, 120, 82)
					boxD := true
					smallest := false
					smallSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (540, 100, 560, 120, 82)
					boxE := true
					smallest := false
					smallSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second smallest square
	    %lop
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 430 and mouseX <= 460) and (mouseY >= 245 and mouseY <= 275) then
		    if secondSmallest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (430, 245, 460, 275, 81)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (430, 245, 460, 275, white)
					%draw new box
					drawfillbox (75, 95, 105, 125, 82)
					boxA := true
					secondSmallest := false
					secondSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (430, 245, 460, 275, white)
					%draw new box
					drawfillbox (190, 95, 220, 125, 82)
					boxB := true
					secondSmallest := false
					secondSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (430, 245, 460, 275, white)
					%draw new box
					drawfillbox (305, 95, 335, 125, 82)
					boxC := true
					secondSmallest := false
					secondSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (430, 245, 460, 275, white)
					%draw new box
					drawfillbox (420, 95, 450, 125, 82)
					boxD := true
					secondSmallest := false
					secondSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (430, 245, 460, 275, white)
					%draw new box
					drawfillbox (535, 95, 565, 125, 82)
					boxE := true
					secondSmallest := false
					secondSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %middle square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 150 and mouseX <= 190) and (mouseY >= 240 and mouseY <= 280) then
		    if medium = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (150, 240, 190, 280, 81)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (150, 240, 190, 280, white)
					%draw new box
					drawfillbox (70, 90, 110, 130, 82)
					boxA := true
					medium := false
					mediumSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (150, 240, 190, 280, white)
					%draw new box
					drawfillbox (185, 90, 225, 130, 82)
					boxB := true
					medium := false
					mediumSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (150, 240, 190, 280, white)
					%draw new box
					drawfillbox (300, 90, 340, 130, 82)
					boxC := true
					medium := false
					mediumSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (150, 240, 190, 280, white)
					%draw new box
					drawfillbox (415, 90, 455, 130, 82)
					boxD := true
					medium := false
					mediumSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (150, 240, 190, 280, white)
					%draw new box
					drawfillbox (530, 90, 570, 130, 82)
					boxE := true
					medium := false
					mediumSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 550 and mouseX <= 600) and (mouseY >= 235 and mouseY <= 285) then
		    if secondBiggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (550, 235, 600, 285, 81)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (550, 235, 600, 285, white)
					%draw new box
					drawfillbox (65, 85, 115, 135, 82)
					boxA := true
					secondBiggest := false
					bigSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (550, 235, 600, 285, white)
					%draw new box
					drawfillbox (180, 85, 230, 135, 82)
					boxB := true
					secondBiggest := false
					bigSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (550, 235, 600, 285, white)
					%draw new box
					drawfillbox (295, 85, 345, 135, 82)
					boxC := true
					secondBiggest := false
					bigSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (550, 235, 600, 285, white)
					%draw new box
					drawfillbox (410, 85, 460, 135, 82)
					boxD := true
					secondBiggest := false
					bigSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (550, 235, 600, 285, white)
					%draw new box
					drawfillbox (525, 85, 575, 135, 82)
					boxE := true
					secondBiggest := false
					bigSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if


	    %largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 280 and mouseX <= 340) and (mouseY >= 230 and mouseY <= 290) then
		    if biggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (280, 230, 340, 290, 81)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (280, 230, 340, 290, white)
					%draw new box
					drawfillbox (60, 80, 120, 140, 82)
					boxA := true
					biggest := false
					biggestSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (280, 230, 340, 290, white)
					%draw new box
					drawfillbox (175, 80, 235, 140, 82)
					boxB := true
					biggest := false
					biggestSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (280, 230, 340, 290, white)
					%draw new box
					drawfillbox (290, 80, 350, 140, 82)
					boxC := true
					biggest := false
					biggestSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (280, 230, 340, 290, white)
					%draw new box
					drawfillbox (405, 80, 465, 140, 82)
					boxD := true
					biggest := false
					biggestSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (280, 230, 340, 290, white)
					%draw new box
					drawfillbox (520, 80, 580, 140, 82)
					boxE := true
					biggest := false
					biggestSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if
	    if smallSquare not= 0 then
		if secondSquare not= 0 then
		    if mediumSquare not= 0 then
			if bigSquare not= 0 then
			    if biggestSquare not= 0 then
				complete := true
				exit when (mouseX >= 495 and mouseX <= 620) and (mouseY >= 20 and mouseY <= 40) and button = 1
			    end if
			end if
		    end if
		end if
	    end if
	end loop
    end if


    %second random option
    if boxRandom = 2 then
	%moving boxes
	%second largest box
	drawfillbox (40, 235, 90, 285, 87)
	%second smallest box
	drawfillbox (180, 245, 210, 275, 87)
	%smallest box
	drawfillbox (300, 250, 320, 270, 87)
	%largest box
	drawfillbox (410, 230, 470, 290, 87)
	%medium box
	drawfillbox (560, 240, 600, 280, 87)

	loop
	    %smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 300 and mouseX <= 320) and (mouseY >= 250 and mouseY <= 270) then
		    if smallest = true then
			%if user clicks on the box (colour changes)
			drawfillbox (300, 250, 320, 270, 86)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (300, 250, 320, 270, white)
					%draw new box
					drawfillbox (80, 100, 100, 120, 87)
					boxA := true
					smallest := false
					smallSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (300, 250, 320, 270, white)
					%draw new box
					drawfillbox (195, 100, 215, 120, 87)
					boxB := true
					smallest := false
					smallSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (300, 250, 320, 270, white)
					%draw new box
					drawfillbox (310, 100, 330, 120, 87)
					boxC := true
					smallest := false
					smallSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (300, 250, 320, 270, white)
					%draw new box
					drawfillbox (425, 100, 445, 120, 87)
					boxD := true
					smallest := false
					smallSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (300, 250, 320, 270, white)
					%draw new box
					drawfillbox (540, 100, 560, 120, 87)
					boxE := true
					smallest := false
					smallSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 180 and mouseX <= 210) and (mouseY >= 245 and mouseY <= 275) then
		    if secondSmallest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (180, 245, 210, 275, 86)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (180, 245, 210, 275, white)
					%draw new box
					drawfillbox (75, 95, 105, 125, 87)
					boxA := true
					secondSmallest := false
					secondSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (180, 245, 210, 275, white)
					%draw new box
					drawfillbox (190, 95, 220, 125, 87)
					boxB := true
					secondSmallest := false
					secondSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (180, 245, 210, 275, white)
					%draw new box
					drawfillbox (305, 95, 335, 125, 87)
					boxC := true
					secondSmallest := false
					secondSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (180, 245, 210, 275, white)
					%draw new box
					drawfillbox (420, 95, 450, 125, 87)
					boxD := true
					secondSmallest := false
					secondSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (180, 245, 210, 275, white)
					%draw new box
					drawfillbox (535, 95, 565, 125, 87)
					boxE := true
					secondSmallest := false
					secondSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %middle square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 560 and mouseX <= 600) and (mouseY >= 240 and mouseY <= 280) then
		    if medium = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (560, 240, 600, 280, 86)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (70, 90, 110, 130, 87)
					boxA := true
					medium := false
					mediumSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (185, 90, 225, 130, 87)
					boxB := true
					medium := false
					mediumSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (300, 90, 340, 130, 87)
					boxC := true
					medium := false
					mediumSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (415, 90, 455, 130, 87)
					boxD := true
					medium := false
					mediumSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (530, 90, 570, 130, 87)
					boxE := true
					medium := false
					mediumSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 40 and mouseX <= 90) and (mouseY >= 235 and mouseY <= 285) then
		    if secondBiggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (40, 235, 90, 285, 86)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (40, 235, 90, 285, white)
					%draw new box
					drawfillbox (65, 85, 115, 135, 87)
					boxA := true
					secondBiggest := false
					bigSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (40, 235, 90, 285, white)
					%draw new box
					drawfillbox (180, 85, 230, 135, 87)
					boxB := true
					secondBiggest := false
					bigSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (40, 235, 90, 285, white)
					%draw new box
					drawfillbox (295, 85, 345, 135, 87)
					boxC := true
					secondBiggest := false
					bigSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (40, 235, 90, 285, white)
					%draw new box
					drawfillbox (410, 85, 460, 135, 87)
					boxD := true
					secondBiggest := false
					bigSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (40, 235, 90, 285, white)
					%draw new box
					drawfillbox (525, 85, 575, 135, 87)
					boxE := true
					secondBiggest := false
					bigSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 410 and mouseX <= 470) and (mouseY >= 230 and mouseY <= 290) then
		    if biggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (410, 230, 470, 290, 86)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (410, 230, 470, 290, white)
					%draw new box
					drawfillbox (60, 80, 120, 140, 87)
					boxA := true
					biggest := false
					biggestSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (410, 230, 470, 290, white)
					%draw new box
					drawfillbox (175, 80, 235, 140, 87)
					boxB := true
					biggest := false
					biggestSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (410, 230, 470, 290, white)
					%draw new box
					drawfillbox (290, 80, 350, 140, 87)
					boxC := true
					biggest := false
					biggestSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (410, 230, 470, 290, white)
					%draw new box
					drawfillbox (405, 80, 465, 140, 87)
					boxD := true
					biggest := false
					biggestSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (410, 230, 470, 290, white)
					%draw new box
					drawfillbox (520, 80, 580, 140, 87)
					boxE := true
					biggest := false
					biggestSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if
	    if smallSquare not= 0 then
		if secondSquare not= 0 then
		    if mediumSquare not= 0 then
			if bigSquare not= 0 then
			    if biggestSquare not= 0 then
				complete := true
				exit when (mouseX >= 495 and mouseX <= 620) and (mouseY >= 20 and mouseY <= 40) and button = 1
			    end if
			end if
		    end if
		end if
	    end if
	end loop
    end if


    %third random option
    if boxRandom = 3 then
	%moving boxes
	%largest box
	drawfillbox (40, 230, 100, 290, 99)
	%smallest box
	drawfillbox (190, 250, 210, 270, 99)
	%second largest box
	drawfillbox (300, 235, 350, 285, 99)
	%medium box
	drawfillbox (440, 240, 480, 280, 99)
	%second smallest box
	drawfillbox (570, 245, 600, 275, 99)

	loop
	    %smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 190 and mouseX <= 210) and (mouseY >= 250 and mouseY <= 270) then
		    if smallest = true then
			%if user clicks on the box (colour changes)
			drawfillbox (190, 250, 210, 270, 98)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (190, 250, 210, 270, white)
					%draw new box
					drawfillbox (80, 100, 100, 120, 99)
					boxA := true
					smallest := false
					smallSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (190, 250, 210, 270, white)
					%draw new box
					drawfillbox (195, 100, 215, 120, 99)
					boxB := true
					smallest := false
					smallSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (190, 250, 210, 270, white)
					%draw new box
					drawfillbox (310, 100, 330, 120, 99)
					boxC := true
					smallest := false
					smallSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (190, 250, 210, 270, white)
					%draw new box
					drawfillbox (425, 100, 445, 120, 99)
					boxD := true
					smallest := false
					smallSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (190, 250, 210, 270, white)
					%draw new box
					drawfillbox (540, 100, 560, 120, 99)
					boxE := true
					smallest := false
					smallSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 570 and mouseX <= 600) and (mouseY >= 245 and mouseY <= 275) then
		    if secondSmallest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (570, 245, 600, 275, 98)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (570, 245, 600, 275, white)
					%draw new box
					drawfillbox (75, 95, 105, 125, 99)
					boxA := true
					secondSmallest := false
					secondSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (570, 245, 600, 275, white)
					%draw new box
					drawfillbox (190, 95, 220, 125, 99)
					boxB := true
					secondSmallest := false
					secondSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (570, 245, 600, 275, white)
					%draw new box
					drawfillbox (305, 95, 335, 125, 99)
					boxC := true
					secondSmallest := false
					secondSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (570, 245, 600, 275, white)
					%draw new box
					drawfillbox (420, 95, 450, 125, 99)
					boxD := true
					secondSmallest := false
					secondSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (570, 245, 600, 275, white)
					%draw new box
					drawfillbox (535, 95, 565, 125, 99)
					boxE := true
					secondSmallest := false
					secondSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %middle square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 440 and mouseX <= 480) and (mouseY >= 240 and mouseY <= 280) then
		    if medium = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (440, 240, 480, 280, 98)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (440, 240, 480, 280, white)
					%draw new box
					drawfillbox (70, 90, 110, 130, 99)
					boxA := true
					medium := false
					mediumSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (440, 240, 480, 280, white)
					%draw new box
					drawfillbox (185, 90, 225, 130, 99)
					boxB := true
					medium := false
					mediumSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (440, 240, 480, 280, white)
					%draw new box
					drawfillbox (300, 90, 340, 130, 99)
					boxC := true
					medium := false
					mediumSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (440, 240, 480, 280, white)
					%draw new box
					drawfillbox (415, 90, 455, 130, 99)
					boxD := true
					medium := false
					mediumSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (440, 240, 480, 280, white)
					%draw new box
					drawfillbox (530, 90, 570, 130, 99)
					boxE := true
					medium := false
					mediumSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 300 and mouseX <= 350) and (mouseY >= 235 and mouseY <= 285) then
		    if secondBiggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (300, 235, 350, 285, 98)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (300, 235, 350, 285, white)
					%draw new box
					drawfillbox (65, 85, 115, 135, 99)
					boxA := true
					secondBiggest := false
					bigSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (300, 235, 350, 285, white)
					%draw new box
					drawfillbox (180, 85, 230, 135, 99)
					boxB := true
					secondBiggest := false
					bigSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (300, 235, 350, 285, white)
					%draw new box
					drawfillbox (295, 85, 345, 135, 99)
					boxC := true
					secondBiggest := false
					bigSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (300, 235, 350, 285, white)
					%draw new box
					drawfillbox (410, 85, 460, 135, 99)
					boxD := true
					secondBiggest := false
					bigSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (300, 235, 350, 285, white)
					%draw new box
					drawfillbox (525, 85, 575, 135, 99)
					boxE := true
					secondBiggest := false
					bigSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 40 and mouseX <= 100) and (mouseY >= 230 and mouseY <= 290) then
		    if biggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (40, 230, 100, 290, 98)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (40, 230, 100, 290, white)
					%draw new box
					drawfillbox (60, 80, 120, 140, 99)
					boxA := true
					biggest := false
					biggestSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (40, 230, 100, 290, white)
					%draw new box
					drawfillbox (175, 80, 235, 140, 99)
					boxB := true
					biggest := false
					biggestSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (40, 230, 100, 290, white)
					%draw new box
					drawfillbox (290, 80, 350, 140, 99)
					boxC := true
					biggest := false
					biggestSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (40, 230, 100, 290, white)
					%draw new box
					drawfillbox (405, 80, 465, 140, 99)
					boxD := true
					biggest := false
					biggestSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (40, 230, 100, 290, white)
					%draw new box
					drawfillbox (520, 80, 580, 140, 99)
					boxE := true
					biggest := false
					biggestSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if
	    if smallSquare not= 0 then
		if secondSquare not= 0 then
		    if mediumSquare not= 0 then
			if bigSquare not= 0 then
			    if biggestSquare not= 0 then
				complete := true
				exit when (mouseX >= 495 and mouseX <= 620) and (mouseY >= 20 and mouseY <= 40) and button = 1
			    end if
			end if
		    end if
		end if
	    end if
	end loop
    end if


    %fourth random option
    if boxRandom = 4 then
	%moving boxes
	%smallest box
	drawfillbox (40, 250, 60, 270, 66)
	%largest box
	drawfillbox (150, 230, 210, 290, 66)
	%second smallest box
	drawfillbox (300, 245, 330, 275, 66)
	%second largest box
	drawfillbox (420, 235, 470, 285, 66)
	%medium box
	drawfillbox (560, 240, 600, 280, 66)

	loop
	    %smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 40 and mouseX <= 60) and (mouseY >= 250 and mouseY <= 270) then
		    if smallest = true then
			%if user clicks on the box (colour changes)
			drawfillbox (40, 250, 60, 270, 65)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (80, 100, 100, 120, 66)
					boxA := true
					smallest := false
					smallSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (195, 100, 215, 120, 66)
					boxB := true
					smallest := false
					smallSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (310, 100, 330, 120, 66)
					boxC := true
					smallest := false
					smallSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (425, 100, 445, 120, 66)
					boxD := true
					smallest := false
					smallSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (40, 250, 60, 270, white)
					%draw new box
					drawfillbox (540, 100, 560, 120, 66)
					boxE := true
					smallest := false
					smallSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 300 and mouseX <= 330) and (mouseY >= 245 and mouseY <= 275) then
		    if secondSmallest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (300, 245, 330, 275, 65)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (300, 245, 330, 275, white)
					%draw new box
					drawfillbox (75, 95, 105, 125, 66)
					boxA := true
					secondSmallest := false
					secondSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (300, 245, 330, 275, white)
					%draw new box
					drawfillbox (190, 95, 220, 125, 66)
					boxB := true
					secondSmallest := false
					secondSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (300, 245, 330, 275, white)
					%draw new box
					drawfillbox (305, 95, 335, 125, 66)
					boxC := true
					secondSmallest := false
					secondSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (300, 245, 330, 275, white)
					%draw new box
					drawfillbox (420, 95, 450, 125, 66)
					boxD := true
					secondSmallest := false
					secondSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (300, 245, 330, 275, white)
					%draw new box
					drawfillbox (535, 95, 565, 125, 66)
					boxE := true
					secondSmallest := false
					secondSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %middle square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 560 and mouseX <= 600) and (mouseY >= 240 and mouseY <= 280) then
		    if medium = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (560, 240, 600, 280, 65)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (70, 90, 110, 130, 66)
					boxA := true
					medium := false
					mediumSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (185, 90, 225, 130, 66)
					boxB := true
					medium := false
					mediumSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (300, 90, 340, 130, 66)
					boxC := true
					medium := false
					mediumSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (415, 90, 455, 130, 66)
					boxD := true
					medium := false
					mediumSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (560, 240, 600, 280, white)
					%draw new box
					drawfillbox (530, 90, 570, 130, 66)
					boxE := true
					medium := false
					mediumSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 420 and mouseX <= 470) and (mouseY >= 235 and mouseY <= 285) then
		    if secondBiggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (420, 235, 470, 285, 65)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (65, 85, 115, 135, 66)
					boxA := true
					secondBiggest := false
					bigSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (180, 85, 230, 135, 66)
					boxB := true
					secondBiggest := false
					bigSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (295, 85, 345, 135, 66)
					boxC := true
					secondBiggest := false
					bigSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (410, 85, 460, 135, 66)
					boxD := true
					secondBiggest := false
					bigSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (525, 85, 575, 135, 66)
					boxE := true
					secondBiggest := false
					bigSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 150 and mouseX <= 210) and (mouseY >= 230 and mouseY <= 290) then
		    if biggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (150, 230, 210, 290, 65)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (150, 230, 210, 290, white)
					%draw new box
					drawfillbox (60, 80, 120, 140, 66)
					boxA := true
					biggest := false
					biggestSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (150, 230, 210, 290, white)
					%draw new box
					drawfillbox (175, 80, 235, 140, 66)
					boxB := true
					biggest := false
					biggestSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (150, 230, 210, 290, white)
					%draw new box
					drawfillbox (290, 80, 350, 140, 66)
					boxC := true
					biggest := false
					biggestSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (150, 230, 210, 290, white)
					%draw new box
					drawfillbox (405, 80, 465, 140, 66)
					boxD := true
					biggest := false
					biggestSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (150, 230, 210, 290, white)
					%draw new box
					drawfillbox (520, 80, 580, 140, 66)
					boxE := true
					biggest := false
					biggestSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if
	    if smallSquare not= 0 then
		if secondSquare not= 0 then
		    if mediumSquare not= 0 then
			if bigSquare not= 0 then
			    if biggestSquare not= 0 then
				complete := true
				exit when (mouseX >= 495 and mouseX <= 620) and (mouseY >= 20 and mouseY <= 40) and button = 1
			    end if
			end if
		    end if
		end if
	    end if
	end loop
    end if


    %fifth random option
    if boxRandom = 5 then
	%moving boxes
	%medium box
	drawfillbox (40, 240, 80, 280, 96)
	%second smallest box
	drawfillbox (170, 245, 200, 275, 96)
	%smallest box
	drawfillbox (290, 250, 310, 270, 96)
	%second largest box
	drawfillbox (400, 235, 450, 285, 96)
	%largest box
	drawfillbox (540, 230, 600, 290, 96)

	loop
	    %smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 290 and mouseX <= 310) and (mouseY >= 250 and mouseY <= 270) then
		    if smallest = true then
			%if user clicks on the box (colour changes)
			drawfillbox (290, 250, 310, 270, 95)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (290, 250, 310, 270, white)
					%draw new box
					drawfillbox (80, 100, 100, 120, 96)
					boxA := true
					smallest := false
					smallSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (290, 250, 310, 270, white)
					%draw new box
					drawfillbox (195, 100, 215, 120, 96)
					boxB := true
					smallest := false
					smallSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (290, 250, 310, 270, white)
					%draw new box
					drawfillbox (310, 100, 330, 120, 96)
					boxC := true
					smallest := false
					smallSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (290, 250, 310, 270, white)
					%draw new box
					drawfillbox (425, 100, 445, 120, 96)
					boxD := true
					smallest := false
					smallSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (290, 250, 310, 270, white)
					%draw new box
					drawfillbox (540, 100, 560, 120, 96)
					boxE := true
					smallest := false
					smallSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second smallest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 170 and mouseX <= 200) and (mouseY >= 245 and mouseY <= 275) then
		    if secondSmallest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (170, 245, 200, 275, 95)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (170, 245, 200, 275, white)
					%draw new box
					drawfillbox (75, 95, 105, 125, 96)
					boxA := true
					secondSmallest := false
					secondSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (170, 245, 200, 275, white)
					%draw new box
					drawfillbox (190, 95, 220, 125, 96)
					boxB := true
					secondSmallest := false
					secondSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (170, 245, 200, 275, white)
					%draw new box
					drawfillbox (305, 95, 335, 125, 96)
					boxC := true
					secondSmallest := false
					secondSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (170, 245, 200, 275, white)
					%draw new box
					drawfillbox (420, 95, 450, 125, 96)
					boxD := true
					secondSmallest := false
					secondSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (170, 245, 200, 275, white)
					%draw new box
					drawfillbox (535, 95, 565, 125, 96)
					boxE := true
					secondSmallest := false
					secondSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %middle square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 40 and mouseX <= 80) and (mouseY >= 240 and mouseY <= 280) then
		    if medium = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (40, 240, 80, 280, 95)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (40, 240, 80, 280, white)
					%draw new box
					drawfillbox (70, 90, 110, 130, 96)
					boxA := true
					medium := false
					mediumSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (40, 240, 80, 280, white)
					%draw new box
					drawfillbox (185, 90, 225, 130, 96)
					boxB := true
					medium := false
					mediumSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (40, 240, 80, 280, white)
					%draw new box
					drawfillbox (300, 90, 340, 130, 96)
					boxC := true
					medium := false
					mediumSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (40, 240, 80, 280, white)
					%draw new box
					drawfillbox (415, 90, 455, 130, 96)
					boxD := true
					medium := false
					mediumSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (40, 240, 80, 280, white)
					%draw new box
					drawfillbox (530, 90, 570, 130, 96)
					boxE := true
					medium := false
					mediumSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %second largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 420 and mouseX <= 470) and (mouseY >= 235 and mouseY <= 285) then
		    if secondBiggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (420, 235, 470, 285, 95)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (65, 85, 115, 135, 96)
					boxA := true
					secondBiggest := false
					bigSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (180, 85, 230, 135, 96)
					boxB := true
					secondBiggest := false
					bigSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (295, 85, 345, 135, 96)
					boxC := true
					secondBiggest := false
					bigSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (410, 85, 460, 135, 96)
					boxD := true
					secondBiggest := false
					bigSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (420, 235, 470, 285, white)
					%draw new box
					drawfillbox (525, 85, 575, 135, 96)
					boxE := true
					secondBiggest := false
					bigSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    %largest square
	    mousewhere (mouseX, mouseY, button)
	    if button = 1 then
		if (mouseX >= 540 and mouseX <= 600) and (mouseY >= 230 and mouseY <= 290) then
		    if biggest = true then
			%indicates if user clicks on the box (if they did colour changes)
			drawfillbox (540, 230, 600, 290, 95)
			loop
			    mousewhere (mouseX, mouseY, button)
			    if button = 1 then
				if (mouseX >= 50 and mouseX <= 130) and (mouseY >= 70 and mouseY <= 150) then
				    if boxA = false then
					%erase
					drawfillbox (540, 230, 600, 290, white)
					%draw new box
					drawfillbox (60, 80, 120, 140, 96)
					boxA := true
					biggest := false
					biggestSquare := 1
				    end if
				    exit
				elsif (mouseX >= 165 and mouseX <= 245) and (mouseY >= 70 and mouseY <= 150) then
				    if boxB = false then
					%erase
					drawfillbox (540, 230, 600, 290, white)
					%draw new box
					drawfillbox (175, 80, 235, 140, 96)
					boxB := true
					biggest := false
					biggestSquare := 2
				    end if
				    exit
				elsif (mouseX >= 280 and mouseX <= 360) and (mouseY >= 70 and mouseY <= 150) then
				    if boxC = false then
					%erase
					drawfillbox (540, 230, 600, 290, white)
					%draw new box
					drawfillbox (290, 80, 350, 140, 96)
					boxC := true
					biggest := false
					biggestSquare := 3
				    end if
				    exit
				elsif (mouseX >= 395 and mouseX <= 475) and (mouseY >= 70 and mouseY <= 150) then
				    if boxD = false then
					%erase
					drawfillbox (540, 230, 600, 290, white)
					%draw new box
					drawfillbox (405, 80, 465, 140, 96)
					boxD := true
					biggest := false
					biggestSquare := 4
				    end if
				    exit
				elsif (mouseX >= 510 and mouseX <= 590) and (mouseY >= 70 and mouseY <= 150) then
				    if boxE = false then
					%erase
					drawfillbox (540, 230, 600, 290, white)
					%draw new box
					drawfillbox (520, 80, 580, 140, 96)
					boxE := true
					biggest := false
					biggestSquare := 5
				    end if
				    exit
				end if
			    end if
			end loop
		    end if
		end if
	    end if

	    if smallSquare not= 0 then
		if secondSquare not= 0 then
		    if mediumSquare not= 0 then
			if bigSquare not= 0 then
			    if biggestSquare not= 0 then
				complete := true
				exit when (mouseX >= 495 and mouseX <= 620) and (mouseY >= 20 and mouseY <= 40) and button = 1
			    end if
			end if
		    end if
		end if
	    end if

	end loop
    end if
    display
end userInput

%procedure display
body procedure display
    GUI.Enable (menu)
    title
    GUI.Show (menu)
    if smallSquare = 1 and secondSquare = 2 and mediumSquare = 3 and bigSquare = 4 and biggestSquare = 5 then
	%picture file
	pictureID := Pic.FileNew ("smile.jpg")
	locate (3, 1)
	put "CONGRATULATIONS YOU PASSED THE TEST!"
	put ""
	put "You have correctly placed all the boxes in order from smallest to largest."
	%setscreen
	setscreen ("offscreenonly")
	%thumbs up accross screen
	for x : 1 .. 900
	    %erase
	    drawfillbox (-15 + x, 310, -350 + x, 84, white)
	    %thumbs up pic
	    Pic.Draw (pictureID, -240 + x, 85, picMerge)
	    delay (5)
	    View.Update
	end for
	%setscreen
	setscreen ("nooffscreenonly")
    else
	pictureID := Pic.FileNew ("frown.jpg")
	locate (3, 1)
	put "You have not passed the test."
	put ""
	put "You're boxes were not properly placed in order from smallest to largest."
	put ""
	put "Better luck next time!"
	%setscreen
	setscreen ("offscreenonly")
	%thumbs up accross screen
	for x : 1 .. 900
	    %erase
	    drawfillbox (-15 + x, 275, -350 + x, 84, white)
	    %thumbs up pic
	    Pic.Draw (pictureID, -240 + x, 85, picMerge)
	    delay (5)
	    View.Update
	end for
	%setscreen
	setscreen ("nooffscreenonly")
    end if
end display

%exit music
process music1
    Music.PlayFile ("sowhat.mp3")
end music1

%program goodbye
body procedure goodbye
    GUI.Disable (instructionButton)
    GUI.Disable (testButton)
    GUI.Disable (exitButton)
    colorback (102)
    title
    %music
    fork music1
    locate (3, 1)
    put "   You have decided to exit the test."
    put "   This program was written by Hannah Kim."
    put ""
    put "   For more information, contact @h.kiimm through instagram or"
    put "   email hannah.seyun.kim@gmail.com."
    put ""
    put "   Follow @h.kiimm on INSTAGRAM for great content."
    delay (15000)
    Window.Close (mainWindow)
end goodbye

%Main Program
introduction
loop
    exit when GUI.ProcessEvent
end loop
goodbye
%End Program
