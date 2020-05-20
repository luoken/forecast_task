defmodule Forecast do
  @spec get_weather(arg :: String.t()) :: {:ok, list(map)} | {:error, String.t()}
  def get_weather(arg) do
    api_link_builder(arg)
    |> HTTPoison.get()
    |> get_weather_data()
  end

  @spec api_link_builder(city_state :: String.t()) :: String.t()
  defp api_link_builder(city_state) do
    "https://api.weatherbit.io/v2.0/forecast/daily?city=#{city_state}&country=US&key=#{
      System.get_env("WEATHERBIT_API")
    }&units=I&days=5"
  end

  @spec get_weather_data({:ok, map}) :: {:ok, list(map)} | {:error, String.t()}
  defp get_weather_data({:ok, %{body: body}}) do
    case Jason.decode(body) do
      {:ok, %{"data" => data}} ->
        {:ok, data}

      {:ok, %{"error" => "Invalid Parameters supplied."}} ->
        {:error, "No city or state has been supplied"}

      {:ok, %{"error" => error}} ->
        {:error, error}

      {:error, _error} ->
        {:error, "Invalid city or state has been supplied"}
    end
  end

  @spec get_weather_data({:error, map}) :: {:error, String.t()}
  defp get_weather_data({:error, _}) do
    {:error, "Error contacting API"}
  end
end
