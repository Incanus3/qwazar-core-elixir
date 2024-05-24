defmodule Qwazar.Core.MapStorage do
  alias Qwazar.Core.Entity
  alias Qwazar.Core.EntityStorage

  use Agent

  @behaviour EntityStorage

  @impl true
  def new(_opts) do
    {:ok, pid} = Agent.start_link(fn -> Map.new() end)
    pid
  end

  @impl true
  def all(pid) do
    Agent.get(pid, &Map.values/1)
  end

  @impl true
  def find(pid, id) do
    Agent.get(pid, fn map -> Map.fetch(map, id) end)
  end

  @impl true
  def save(pid, entity) do
    Agent.update(pid, fn map -> Map.put(map, Entity.id(entity), entity) end)
  end

  @impl true
  def delete(pid, id) do
    Agent.update(pid, fn map -> Map.delete(map, id) end)
  end
end
