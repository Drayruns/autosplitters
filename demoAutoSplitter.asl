state("flashplayer_32_sa") {
    int levelData: 0x00D18438, 0x118 , 0xFC, 0x34 , 0x14C, 0x258;
    int stackedData: 0xD18438, 0x118, 0x2C, 0x274, 0xC, 0x14, 0x7C8;
    int finishCounter: 0xD18438, 0x71C, 0x48, 0x14, 0x150, 0x10, 0x10, 0x4;
}

init {
    vars.resetTest = 0;
    vars.checkDoubleSplit = false;
}

startup {
    settings.Add("Demo");
    settings.CurrentDefaultParent = "Demo";

    settings.Add("Opening Level");

    settings.CurrentDefaultParent = "Opening Level";
    settings.Add("Obstacle Course?");
    settings.Add("Gut Bus Extreme!");
    settings.Add("BMX_Park II");
    settings.Add("SnowyMountain*final*");
    settings.Add("Dawn of the Dead.lv1");
    settings.Add("A large Satan eats u");
    settings.Add("TrapTrac");
    settings.Add("IT KEEPS HAPPENING!");
    settings.Add("Rope Swings");

    settings.CurrentDefaultParent = "Demo";
    settings.Add("Custom Settings");
    settings.CurrentDefaultParent = "Custom Settings";
    settings.Add("Disable Double Splits");

    
}

update{
    if (settings["Disable Double Splits"]){
        if (vars.checkDoubleSplit == true){
            if (current.stackedData == 3){
                vars.checkDoubleSplit = false;
            }
            else{
                return false;
            }
        }
    }
}

start {
    if(settings["Obstacle Course?"]){
        if (current.levelData == (1359197867) && old.levelData != (1359197867)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["Gut Bus Extreme!"]){
        if (current.levelData == (1359197867) && old.levelData != (1359197867)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["BMX_Park II"]){
        if (current.levelData == (3646648787) && old.levelData != (3646648787)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["SnowyMountain*final*"]){
        if (current.levelData == (269109983) && old.levelData != (269109983)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["Dawn of the Dead.lv1"]){
        if (current.levelData == (297453999) && old.levelData != (297453999)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["A large Satan eats u"]){
        if (current.levelData == (1359197867) && old.levelData != (1359197867)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["TrapTrac"]){
        if (current.levelData == (1541524327) && old.levelData != (1541524327)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["IT KEEPS HAPPENING!"]){
        if (current.levelData == (1359197867) && old.levelData != (1359197867)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
    if(settings["Rope Swings"]){
        if (current.levelData == (2873443172) && old.levelData != (2873443172)) {
            vars.resetTest = current.finishCounter;
            return true;
        }
    }
}

split {
    if (current.finishCounter > old.finishCounter){
        vars.resetTest = current.finishCounter;
        vars.checkDoubleSplit = true;
        return true;
    }
}

reset {
    if (current.stackedData == 3 && current.finishCounter == vars.resetTest){
        if (old.stackedData == 4 || old.stackedData == 5){
            return true;
        }            
    }
}
