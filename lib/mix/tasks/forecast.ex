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

  @spec run(arg :: list(binary)) :: {:ok, list(map)} | {:error, binary}
  def run(arg) do
    Application.ensure_all_started(:httpoison)

    case Forecast.get_weather(arg) do
      {:ok, list_of_dates} ->
        Enum.each(list_of_dates, fn day ->
          IO.puts("#{day["datetime"]} with a temperature of #{day["temp"]} degrees")
        end)

      {:error, error} ->
        Mix.shell().error(error)
    end
  end
end
