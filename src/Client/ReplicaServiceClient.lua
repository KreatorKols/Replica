--[=[
	Wraps Mad's ReplicaClient so that it's initialized and ready for anybody to use
	@class ReplicaServiceClient
]=]

local require = require(script.Parent.loader).load(script)

-- local Maid = require("Maid")
local ReplicaClient = require("ReplicaClient")

local ReplicaServiceClient = {}
ReplicaServiceClient.ServiceName = "ReplicaServiceClient"

function ReplicaServiceClient:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")
	-- self._maid = Maid.new()

	-- External
	self.Replica = ReplicaClient
	ReplicaClient.RequestData()
end

-- function ReplicaServiceClient:Start() end

function ReplicaServiceClient:Destroy()
	-- self._maid:DoCleaning()
end

return ReplicaServiceClient
