Citizen.CreateThread( function()
	while true do 

	
		local maxspeed = GetVehicleMaxSpeed(vehicleModel)
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		local currentcarspeed = GetEntitySpeed(vehicle)
		local mph = 3.6
		local class = GetVehicleClass(vehicle)
		local vehicleModel = GetEntityModel(vehicle)

		
		if class ~= 16 then
			--if ped is in vehicle 
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				if IsVehicleOnAllWheels(vehicle) == false then
					--set vehicle speed to 50 MPH
						--gradually decrease vehicle engine health
					SetVehicleEngineHealth(vehicle, GetVehicleEngineHealth(vehicle) - 4.0)
					Citizen.Wait(5000)
					--gradually decrease vehicle body health
					SetVehicleBodyHealth(vehicle, GetVehicleBodyHealth(vehicle) - 4.0)
					Citizen.Wait(5000)
					--gradually decrease vehicle fuel level
					SetVehicleFuelLevel(vehicle, GetVehicleFuelLevel(vehicle) - 1.0)
                    Citizen.Wait(5000)
					--gradually decrease vehicle speed
					--SetVehicleForwardSpeed(vehicle, GetEntitySpeed(vehicle) - 2.0)
					SetVehicleSteeringAngle(vehicle, 10.0)
					ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.04)
                    TriggerServerEvent("stress:add", 5000)
                    Citizen.Wait(5000)
				else
					--set vehicle speed to 50 MPH
					SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), maxspeed)        
				
				 end
			else
			
				--print("All ok")
			end
		
			if math.floor(currentcarspeed*mph) == 260 then      -----<<<<< Enter the maximum speed
				setspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
				SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), setspeed)
                --if vehicle is on off road then print its on off road
                
			end
		else

			SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), maxspeed)
		end

		Citizen.Wait(0)  
		 
	end

end)