defmodule Qwazar.Core.SlotsTest do
  alias Qwazar.Core.SlottedEntity

  use ExUnit.Case

  test "it works" do
    # SlottedEntity.__info__(:attributes) |> dbg()
    # Slots.__info__(:compile) |> dbg()
    # Slots.__info__(:functions) |> dbg()
    # Slots.__info__(:macros) |> dbg()
    # Slots.__info__(:module) |> dbg()
    # Slots.__info__(:struct) |> dbg()

    SlottedEntity.slots() |> dbg()

    # Module.attributes_in(Slots) |> dbg()
  end
end
