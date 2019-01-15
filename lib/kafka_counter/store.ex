defmodule KafkaCounter.Store do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(_args) do
    {:ok, 0}
  end

  def handle_cast(:increment, count) do
    {:noreply, count + 1}
  end

  def handle_cast(:decrement, count) do
    {:noreply, count - 1}
  end

  def handle_call(:fetch, _from, count) do
    {:reply, Integer.to_string(count), count}
  end
end
