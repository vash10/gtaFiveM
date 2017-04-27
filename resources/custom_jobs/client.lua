--[[
RegisterNetEvent('jobssystem:create_target')
AddEventHandler('jobssystem:create_target', function()
		nigger =  CreatePed(5, 0xD172497E, -1033.14, -2731.23, 29.5394, 211.587, false, true)
		SetBlockingOfNonTemporaryEvents(nigger, true)
		SetPedCombatAttributes(nigger, 46, true)
		SetPedFleeAttributes(nigger, 0, 0)
		--SetPedRelationshipGroupHash(nigger, GetHashKey("CIVFEMALE"))
		TaskWanderStandard(nigger, 0, 0)
end)





Citizen.CreateThread(function ()
	RequestModel(GetHashKey("a_m_m_afriamer_01"))
	while not HasModelLoaded(GetHashKey("a_m_m_afriamer_01")) do
		Wait(1)
	end
	while true do
		Citizen.Wait(0)
	end
end)

]]

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--use this for debugging
function Chat(t)
	TriggerEvent("chatMessage", 'KILLER', { 0, 255, 255}, "" .. tostring(t))
end

--locations
--arrays
local KillerCompany = {}
KillerCompany[0] = {["x"] = 1445.07,["y"] = -2221.22, ["z"] = 61.6848}

--local Truck = {"HAULER", "PACKER", "PHANTOM"}
local Target = {"a_m_m_afriamer_01", "a_m_m_afriamer_01", "a_m_m_afriamer_01", "a_m_m_afriamer_01"}

local MissionData = {
    [0] = {1212.4463, 2667.4351, 38.79, 5000, "a_m_m_afriamer_01"}, --x,y,z,money
    [1] = {2574.5144, 328.5554, 108.45, 10000, "a_m_m_afriamer_01"},
    [2] = {-1463.81, 179.996, 54.75, 15000, "a_m_m_afriamer_01", 
		{
			{x=-1463.81, y=179.996, z=54.75, a=0.0, model='cs_tracydisanto', anim="mini@strip_club@idles@bouncer@base", animgroup="base"},
			{x=-1460.81, y=190.996, z=55.75, a=-90.0, model='a_f_y_topless_01', anim="mini@strip_club@idles@bouncer@base", animgroup="base"},
			{x=-1460.44, y=178.596, z=54.75, a=-45.0, model='a_f_y_topless_01', anim="mini@strip_club@idles@bouncer@base", animgroup="base"},
			{x=-1454.39, y=194.096, z=54.56, a=45.0, model='a_f_y_topless_01', anim="mini@strip_club@idles@bouncer@base", animgroup="base"}
		} -- Others peds around
	},
    [3] = {1706.7966, 4943.9897, 42.16, 20000, "a_m_m_afriamer_01"},
    [4] = {196.5617, 6631.0967, 31.53, 30000, "a_m_m_afriamer_01"},
    [5] = {1449.42, -2206.00, 62.11, 1337, "a_m_m_afriamer_01"}
}
local MISSION = {}
MISSION.start = false
MISSION.target = false

MISSION.hashTruck = 0
MISSION.hashTarget = 0

local currentMission = -1

local playerCoords
local playerPed

local GUI = {}
GUI.loaded          = false
GUI.showStartText   = false
GUI.showMenu        = false
GUI.selected        = {}
GUI.menu            = -1 --current menu

GUI.title           = {}
GUI.titleCount      = 0

GUI.desc            = {}
GUI.descCount       = 0

GUI.button          = {}
GUI.buttonCount     = 0

GUI.time            = 0

--text for mission
local text1 = false
local text2 = false

--blips
local BLIP = {}

BLIP.company = 0

BLIP.target = {}
BLIP.target.i = 0

--focus button color
local r = 0
local g= 128
local b = 192
local alpha = 200

