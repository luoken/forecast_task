defmodule ForcastTest do
  use ExUnit.Case
  doctest Forcast

  test "greets the world" do
    assert Forcast.hello() == :world
  end
end
