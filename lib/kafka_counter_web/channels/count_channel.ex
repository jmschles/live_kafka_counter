defmodule KafkaCounterWeb.CountChannel do
  use Phoenix.Channel

  alias KafkaCounter.Client

  def join("count:public", _message, socket) do
    {:ok, socket}
  end

  def join("counter:" <> _something_else, _params, _socket) do
    {:error, %{reason: "unrecognized channel"}}
  end

  def handle_in("count_update", %{"command" => "increment"}, socket) do
    broadcast!(socket, "count_update", %{count: Client.increment()})
    {:noreply, socket}
  end

  def handle_in("count_update", %{"command" => "decrement"}, socket) do
    broadcast!(socket, "count_update", %{count: Client.decrement()})
    {:noreply, socket}
  end
end
