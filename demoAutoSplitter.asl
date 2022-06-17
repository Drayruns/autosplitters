state("flashplayer_32_sa") {
    int levelData: 0x00D18438, 0x118 , 0xFC, 0x34 , 0x14C, 0x258;
    int stackedData: 0xD18438, 0x118, 0x2C, 0x274, 0xC, 0x14, 0x7C8;
    int finishCounter: 0xD18438, 0x71C, 0x48, 0x14, 0x150, 0x10, 0x10, 0x4;
    int currentLevel: 0xD18438, 0x14, 0x28, 0x4, 0x38, 0xF2C;
}

init {
    vars.resetTest = 0;
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
    settings.Add("Reset Any Unfinished Level");
    settings.SetToolTip("Reset Any Unfinished Level", "Leave unchecked and it will only reset on an unfinished first split");
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
        if(settings["Reset Any Unfinished Level"]){
            vars.resetTest = current.finishCounter;
        }
        return true;
    }
}

reset {
    if (current.stackedData == 3 && old.stackedData == 4 && current.finishCounter == vars.resetTest){
        return true;
    }
}