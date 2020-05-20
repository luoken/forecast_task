# Forecast

A mix task showing a 5 day forecast for a city and state in the US. The output is displayed in fahrenheit.

This task uses weatherbit.io as an api.

Sign up for api [here](https://www.weatherbit.io/) and put the api key into your bash profile as `WEATHERBIT_API`


## Usage
When a valid city and state has been passed in, it will return the following.
```
> mix forecast LosAngeles,CA
  2020-05-18 with a temperature of 62.1 degrees
  2020-05-19 with a temperature of 60.6 degrees
  2020-05-20 with a temperature of 55.4 degrees
  2020-05-21 with a temperature of 57.5 degrees
  2020-05-22 with a temperature of 60.9 degrees
```

When querying cities that have spaces in-between or hyphens, we can run as such and will yield the same results
```
> mix forecast Los-Angeles,CA

> mix forecast Los_Angeles,CA

```

When no parameters has been passed in, it will return
```
> mix forecast
  No city or state has been supplied
```

And when an invalid city or state has been passed in, it will return
```
> mix forecast donkeykong,island
  Invalid city or state has been supplied
```

To get a list of commands to run, you can do `mix help forecast` and it will display a list of commands.

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