function clear()
    MISSION.start = false
    SetBlipRoute(BLIP.destination[BLIP.destination.i], false)
    SetEntityAsNoLongerNeeded(BLIP.destination[BLIP.destination.i])

    --if ( DoesEntityExist(MISSION.trailer) ) then
         --SetEntityAsNoLongerNeeded(MISSION.trailer)
    --end
    --if ( DoesEntityExist(MISSION.truck) ) then
         --SetEntityAsNoLongerNeeded(MISSION.truck)
         --SetVehicleDoorsLocked(MISSION.truck, 2)
         --SetVehicleUndriveable(MISSION.truck, true)
    --end
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(MISSION.trailer))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(MISSION.truck))

    --MISSION.trailer = 0
    --MISSION.truck = 0
    --MISSION.hashTruck = 0
    MISSION.hashTarget = 0
    currentMission = -1
end

local initload = false
Citizen.CreateThread(function()
    while true do
       Wait(0)
       playerPed = GetPlayerPed(-1)
       playerCoords = GetEntityCoords(playerPed, 0)
        if (not initload) then
            init()
            initload = true
        end
		TriggerEvent("mt:missiontext", "Ticking", 5000)
        tick()
    end

end)

function init()
    BLIP.company = AddBlipForCoord(KillerCompany[0]["x"], KillerCompany[0]["y"], KillerCompany[0]["z"])
    SetBlipSprite(BLIP.company, 280)
    SetBlipDisplay(BLIP.company, 4)
    SetBlipScale(BLIP.company, 0.8)
    Citizen.Trace("Killer Blip added.")
   -- GUI.loaded = true
end

--Draw Text / Menus
function tick()
	TriggerEvent("mt:missiontext", "tick1", 5000)

    --debugging stange things
    if ( type(BLIP.target[BLIP.target.i]) == "boolean" ) then
		--TriggerEvent("mt:missiontext", type(BLIP.target[BLIP.target.i]), 5000)
        Citizen.Trace("-FAIL!-")
    elseif( BLIP.target[BLIP.target.i] == nil ) then
		--TriggerEvent("mt:missiontext", "bug"), 5000)
        Citizen.Trace("-nil-")
    else
       BLIP.target[BLIP.target.i] = BLIP.target[BLIP.target.i]
    end
	TriggerEvent("mt:missiontext", "tick2", 5000)

    --Show menu, when player is near
    if( MISSION.start == false) then
		TriggerEvent("mt:missiontext", "Mission non commencé", 5000)
    if( GetDistanceBetweenCoords( playerCoords, KillerCompany[0]["x"], KillerCompany[0]["y"], KillerCompany[0]["z"] ) < 10) then
		TriggerEvent("mt:missiontext", "Mission commenceable", 5000)
            if(GUI.showStartText == false) then
                GUI.drawStartText()
            end
                --key controlling
                if(IsControlPressed(1, Keys["H"]) and GUI.showMenu == false) then
                    --clear()
                    GUI.showMenu = true
                    GUI.menu = 0
                end
                if(IsControlPressed(1, Keys["ESC"]) and GUI.showMenu == true) then
                    GUI.showMenu = false
                end
            else
                GUI.showStartText = false
        end --if GetDistanceBetweenCoords ...

        --menu
        if( GUI.loaded == false ) then
            GUI.init()
        end

        if( GUI.showMenu == true and GUI.menu ~= -1) then
            if( GUI.time == 0) then
                GUI.time = GetGameTimer()
            end
            if( (GetGameTimer() - GUI.time) > 10) then
                GUI.updateSelectionMenu(GUI.menu)
                GUI.time = 0
            end
			TriggerEvent("mt:missiontext", "Render", 5000)
            GUI.renderMenu(GUI.menu)
			TriggerEvent("mt:missiontext", "RenderDone", 5000)
        end --if GUI.loaded == false
    elseif( MISSION.start == true ) then
            TriggerEvent("mt:missiontext", "Mission en cours", 5000)

        MISSION.markerUpdate()
        if(text1 == false) then
            TriggerEvent("mt:missiontext", "Go and kill the ~g~target~w~.", 10000)
            text1 = true
        --elseif( not IsEntityAttached(MISSION.trailer) and text2 == false ) then
            --TriggerEvent("mt:missiontext", "Attach the ~o~trailer~w~.", 15000)
            --text2 = true
        end
        Wait(20)
        if ( IsPedDeadOrDying(MISSION.target, 1)) then
			TriggerServerEvent("killerJob:addMoney", tonumber(currentMission[4]))
            TriggerEvent("mt:missiontext", "You gained ~g~$"..currentMission[4], 5000)
            MISSION.removeMarker()
            clear()
        end
    end --if MISSION.start == false/true
