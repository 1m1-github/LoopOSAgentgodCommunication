module LoopOSAgentgodCommunication

using ZMQ
using TheoryOfGod: ○
using TheoryOfGodgod: god, ∃!
using TheoryOfGodCommunication

const CREATESOCKET = Socket(REQ)
const OBSERVESOCKET = Socket(REQ)

function init(createipc, observeipc)
    connect(CREATESOCKET, createipc)
    connect(OBSERVESOCKET, observeipc)
end
function create(g::god, ϕ)
    x = SA[○, ○]
    a = TheoryOfGodCommunication.∃2d(g, x, x, ϕ)
    TheoryOfGodCommunication.send(CREATESOCKET, a)
    recv(CREATESOCKET)
end
function create2d(g::god, μ, ρ, ϕ)
    a = TheoryOfGodCommunication.∃2d(g, μ, ρ, ϕ)
    TheoryOfGodCommunication.send(CREATESOCKET, a)
    recv(CREATESOCKET)
end
function create3d(g::god, μ, ρ, ϕ)
    a = TheoryOfGodCommunication.∃3d(g, μ, ρ, ϕ)
    TheoryOfGodCommunication.send(CREATESOCKET, a)
    recv(CREATESOCKET)
end
function createNd(d, μ, ρ, ∂, ϕ)
    a = TheoryOfGodCommunication.∃Nd(d, μ, ρ, ∂, ϕ)
    TheoryOfGodCommunication.send(CREATESOCKET, a)
    recv(CREATESOCKET)
end
function observe(g::god)
    TheoryOfGodCommunication.send(OBSERVESOCKET, g)
    recv(OBSERVESOCKET)
end

end
