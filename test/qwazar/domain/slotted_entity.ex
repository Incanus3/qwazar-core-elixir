defmodule Qwazar.Core.SlottedEntity do
  use Qwazar.Core.Slots

  slot :int_slot, :int
  slot :string_slot, :string, meta_key: :meta_val
end
