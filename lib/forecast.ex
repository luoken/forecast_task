defmodule Forecast do

  @spec get_weather(arg :: list(binary)) :: {:ok, list(map)} | {:error, binary}
  def get_weather(arg) do
    get_api_url(arg)
    |> get_weather_data()
  end


  @spec get_api_url(city_state :: list(binary)) :: map
  defp get_api_url(city_state) do
    api_link =
      "https://api.weatherbit.io/v2.0/forecast/daily?city=#{city_state}&country=US&key=#{
        System.get_env("WEATHERBIT_API")
      }&units=I&days=5"

    HTTPoison.get!(api_link)
  end

  @spec get_weather_data(map) :: {:ok, list(map)} | {:error, binary}
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
