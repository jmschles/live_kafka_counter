defmodule KafkaCounterWeb.PageController do
  use KafkaCounterWeb, :controller

  alias KafkaCounter.Client

  def index(conn, _params) do
    count = Client.fetch()
    render(conn, :index, count: count)
  end

  def increment(conn, _params) do
    Client.increment()

    send_resp(conn, 200, "")
  end

  def decrement(conn, _params) do
    Client.decrement()

    send_resp(conn, 200, "")
  end
end
