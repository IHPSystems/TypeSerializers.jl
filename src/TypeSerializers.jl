module TypeSerializers

import Serialization: serialize, deserialize

export AbstractTypeSerializer, SerializationTypeSerializer, serialize, deserialize

abstract type AbstractTypeSerializer{T} end

abstract type SerializationTypeSerializer{T} <: AbstractTypeSerializer{T} end

function serialize(::Type{TSerializer}, value::T)::IO where {T, TSerializer <: SerializationTypeSerializer{T}}
    stream = IOBuffer(UInt8[], read = true, write = true)
    serialize(stream, value)
    return stream
end

function deserialize(::Type{TSerializer}, stream::IO)::T where {T, TSerializer <: SerializationTypeSerializer{T}}
    value = deserialize(stream)
    return value
end

end # module
