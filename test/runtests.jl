using TypeSerializers
using Test

struct Foo
    i::Int
    s::String
end

@testset "TypeSerializers" begin
    integer_value = 42
    stream = serialize(SerializationTypeSerializer{Int}, integer_value)
    seekstart(stream)
    @test deserialize(SerializationTypeSerializer{Int}, stream) == integer_value

    string_value = "Hello World!"
    stream = serialize(SerializationTypeSerializer{String}, string_value)
    seekstart(stream)
    @test deserialize(SerializationTypeSerializer{String}, stream) == string_value

    foo_value = Foo(integer_value, string_value)
    stream = serialize(SerializationTypeSerializer{Foo}, foo_value)
    seekstart(stream)
    @test deserialize(SerializationTypeSerializer{Foo}, stream) == foo_value
end
