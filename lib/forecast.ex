defmodule Forecast do
  def get_weather(arg) do
    get_api_url(arg)
    |> get_weather_data()
  end

  defp get_api_url(city_state) do
    HTTPoison.get!(
      "https://api.weatherbit.io/v2.0/forecast/daily?city=#{city_state}&country=US&key=#{
        System.get_env("WEATHERBIT_API")
      }&units=I&days=5"
    )
  end

  defp get_weather_data(%{body: body}) do
    case Jason.decode(body) do
      {:ok, %{"data" => data}} ->
        {:ok, data}

      {:ok, %{"error" => _error}} ->
        {:error, "No city or state has been supplied"}

      {:error, _error} ->
        {:error, "Invalid city or state has been supplied"}
    end
  end
end
