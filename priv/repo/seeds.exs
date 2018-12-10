# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tilex.Repo.insert!(%Tilex.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tilex.{Channel, Developer, Post, Repo}

Repo.delete_all(Channel)
Repo.delete_all(Developer)

Repo.insert!(%Channel{name: "phoenix", twitter_hashtag: "phoenix"})
Repo.insert!(%Channel{name: "elixir", twitter_hashtag: "myelixirstatus"})
Repo.insert!(%Channel{name: "erlang", twitter_hashtag: "erlang"})
Repo.insert!(%Channel{name: "vim", twitter_hashtag: "vim"})
Repo.insert!(%Channel{name: "workflow", twitter_hashtag: "workflow"})
Repo.insert!(%Channel{name: "git", twitter_hashtag: "git"})
Repo.insert!(%Channel{name: "elm", twitter_hashtag: "elmjang"})
Repo.insert!(%Channel{name: "graphql", twitter_hashtag: "graphql"})
Repo.insert!(%Channel{name: "design", twitter_hashtag: "design"})

Repo.insert!(%Developer{email: "the@brianemory.com", username: "thebrianemory"})
