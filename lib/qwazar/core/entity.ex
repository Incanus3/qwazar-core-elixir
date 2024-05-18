defprotocol Qwazar.Core.Entity do
  @type id :: any
  @type attributes :: %{atom => any}

  @spec id(entity :: t()) :: id
  def id(entity)

  @spec attributes(entity :: t()) :: attributes
  def attributes(entity)
end

defmodule Qwazar.Core.StructEntity do
  import Kernel, only: [defmacro: 2]

  defmacro __using__(_opts) do
    quote do
      defstruct [:id, attributes: %{}]

      defimpl Qwazar.Core.Entity, for: __MODULE__ do
        def id(%{id: id}), do: id
        def attributes(%{attributes: attributes}), do: attributes
      end
    end
  end
end
