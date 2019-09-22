-- Lua file for MuteBwonsamdi

local frame, events = CreateFrame("Frame"), {};

-- Locate sounds by file ID to prevent case sensitivity issues

local sounds = { 
    2016732, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_35_M
    2016733, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_36_M
    2016734, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_37_M
    2016735, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_38_M
    2016736, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_39_M
    2016737, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_40_M
    2016738, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_41_M
    2016739, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_42_M
    2016740, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_43_M
    2016741, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_44_M
    2016742, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_45_M
    2016743, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_46_M
    2016744, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_47_M
    2016745, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_48_M
    2016746, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_49_M
    2016747, -- Creature/Bwonsamdi/VO_801_Bwonsamdi_50_M
}

function events:PLAYER_LOGIN(...)
    for i, sound in ipairs(sounds) do
        MuteSoundFile(sound);
    end
end

-- Unmute all sounds on logout, in case a player disables this addon and logs in again

function events:PLAYER_LOGOUT(...)
    for i, sound in ipairs(sounds) do
        UnmuteSoundFile(sound);
    end
end

-- Magic for attaching all defined events to the frame

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...);
end);

for k, v in pairs(events) do
    frame:RegisterEvent(k);
end
