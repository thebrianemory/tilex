defmodule TilexWeb.SharedView do
  use TilexWeb, :view

  alias Guardian.Plug

  def display_date(post) do
    post.inserted_at
    |> datetime_in_zone()
    |> Timex.format!("%B %-e, %Y", :strftime)
  end

  def rss_date(post) do
    post.inserted_at
    |> datetime_in_zone()
    |> Timex.format!("%a, %d %b %Y %H:%M:%S GMT", :strftime)
  end

  defp datetime_in_zone(datetime) do
    timezone = Timex.Timezone.get(Application.get_env(:tilex, :tz), datetime)
    Timex.Timezone.convert(datetime, timezone)
  end

  def pluralize(1, object), do: "1 #{object}"
  def pluralize(count, object), do: "#{count} #{object}s"

  def pagination_href(conn, page) do
    conn.request_path <> "?" <> URI.encode_query(Map.put(conn.params, "page", page))
  end

  def post_creator_or_admin?(conn, post) do
    Plug.current_resource(conn) &&
      (post.developer == Plug.current_resource(conn) || Plug.current_resource(conn).admin)
  end
end
