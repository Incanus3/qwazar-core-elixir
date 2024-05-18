defmodule Qwazar.Core.MapStoreTest do
  use ExUnit.Case

  alias Qwazar.Core.EntityStore
  alias Qwazar.Core.MapStorage
  alias Qwazar.Domain.Car

  test "it works" do
    store = EntityStore.new(MapStorage)
    entity = %Car{id: 1}

    assert EntityStore.all(store) == []
    assert EntityStore.find(store, 1) == :error

    EntityStore.save(store, entity)

    assert EntityStore.all(store) == [entity]
    assert EntityStore.find(store, 1) == {:ok, entity}
    assert EntityStore.find(store, 666) == :error

    EntityStore.delete(store, 1)

    assert EntityStore.all(store) == []
    assert EntityStore.find(store, 1) == :error
  end
end
