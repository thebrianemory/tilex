defmodule Tilex.TestHelpers do

  use Wallaby.DSL

  def get_text(session, selector) do
    session |> find(selector) |> text
  end
end
