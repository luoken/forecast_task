defmodule Forecast do
  def get_weather(arg) do
    arg
    |> get_list_of_weather()
    |> get_date_temp()
  end

  defp get_list_of_weather(arg) do
    [city, state] =
      List.to_string(arg)
      |> String.split(",")

    response =
      HTTPoison.get!(
        "api.openweathermap.org/data/2.5/forecast?q=#{city},#{state}&appid=#{
          System.get_env("OPEN_WEATHER_API")
        }&units=imperial"
      )

    {:ok, %{"list" => list_of_temps}} = Jason.decode(response.body)

    Enum.filter(list_of_temps, fn temp -> Regex.match?(~r/\s12/, temp["dt_txt"]) == true end)
  end

  defp get_date_temp(list) do
    Enum.map(list, fn day ->
      %{date: List.first(String.split(day["dt_txt"])), temp: day["main"]["temp"]}
    end)
    |> Enum.each(fn day -> IO.inspect(day) end)
  end
end
