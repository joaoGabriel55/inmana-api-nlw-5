defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 47) do
    {:ok, "Sooo cool"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Sooo normal, #{name} - #{age}"}
  end

  defp evaluate(_name, _age) do
    {:error, "Sooo bad"}
  end
end