end



---------------------------------------
---------------------------------------
---------------------------------------
----------------MISSON-----------------
---------------------------------------
---------------------------------------
---------------------------------------
function GUI.optionMisson(trailerN)

    --select trailer

end

function GUI.mission(missionN)
	
    --currently one destination per ride
    BLIP.target.i = BLIP.target.i + 1
    currentMission = MissionData[missionN]
    GUI.showMenu = false
    --mission start
    MISSION.start = true
	TriggerEvent("mt:missiontext", "Mission Start !!!!",50000)
    MISSION.spawnTarget()
	SetEntityAsMissionEntity(MISSION.target, true, true);
	TriggerEvent("mt:missiontext", "Mission Started !!!!",50000)
end

--[[function MISSION.spawnTruck()

    MISSION.truck = CreateVehicle(MISSION.hashTruck, 12.1995, -1.174761, 73.000, 0.0, true, false)
    SetVehicleOnGroundProperly(MISSION.trailer)
    SetVehicleNumberPlateText(MISSION.truck, "M15510")
    SetVehRadioStation(MISSION.truck, "OFF")
		SetPedIntoVehicle(playerPed, MISSION.truck, -1)
    SetVehicleEngineOn(MISSION.truck, true, false, false)

    --important
    --SetEntityAsMissionEntity(MISSION.truck, true, true);
end]]

function MISSION.spawnTarget()

    MISSION.hashTarget = GetHashKey(currentMission[5])
    RequestModel(MISSION.hashTarget)

    while not HasModelLoaded(MISSION.hashTarget) do
        Wait(1)
    end
	TriggerEvent("mt:missiontext", "Spawning target ",50000)
	
	MISSION.target = CreatePed(5, MISSION.hashTarget, currentMission[1], currentMission[2], currentMission[3], currentMission[4], false, true)
	
    MISSION.setBlipOnTarget()
	MISSION.createTargetEnvironment()
end

local oneTime = false

