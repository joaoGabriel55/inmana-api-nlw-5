defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Pelé bares", email: "pele@yahoo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "pele@yahoo.com",
                 "id" => _id,
                 "name" => "Pelé bares"
               }
             } = response
    end

    test "when some param are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "P", email: "pele@yahoo.com"}
      expect_response =  %{"message" => %{"name" => ["should be at least 2 character(s)"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expect_response
    end
  end
end
