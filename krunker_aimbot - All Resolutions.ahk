#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance FORCE 

;OPTIMIZATIONS START
#MaxHotkeysPerInterval 920000000
#HotkeyInterval 920000000
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
Sense = 7
FirstPairX := floor(MidX - 120)
FirstPairY := floor(MidY - 120)
SecondPairX := floor(MidX + 120)
SecondPairY := floor(MidY + 120)

aim := 0x5064FB

~RButton::
{
	While GetKeyState("RButton"){
PixelSearch, TargetX, TargetY, FirstPairX, FirstPairY, SecondPairX, SecondPairY, %aim%, 20, Fast
If ErrorLevel = 0 
{ 
TargetX := TargetX + 42
TargetY := TargetY + 20
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