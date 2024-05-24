defmodule Qwazar.Core.SlottedEntity do
  use Qwazar.Core.Slots

  slot :string_slot, :string
  slot :string_slot, :string, meta_key: :meta_val
end
