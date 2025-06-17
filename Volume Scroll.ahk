#Requires AutoHotkey v2.0

CapsLock::Return

isOnCooldown := false
maxStep := 10  ; max volume change per tick
scale := 1     ; adjust for sensitivity

WheelUp::{
    global isOnCooldown
    if GetKeyState("CapsLock", "P") {
        if isOnCooldown
            return
        isOnCooldown := true

        delta := A_EventInfo * scale
        delta := Min(delta, maxStep)

        currentVol := SoundGetVolume()
        newVol := Min(currentVol + delta, 100)
        SoundSetVolume newVol
        ToolTip "↑ Volume: " Round(newVol)
        SetTimer () => ToolTip(), -500
        SetTimer () => (isOnCooldown := false), -80
        return
    } else {
        Send "{WheelUp}"
    }
}

WheelDown::{
    global isOnCooldown
    if GetKeyState("CapsLock", "P") {
        if isOnCooldown
            return
        isOnCooldown := true

        delta := A_EventInfo * scale
        delta := Min(delta, maxStep)

        currentVol := SoundGetVolume()
        newVol := Max(currentVol - delta, 0)
        SoundSetVolume newVol
        ToolTip "↓ Volume: " Round(newVol)
        SetTimer () => ToolTip(), -500
        SetTimer () => (isOnCooldown := false), -80
        return
    } else {
        Send "{WheelDown}"
    }
}