function MISSION.createTargetEnvironment()
	for _, item in pairs(currentMission[6]) do
	    local temphash = GetHashKey(item.model)
		RequestModel(temphash)

		while not HasModelLoaded(temphash) do
			Wait(1)
		end
		 RequestAnimDict(item.anim)
		while not HasAnimDictLoaded(item.anim) do
			Wait(1)
		end
	
		extra_ped = CreatePed(5, temphash, item.x, item.y, item.z, item.a, false, true)
		GiveWeaponToPed(extra_ped, 0x99B507EA, 2800, false, true)
		SetPedCombatAttributes(extra_ped, 46, true)
		SetPedFleeAttributes(extra_ped, 0, 0)
		SetPedArmour(extra_ped, 200)
		SetPedMaxHealth(extra_ped, 200)
		SetPedDiesWhenInjured(ped, false)
		SetPedRelationshipGroupHash(extra_ped, GetHashKey("army"))
		TaskPlayAnim(extra_ped,item.anim,item.animgroup, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end
end

function MISSION.setBlipOnTarget()
	TriggerEvent("mt:missiontext", "Blip SET !!!!",30000)
	BLIP.target[BLIP.target.i] = AddBlipForEntity(MISSION.target)
	SetBlipSprite(BLIP.target[BLIP.target.i], 1)
	SetBlipColour(BLIP.target[BLIP.target.i], 17)
	SetBlipRoute(BLIP.target[BLIP.target.i], true)
    Wait(50)
	TriggerEvent("mt:missiontext", "Blip SET Done!!!!",30000)
end

function MISSION.markerUpdate()
	TriggerEvent("mt:missiontext", "markerUpdate",30000)
	if ( not BLIP.target[BLIP.target.i]) then
		BLIP.target[BLIP.target.i] = AddBlipForEntity(MISSION.target)
		SetBlipSprite(BLIP.target[BLIP.target.i], 1)
		SetBlipColour(BLIP.target[BLIP.target.i], 17)
		SetBlipRoute(BLIP.target[BLIP.target.i], true)
	end
    Wait(50)
end

function MISSION.removeMarker()
    SetBlipSprite(BLIP.target[BLIP.target.i], 2) --invisible
end


---------------------------------------
---------------------------------------
---------------------------------------
-----------------MENU------------------
---------------------------------------
---------------------------------------
---------------------------------------
function GUI.drawStartText()
    TriggerEvent("mt:missiontext", "Hey ! Pssst ! Do you want to make easy money ? Press ~r~H~w~ to start.", 500)
    --GUI.showStartText = true
end

function GUI.renderMenu(menu)
    GUI.renderTitle()
    GUI.renderDesc()
    GUI.renderButtons(menu)
	TriggerEvent("mt:missiontext", "Done", 5000)
end

function GUI.init()
    GUI.loaded = true
    GUI.addTitle("You're a killer now.", 0.425, 0.19, 0.45, 0.07 )
    GUI.addDesc("Choose a target.", 0.575, 0.375, 0.15, 0.30 )

    --menu, title, function, position
	--GUI.addButton(0, "Ballas", GUI.optionMisson, 0.35, 0.25, 0.3, 0.05 )
    --GUI.addButton(0, "Aztecas", GUI.optionMisson, 0.35, 0.30, 0.3, 0.05 )
    --GUI.addButton(0, "Lost MC", GUI.optionMisson, 0.35, 0.35, 0.3, 0.05 )
    --GUI.addButton(0, "Log trailer", GUI.optionMisson, 0.35, 0.40, 0.3, 0.05 )
    --GUI.addButton(0, " ", GUI.null, 0.35, 0.45, 0.3, 0.05)
    --GUI.addButton(0, "Exit Menu", GUI.exit, 0.35, 0.50, 0.3, 0.05 )

    GUI.buttonCount = 0

    GUI.addButton(0, "Mission 1 [ 5.000$ ]", GUI.mission, 0.35, 0.25, 0.3, 0.05)
    GUI.addButton(0, "Mission 2 [ 10.000$ ]", GUI.mission, 0.35, 0.30, 0.3, 0.05)
    GUI.addButton(0, "Mission 3 [ 15.000$ ]", GUI.mission, 0.35, 0.35, 0.3, 0.05)
    GUI.addButton(0, "Mission 4 [ 20.000$ ]", GUI.mission, 0.35, 0.40, 0.3, 0.05)
    GUI.addButton(0, "Mission 5 [ 30.000$ ]", GUI.mission, 0.35, 0.45, 0.3, 0.05)
    GUI.addButton(0, "For Testing! [ 1.337$ ]", GUI.mission, 0.35, 0.50, 0.3, 0.05)
    GUI.addButton(0, "Exit Menu", GUI.exit, 0.35, 0.55, 0.3, 0.05)
end

--Render stuff
function GUI.renderTitle()
    for id, settings in pairs(GUI.title) do
        local screen_w = 0
        local screen_h = 0
        screen_w, screen_h = GetScreenResolution(0,0)
        boxColor = {0,0,0,255}
		SetTextFont(0)
		SetTextScale(0.0, 0.40)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropshadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
        AddTextComponentString(settings["name"])
        DrawText((settings["xpos"] + 0.001), (settings["ypos"] - 0.015))
        --AddTextComponentString(settings["name"])
        GUI.renderBox(
            settings["xpos"], settings["ypos"], settings["xscale"], settings["yscale"],
            boxColor[1], boxColor[2], boxColor[3], boxColor[4]
        )
    end
end

function GUI.renderDesc()
		for id, settings in pairs(GUI.desc) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,240}
		SetTextFont(0)
		SetTextScale(0.0, 0.37)
		SetTextColour(255, 255, 255, 255)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"] .. "\n" .."\n" .."Navigate with" .. "\n" .. "arrows." .. "\n" .. "ENTER to Select".. "\n" .."Hold H to Detach" .. "\n" .. "Trailer")
		DrawText((settings["xpos"] - 0.06), (settings["ypos"] - 0.13))
		AddTextComponentString(settings["name"])
		GUI.renderBox(
            settings["xpos"], settings["ypos"], settings["xscale"], settings["yscale"],
            boxColor[1], boxColor[2], boxColor[3], boxColor[4]
        )
		end
