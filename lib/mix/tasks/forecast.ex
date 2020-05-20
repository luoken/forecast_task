defmodule Mix.Tasks.Forecast do
  use Mix.Task

  @shortdoc "Returns a 5 day forecast for a city located in the US."
  @moduledoc """
    `mix forecast LosAngeles,CA` will return the 5 day forecast for Los Angeles, CA.

    alternatively you are also able to yield the same results with the following commands:

    `mix forecast Los-Angeles,CA` and `mix forecast Los_Angeles,CA`

    `mix forecast` will return an error stating no city has been supplied.  

    `mix forecast donkeyking,island` will return an error stating invalid city or state has been supplied  
  """

  @spec run(arg :: list(String.t())) :: {:ok, list(map)} | {:error, String.t()}
  def run(arg) do
    Application.ensure_all_started(:httpoison)

    city_state = List.first(arg)

    case Forecast.get_weather(city_state) do
      {:ok, list_of_dates} ->
        Enum.each(list_of_dates, fn day ->
          IO.puts("#{day["datetime"]} with a temperature of #{day["temp"]} degrees")
        end)

      {:error, error} ->
        Mix.shell().error(error)
    end
  end
end
