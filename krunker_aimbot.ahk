#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance FORCE 

;OPTIMIZATIONS START
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
;OPTIMIZATIONS END

CoordMode, Mouse, Screen 
CoordMode, Pixel, Screen 
MidX := A_ScreenWidth / 2 
MidY := A_ScreenHeight / 2 
Triggerbot = 0 
Sense = 1.85

aim := 0x5064FB

CreateBox("01FF01")
Box(870, 450, 180, 180, 1, 0)

~RButton::
{
	While GetKeyState("RButton"){
PixelSearch, TargetX, TargetY, 870, 450, 1050, 630, %aim%, 30, Fast
If ErrorLevel = 0 
{ 
TargetX := TargetX + 40
TargetY := TargetY + 30
MoveX := ((TargetX - MidX) / sense) 
MoveY := ((TargetY - MidY) / sense) 
MouseMove, MoveX, MoveY,, R 
if (TriggerBot = 1) 
Click 
}
}
}
return

`::exitapp

; BOX FUNCTIONS, NOT WRITTEN BY ME. https://autohotkey.com/board/topic/54443-box-ie-draw-simple-gui-based-boxes-on-screen/

CreateBox(Color)
{
	Gui 81:color, %Color%
	Gui 81:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 82:color, %Color%
	Gui 82:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 83:color, %Color%
	Gui 83:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 84:color, %Color%
	Gui 84:+ToolWindow -SysMenu -Caption +AlwaysOnTop
}

Box(XCor, YCor, Width, Height, Thickness, Offset)
{
	If InStr(Offset, "In")
	{
		StringTrimLeft, offset, offset, 2
		If not Offset
			Offset = 0
		Side = -1
	} Else {
		StringTrimLeft, offset, offset, 3
		If not Offset
			Offset = 0
		Side = 1
	}
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y := YCor - (Side + 1) / 2 * Thickness - Side * Offset
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 81:Show, x%x% y%y% w%w% h%h% NA
	x += Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 82:Show, x%x% y%y% w%w% h%h% NA
	x := x + w - Thickness
	y += Thickness
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 83:Show, x%x% y%y% w%w% h%h% NA
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y += h - Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 84:Show, x%x% y%y% w%w% h%h% NA
}

RemoveBox()
{
	Gui 81:destroy
	Gui 82:destroy
	Gui 83:destroy
	Gui 84:destroy
}