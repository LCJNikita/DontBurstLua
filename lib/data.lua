-- Simple library to save/get/update data from saved json file

local data = {};
local loadsave = require("lib.loadsave");

function data:init()
	local storage = {};
	storage.options = {};
	storage.saves = {};
	storage.levels = {};

	data.storage = storage;
end

function data:save()
	loadsave.saveTable(data.storage, "storage.json");
	print("data saved")
end

function data:update(option, val)
	local storage = data.storage;
	local options = storage.options;
	if(options[option])then
		options[option] = val;
	else
		options[option] = val;
	end
end

function data:get(option)
	local options = data.storage.options;
	if(options[option]~=nil)then
		return options[option];
	else
		print("no field "..option);
		return false
	end
end

function data:load()
	local storage = loadsave.loadTable("storage.json");
	if(storage)then
		data.storage = storage;
		print("data loaded")
	else
		data:init();
		data:save();
	end
end

function data:wipe()
	data:init();
	data:save();
	print("data wiped")
end

return data

