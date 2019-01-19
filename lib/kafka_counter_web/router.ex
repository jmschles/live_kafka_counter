defmodule KafkaCounterWeb.Router do
  use KafkaCounterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/kc", KafkaCounterWeb do
    pipe_through :browser

    get "/increment", PageController, :increment
    get "/decrement", PageController, :decrement
    get "/reset", PageController, :reset
    get "/", PageController, :index
  end
end
