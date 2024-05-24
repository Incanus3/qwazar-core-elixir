defmodule Qwazar.Core.Slot do
  @enforce_keys [:name, :type]
  defstruct [:name, :type, meta: []]
end

defmodule Qwazar.Core.Slots do
  defmacro slot(name, type, meta \\ []) do
    quote do
      @slots %Qwazar.Core.Slot{name: unquote(name), type: unquote(type), meta: unquote(meta)}
    end
  end

  defmacro __using__(_opts) do
    quote do
      Module.register_attribute(__MODULE__, :slots, accumulate: true, persist: true)

      import Qwazar.Core.Slots, only: [slot: 2, slot: 3]

      @before_compile Qwazar.Core.Slots
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def slots, do: @slots |> Enum.reverse()
    end
  end
end
