Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("pawnDuty", vector3(163.86, -1318.61, 29.34), 1, 1.2, {
		name = "Pawnshop Duty",
		heading = 53.2,
		debugpoly = false,
		minZ=28.0,
		maxZ=31.6,
	}, {
		options = {
		    {
			event = "qb-pawn:DutyPawn",
			icon = "fas fa-ring",
			label = "Clock On/Off",
			job = "pawnshop",
		    },
		},
		distance = 2.5
	})

		exports['qb-target']:AddBoxZone("pawntray1", vector3(175.74, -1317.04, 30.33), 0.5, 0.7, {
			name = "pawntray1",
			heading = 87.8,
			debugpoly = false,
			minZ=28.0,
			maxZ=31.0,
		}, {
			options = {
			    {
				event = "qb-pawn:Tray1",
				icon = "fas fa-ring",
				label = "Leave your items here",
			    },
			},
			distance = 1.5
		})

	exports['qb-target']:AddBoxZone("pawntray2", vector3(173.1, -1318.84, 30.32), 0.5, 0.7, {
		name="pawntray2",
		heading=87.8,
		debugpoly = false,
		minZ=28.0,
		maxZ=31.0,
	}, {
		options = {
		    {
			event = "qb-pawn:Tray2",
			icon = "fas fa-ring",
			label = "Leave your items here",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("pawntray3", vector3(173.62, -1322.82, 30.33), 1.6, 4.6, {
		name="pawntray3",
		heading=89,
		debugpoly = false,
		minZ=28.0,
		maxZ=31.0,
	}, {
		options = {
		    {
			event = "qb-pawn:Tray3",
			icon = "fas fa-ring",
			label = "Leave your items here",
		    },
		},
		distance = 3.5
	})

        exports['qb-target']:AddBoxZone("pawnStorage", vector3(169.25, -1316.03, 29.34), 1.6, 1, {
            name="Pawn Storage",
            heading=58.88,
            debugpoly = false,
            minZ=28.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "qb-pawn:Storage",
                        icon = "fas fa-garage",
                        label = "Storage",
                        job = "pawnshop",
                    },
                },
                distance = 1.5
            })

            exports['qb-target']:AddBoxZone("pawnStorage2", vector3(170.7, -1314.16, 29.34), 1.6, 1, {
                name="Pawn Storage",
                heading=356.92,
                debugpoly = false,
                minZ=28.0,
                maxZ=31.0,
            }, {
                    options = {
                        {
                            event = "qb-pawn:Storage2",
                            icon = "fas fa-garage",
                            label = "Storage",
                            job = "pawnshop",
                        },
                    },
                    distance = 1.5
                })

        exports['qb-target']:AddBoxZone("pawn_register_1", vector3(173.69, -1317.48, 30.63), 0.5, 0.4, {
            name="pawn_register_1",
            debugpoly = false,
            heading=233.89,
            minZ=28.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "qb-pawn:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "pawnshop",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("pawn_register_2", vector3(-584.25, -1061.5, 22.37), 0.6, 0.5, {
            name="pawn_register_2",
            debugpoly = false,
            heading=270,
            minZ=21.0,
            maxZ=22.8,
        }, {
                
                options = {
                    {
                        event = "qb-pawn:bill",
                        parms = "2",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "pawnshop",
                    },
                },
                distance = 1.5
            })
end)

RegisterNetEvent('pawn:stock', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "| Storage |",
            isMenuHeader = true,
        },
        {
            header = "• Browse Stock",
            txt = "Availability access",
            params = {
                event = "qb-pawn:shop"
            }
        },
        {
            header = "• Open Storage",
            txt = "See what you have in storage",
            params = {
                event = "qb-pawn:Storage"
            }
        },
        {
            header = "⬅ Close Menu",
            txt = 'Kaching!',
            params = {
                event = 'qb-menu:closeMenu',
            }
        },
    })
end)

-- Register --

RegisterNetEvent("qb-pawn:bill", function()
    local bill = exports["qb-input"]:ShowInput({
        header = "Create Receipt",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                name = "id",
                text = 'State ID',
                isRequired = true,
            },
            {
                type = 'number',
                name = "amount",
                text = '$',
                isRequired = true
            },
        }
    })
    if bill ~= nil then
        if not bill.id or not bill.amount then
            return
        end
        TriggerServerEvent("qb-pawn:bill:player", bill.id, bill.amount)
    end
end)