defmodule Mix.Tasks.Forecast do
  use Mix.Task

  def run(arg) do
    HTTPoison.start()
    Forecast.get_weather(arg)
  end
end
