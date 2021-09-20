; - Realizing scroll and middle button click simultaniously.
; - When connect to Windosw by Bluetooh (also USB dongle).
; - Uninstall the driver on your PC or uncheck "ThinkPad Preferred Scrolling".

#MaxHotkeysPerInterval 2000
#SingleInstance force

WheelUp:: hookWheelUp()
global isWheelUP := false
hookWheelUp(){
    send {Wheelup}
    isWheelUp := true
}

WheelDown:: hookWheelDown()
global isWheelDown := false
hookWheelDown(){
    send {WheelDown}
    isWheelDown := true
}

MButton::return

MButton up::hookMButtonUP()
hookMButtonUP(){
    if(!(isWheelUp | isWheelDown)){
        send {MButton}
    }
    isWheelUp   := false
    isWheelDown := false
}
