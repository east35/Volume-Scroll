#Requires AutoHotkey v2.0

; Disable actual Caps Lock toggle
CapsLock::Return

volStep := 2

WheelUp::{
    if GetKeyState("CapsLock", "P") {
        currentVol := SoundGetVolume()
        newVol := Min(currentVol + volStep, 100)
        SoundSetVolume newVol
        ToolTip "↑ Volume: " newVol
        SetTimer () => ToolTip(), -500
        Return
    } else {
        Send "{WheelUp}"
    }
}

WheelDown::{
    if GetKeyState("CapsLock", "P") {
        currentVol := SoundGetVolume()
        newVol := Max(currentVol - volStep, 0)
        SoundSetVolume newVol
        ToolTip "↓ Volume: " newVol
        SetTimer () => ToolTip(), -500
        Return
    } else {
        Send "{WheelDown}"
    }
}
