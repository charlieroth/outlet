defmodule OutletTest do
  use ExUnit.Case
  doctest Outlet

  test "greets the world" do
    assert Outlet.hello() == :world
  end
end
