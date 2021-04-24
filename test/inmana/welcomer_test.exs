defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "47"}
      expected_result = {:ok, "Sooo cool"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a normal message" do
      params = %{"name" => "banana", "age" => "18"}
      expected_result = {:ok, "Sooo normal, banana - 18"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is invalid, returns a bad message" do
      params = %{"name" => "banana", "age" => "14"}
      expected_result = {:error, "Sooo bad"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
