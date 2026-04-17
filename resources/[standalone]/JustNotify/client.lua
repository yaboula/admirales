function Notify(title, message, time, type)
	SendNUIMessage({
		action = 'sendNotify',
		title = title,
		message = message,
		time = time,
		type = type,
	})
end

local function NormalizeNotifyType(notifyType)
	local map = {
		info = 'info',
		inform = 'info',
		success = 'success',
		error = 'error',
		warning = 'warning',
		police = 'info',
		ambulance = 'info',
		primary = 'info',
	}

	local key = type(notifyType) == 'string' and string.lower(notifyType) or 'info'
	return map[key] or 'info'
end

local function NotifyFromPayload(data)
	if type(data) ~= 'table' then return end

	local notifyType = NormalizeNotifyType(data.type)
	local title = data.caption or data.title or 'Notification'
	local message = data.text or data.message or title
	local time = data.length or data.time or 5000

	Notify(title, message, time, notifyType)
end

RegisterNetEvent('JustNotify:sendNotification')
AddEventHandler('JustNotify:sendNotification', function(title, message, time, type)
	Notify(title, message, time, type)
end)

-- Compatibility shim for scripts still triggering mythic notify events.
RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	NotifyFromPayload(data)
end)

RegisterNetEvent('mythic_notify:client:PersistentHudText')
AddEventHandler('mythic_notify:client:PersistentHudText', function(data)
	if type(data) ~= 'table' then return end
	if type(data.action) == 'string' and data.action:upper() == 'START' then
		NotifyFromPayload(data)
	end
end)

if Config.Debug then
	RegisterCommand('success', function()
		Notify("Success", "This is a <span style='color:#89da46'>success</span> notification!", 5000, 'success')
	end)

	RegisterCommand('info', function()
		Notify("Information", "This is a <span style = 'color:#418dff'>inform</span> notification!", 5000, 'info')
	end)

	RegisterCommand('error', function()
		Notify("Error", "This is a <span style = 'color:#ff392d'>error</span> notification!", 5000, 'error')
	end)

	RegisterCommand('warning', function()
		Notify("Warning", "This is a <span style = 'color:#ffa800'>warning</span> notification!", 5000, 'warning')
	end)

	RegisterCommand("allTogether", function()
		Wait(5000)
		
		Wait(1000)
		Notify("Success", "This is a <span style='color:#89da46'>success</span> notification!", 5000, 'success')
		Wait(1000)
		Notify("Information", "This is a <span style = 'color:#418dff'>inform</span> notification!", 5000, 'info')
		Wait(1000)
		Notify("Error", "This is a <span style = 'color:#ff392d'>error</span> notification!", 5000, 'error')
		Wait(1000)
		Notify("Warning", "This is a <span style = 'color:#ffa800'>warning</span> notification!", 5000, 'warning')
	end)

end

exports("Notify", Notify)