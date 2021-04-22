defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    # Supply
    # |> Repo.get(uuid)
    # |> handle_insert()

    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply #{uuid} not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # defp handle_insert(%Supply{} = result), do: {:ok, result}
  # defp handle_insert(nil), do: {:error, %{result: "Supply not found", status: :not_found}}
end
