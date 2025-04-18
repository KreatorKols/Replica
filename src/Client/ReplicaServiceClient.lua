--[=[
	Wraps Mad's ReplicaClient to ensure single intialization
	@class ReplicaServiceClient
]=]

local require = require(script.Parent.loader).load(script)

local Maid = require("Maid")
local ReplicaClient = require("ReplicaClient")
local Observable = require("Observable")

local ReplicaServiceClient = {}
ReplicaServiceClient.ServiceName = "ReplicaServiceClient"

function ReplicaServiceClient:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")
	-- self._maid = Maid.new()

	-- External
	self.ReplicaClient = ReplicaClient
	ReplicaClient.RequestData()
end

function ReplicaServiceClient:ObserveReplica(token)
	return Observable.new(function(subscriber)
		local madConnection = self.ReplicaClient.OnNew(token, function(data)
			subscriber:Fire(data)
		end)

		return function ()
			madConnection:Disconnect()
		end
	end)
end

return ReplicaServiceClient
