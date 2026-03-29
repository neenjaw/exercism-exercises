# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{registry: %{}, next_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.registry |> Map.values() end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      plot = %Plot{plot_id: state.next_id, registered_to: register_to}
      updated_plots = Map.put(state.registry, state.next_id, plot)

      next_state = %{ state | registry: updated_plots, next_id: state.next_id + 1 }
      {plot, next_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn state ->
      updated_plots = Map.delete(state.registry, plot_id)

      next_state = %{ state | registry: updated_plots }
      {:ok, next_state}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state -> state.registry[plot_id] || {:not_found, "plot is unregistered"} end)
  end
end
