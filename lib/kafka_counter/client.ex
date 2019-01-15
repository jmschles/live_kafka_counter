defmodule KafkaCounter.Client do
  def increment do
    GenServer.cast(KCStore, :increment)
  end

  def decrement do
    GenServer.cast(KCStore, :decrement)
  end

  def fetch do
    GenServer.call(KCStore, :fetch)
  end
end
