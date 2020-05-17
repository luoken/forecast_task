# Forecast

A simple example showing phoenix's mix task. Input should be as follows: `mix forcast Pasadena,CA`

This task uses weatherbit.io as an api.

Sign up for api [here](https://www.weatherbit.io/) and stick it inside your bash profile as `WEATHERBIT_API`

By default, the settings have been set to show Fahrenheit and shows only 5 days.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `forecast` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:forecast, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/forecast](https://hexdocs.pm/forecast).

