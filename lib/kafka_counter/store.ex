defmodule KafkaCounter.Store do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(_args) do
    {:ok, 0}
  end

  def handle_call(:increment, _from, count) do
    new_count = count + 1
    {:reply, Integer.to_string(new_count), new_count}
  end

  def handle_call(:decrement, _from, count) do
    new_count = count - 1
    {:reply, Integer.to_string(new_count), new_count}
  end

  def handle_call(:fetch, _from, count) do
    {:reply, Integer.to_string(count), count}
  end

  def handle_call(:reset, _from, _count) do
    {:reply, "0", 0}
  end
end
