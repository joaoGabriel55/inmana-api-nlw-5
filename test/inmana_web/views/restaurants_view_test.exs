defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Zezinho bar", email: "ze@email.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "ze@email.com",
                 id: _id,
                 name: "Zezinho bar"
               }
             } = response
    end
  end
end
