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
