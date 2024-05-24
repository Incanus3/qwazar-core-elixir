defmodule Qwazar.Core.EntityStorage do
  alias Qwazar.Core.Entity

  @type storage :: any

  @callback new(opts :: keyword()) :: storage
  @callback all(storage) :: list(Entity.t())
  @callback find(storage, Entity.id()) :: {:ok, Entity.t()} | :error
  @callback save(storage, Entity.t()) :: Entity.id()
  @callback delete(storage, Entity.id()) :: :ok
end

defmodule Qwazar.Core.EntityStore do
  defstruct [:module, :instance]

  def new(storage_mod, opts \\ []) do
    %__MODULE__{module: storage_mod, instance: apply(storage_mod, :new, [opts])}
  end

  def all(store) do
    apply(store.module, :all, [store.instance])
  end

  def find(store, id) do
    apply(store.module, :find, [store.instance, id])
  end

  def save(store, entity) do
    apply(store.module, :save, [store.instance, entity])
  end

  def delete(store, id) do
    apply(store.module, :delete, [store.instance, id])
  end
end
