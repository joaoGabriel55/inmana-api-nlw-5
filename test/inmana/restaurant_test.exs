defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Pelé bares", email: "pele@yahoo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{email: "pele@yahoo.com", name: "Pelé bares"}, valid?: true} = response
    end

    test "when there are all wrong params, returns a invalid changeset" do
      params = %{name: "P", email: ""}
      expected_result = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_result
    end

    test "when name param is invalid, returns a invalid changeset" do
      params = %{name: "P", email: "pele@yahoo.com"}
      expected_result = %{name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_result
    end

    test "when email param is invalid, returns a invalid changeset" do
      params = %{name: "Pelé", email: "peleyahoo.com"}
      expected_result = %{email: ["has invalid format"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_result
    end
  end
end
