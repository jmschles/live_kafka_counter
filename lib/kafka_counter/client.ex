defmodule KafkaCounter.Client do
  def increment do
    GenServer.call(KCStore, :increment)
  end

  def decrement do
    GenServer.call(KCStore, :decrement)
  end

  def fetch do
    GenServer.call(KCStore, :fetch)
  end

  def reset do
    GenServer.call(KCStore, :reset)
  end
end
