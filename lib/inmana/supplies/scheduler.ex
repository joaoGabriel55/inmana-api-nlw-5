defmodule Inmana.Supplies.Scheduler do
  # Behavior
  use GenServer

  alias Inmana.Supplies.ExpirationNotifier

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # \\ -> default value
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # # async
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # # sync
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotifier.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    # schedule_time = 1000 * 60 * 60 * 24 * 7 # One week
    schedule_time = 1000 * 10
    Process.send_after(self(), :generate, schedule_time)
  end
end
