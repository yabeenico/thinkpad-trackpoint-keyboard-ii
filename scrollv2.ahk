; - Realizing scroll and middle button click simultaniously.
; - When connect to Windosw by Bluetooh (also USB dongle).
; - Uninstall the driver on your PC or uncheck "ThinkPad Preferred Scrolling".

#Requires AutoHotkey v2
A_MaxHotkeysPerInterval := 2000 ; ms

hookWheelUp(){
    global isWheelUp
    global isWheelDown
    isWheelUp := true
    Send("{Wheelup}")
}

hookWheelDown(){
    global isWheelUp
    global isWheelDown
    isWheelDown := true
    Send("{WheelDown}")
}

hookMButtonUP(){
    global isWheelUp
    global isWheelDown
    ;Sleep(40) ; uncomment if something went wrong
    if(!(isWheelUp || isWheelDown)){
        Send("{MButton}")
    }
    isWheelUp := isWheelDown := false
}

hookMButton(){
    global isWheelUp
    global isWheelDown
    isWheelUp := isWheelDown := false
}

global isWheelUp   := false
global isWheelDown := false

WheelUp:: hookWheelUp()
WheelDown:: hookWheelDown()
MButton up::hookMButtonUP()
MButton::hookMButton()

