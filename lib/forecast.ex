defmodule Forecast do
  def get_weather(arg) do
    get_list_of_weather(arg)
    |> get_date_temp()
  end

  defp get_list_of_weather(city_state) do
    response =
      HTTPoison.get!(
        "https://api.weatherbit.io/v2.0/forecast/daily?city=#{city_state}&country=US&key=#{
          System.get_env("WEATHERBIT_API")
        }&units=I&days=5"
      )

    {:ok, %{"data" => data}} = Jason.decode(response.body)
    data
  end

  defp get_date_temp(list) do
    Enum.map(list, fn day ->
      %{date: day["datetime"], temp: day["temp"]}
    end)
    |> Enum.each(fn day -> IO.inspect(day) end)
  end
end
