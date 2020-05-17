defmodule Forecast do
  def get_weather(arg) do
    [city, state] = get_city_state(arg)

    get_list_of_weather(city, state)
    |> get_date_temp()
  end

  defp get_city_state(arg) do
    arg
    |> List.to_string()
    |> String.split(",")
  end

  defp get_list_of_weather(city, state) do
    response =
      HTTPoison.get!(
        "https://api.weatherbit.io/v2.0/forecast/daily?city=#{city},#{state}&key=#{
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
