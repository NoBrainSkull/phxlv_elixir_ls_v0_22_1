defmodule Ex17lsWeb.ErrorJSONTest do
  use Ex17lsWeb.ConnCase, async: true

  test "renders 404" do
    assert Ex17lsWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Ex17lsWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