end

function GUI.renderButtons(menu)
	for id, settings in pairs(GUI.button[menu]) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,100}
		if(settings["active"]) then
			boxColor = {r,g,b,alpha}
		end
		SetTextFont(0)
		SetTextScale(0.0, 0.35)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		DrawText((settings["xpos"] + 0.001), (settings["ypos"] - 0.015))
		--AddTextComponentString(settings["name"])
		GUI.renderBox(
            settings["xpos"], settings["ypos"], settings["xscale"],
            settings["yscale"], boxColor[1], boxColor[2], boxColor[3], boxColor[4]
        )
	 end
end

function GUI.renderBox(xpos, ypos, xscale, yscale, color1, color2, color3, color4)
	DrawRect(xpos, ypos, xscale, yscale, color1, color2, color3, color4);
end

--adding stuff
function GUI.addTitle(name, xpos, ypos, xscale, yscale)
	GUI.title[GUI.titleCount] = {}
	GUI.title[GUI.titleCount]["name"] = name
	GUI.title[GUI.titleCount]["xpos"] = xpos
	GUI.title[GUI.titleCount]["ypos"] = ypos
	GUI.title[GUI.titleCount]["xscale"] = xscale
	GUI.title[GUI.titleCount]["yscale"] = yscale
end

function GUI.addDesc(name, xpos, ypos, xscale, yscale)
	GUI.desc[GUI.descCount] = {}
	GUI.desc[GUI.descCount]["name"] = name
	GUI.desc[GUI.descCount]["xpos"] = xpos
	GUI.desc[GUI.descCount]["ypos"] = ypos
	GUI.desc[GUI.descCount]["xscale"] = xscale
	GUI.desc[GUI.descCount]["yscale"] = yscale
end

function GUI.addButton(menu, name, func, xpos, ypos, xscale, yscale)
    if(not GUI.button[menu]) then
        GUI.button[menu] = {}
        GUI.selected[menu] = 0
    end
    GUI.button[menu][GUI.buttonCount] = {}
	GUI.button[menu][GUI.buttonCount]["name"] = name
	GUI.button[menu][GUI.buttonCount]["func"] = func
	GUI.button[menu][GUI.buttonCount]["xpos"] = xpos
	GUI.button[menu][GUI.buttonCount]["ypos"] = ypos
	GUI.button[menu][GUI.buttonCount]["xscale"] = xscale
	GUI.button[menu][GUI.buttonCount]["yscale"] = yscale
    GUI.button[menu][GUI.buttonCount]["active"] = 0
    GUI.buttonCount = GUI.buttonCount + 1
end

function GUI.null()
end

function GUI.exit()
    GUI.showMenu = false
	print("Exit menu")
end

--update stuff
function GUI.updateSelectionMenu(menu)
    if( IsControlPressed(0, Keys["DOWN"]) ) then
        if( GUI.selected[menu] < #GUI.button[menu] ) then
            GUI.selected[menu] = GUI.selected[menu] + 1
        end
    elseif( IsControlPressed(0, Keys["TOP"]) ) then
        if( GUI.selected[menu] > 0 ) then
            GUI.selected[menu] = GUI.selected[menu] - 1
        end
    elseif( IsControlPressed(0, Keys["ENTER"]) ) then
        if( type(GUI.button[menu][GUI.selected[menu]]["func"]) == "function" ) then
            --remember variable GUI.selected[menu]

            --call mission functions
            GUI.button[menu][GUI.selected[menu]]["func"](GUI.selected[menu])

            GUI.selected[menu] = 0
            if( not GUI.menu ) then
                GUI.menu = -1
            end
            Wait(100)

            --GUI.button[menu][GUI.selected[menu]]["func"](GUI.selected[menu])
        else
            Citizen.Trace("\n Failed to call function! - Selected Menu: "..GUI.selected[menu].." \n")
        end
        GUI.time = 0
    end
    local i = 0
    for id, settings in ipairs(GUI.button[menu]) do
        GUI.button[menu][i]["active"] = false
        if( i == GUI.selected[menu] ) then
            GUI.button[menu][i]["active"] = true
        end
        i = i + 1
    end
end