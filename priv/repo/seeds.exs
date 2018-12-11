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

phoenix = Repo.insert!(%Channel{name: "phoenix", twitter_hashtag: "phoenix"})
elixir = Repo.insert!(%Channel{name: "elixir", twitter_hashtag: "myelixirstatus"})
erlang = Repo.insert!(%Channel{name: "erlang", twitter_hashtag: "erlang"})
vim = Repo.insert!(%Channel{name: "vim", twitter_hashtag: "vim"})
workflow = Repo.insert!(%Channel{name: "workflow", twitter_hashtag: "workflow"})
git = Repo.insert!(%Channel{name: "git", twitter_hashtag: "git"})
elm = Repo.insert!(%Channel{name: "elm", twitter_hashtag: "elmlang"})
graphql = Repo.insert!(%Channel{name: "graphql", twitter_hashtag: "graphql"})
design = Repo.insert!(%Channel{name: "design", twitter_hashtag: "design"})

developer = Repo.insert!(%Developer{email: "the@brianemory.com", username: "thebrianemory"})

Repo.insert!(%Post{
  title: "Incorporating Hashrocket's Tilex To My Site",
  body:
    "It took a bit of time, but I have successfully turned my site into an umbrella app and incorporated [Hashrocket's](https://hashrocket.com/) [Tilex](https://github.com/hashrocket/tilex).\r\n```elixir\r\ndef fira_code do\r\n  -> ligatures\r\n  |> are == rad\r\nend\r\n```\r\nI'll have a blog post all about it later this week when I get a few bugs worked out.",
  inserted_at: ~N[2017-10-31 12:39:41.873758],
  channel: phoenix,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Splitting Panes in tmux on the Current Directory",
  body:
    "I have started using tmux with Vim lately to further increase my productivity when coding. After spending some time learning how to use it, tailoring its behavior to my liking, and spending waaayyy too much time customizing the status line, I am feeling pretty good about the decision. Something that has been bugging me is splitting panes and then needing to CD into the correct directory.\r\n\r\nThankfully, this can be resolved by passing the `-c \"\#{pane_current_path}\"` option. From my `.tmux.conf`:\r\n```bash\r\n# Splitting panes with | and -\r\nbind | split-window -h -c \"\#{pane_current_path}\"\r\nbind - split-window -v -c \"\#{pane_current_path}\"\r\n\r\n# Open new window with current directory\r\nbind-key c new-window -c \"\#{pane_current_path}\"\r\n```\r\nNow when I create a new window or split a pane, it will use my current pane's directory. Much better!",
  inserted_at: ~N[2017-12-27 12:34:12.959956],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Pattern Match Using The Concatenating Operator <>",
  body:
    "While reading [Learn Functional Programming with Elixir](https://pragprog.com/book/cdc-elixir/learn-functional-programming-with-elixir), I picked up a nice little tidbit for using Elixir's `<>` operator with pattern matching. In Elixir, we can use `<>` to concatenate two strings.\r\n```elixir\r\niex> \"Hello \" <> \"World!\"\r\n\"Hello World!\"\r\n```\r\nThanks to the power of pattern matching, we can also use it to pattern match the beginning of a string.\r\n```elixir\r\niex> \"Hello \" <> world = \"Hello World!\"\r\niex> world\r\n\"World!\"\r\n```\r\nHowever, we cannot use it to pattern match when the variable is on the left side of the `<>` operator.\r\n```elixir\r\niex> hello <> \" World!\" = \"Hello World!\"\r\n** (CompileError) a binary field without size is only allowed at the end of a binary pattern and never allowed in binary generators\r\n```\r\nWhile we could get fancy and use something like `String.reverse` to flip our string and pattern match that way, as suggested in the book, we are probably better off just using Regex.",
  inserted_at: ~N[2018-01-04 12:34:35.688055],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Example of Bounded Recursion",
  body:
    "\"A bounded recursion is a type of recursive function in which the successive calls to itself have an end. It’s the most common type of recursive function, present in all list navigation code. Every time a recursive function calls itself, that’s an iteration; every time a bounded recursion iterates, it requires fewer iterations to finish. We are decreasing the problem in each iteration, even if we can’t easily predict the total number of iterations.\" ~Learn Functional Programming with Elixir\r\n\r\n```Elixir\r\ndefmodule​ Sum ​do​\r\n  ​def​ up_to(0), ​do​: 0\r\n  def​ up_to(n), ​do​: n + up_to(n - 1)\r\n​end\r\n```\r\n```bash\r\niex>​ c(​\"​​sum.ex\"​)\r\n​iex>​ Sum.up_to(10)\r\n55\r\n```",
  inserted_at: ~N[2018-01-22 12:34:57.781080],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Navigating Lists Using Recursive Functions",
  body:
    "A function that uses the `[head | tail]` syntax to iterate through the list using recursion and sum each of the numbers.\r\n```elixir\r\ndefmodule​ Math ​do​\r\n​  def​ sum([]), ​do​: 0\r\n  ​def​ sum([head | tail]), ​do​: head + sum(tail)\r\nend​\r\n```\r\n```bash\r\niex>​ c(​\"​​math.ex\"​)\r\n​iex>​ Math.sum([10, 5, 15])\r\n30\r\n​iex>​ Math.sum([])\r\n0\r\n```",
  inserted_at: ~N[2018-01-22 12:34:57.781080],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Divide And Conquer: Merge Sort Algorithm",
  body:
    "This is an example of the merge sort algorithm using Elixir. It splits a list into smaller parts before merging it back together in a sorted list.\r\n\r\n```elixir\r\ndefmodule Sort do\r\n  def ascending([]), do: []\r\n  def ascending([a]), do: [a]\r\n\r\n  def ascending(list) do\r\n    half_size = div(Enum.count(list), 2)\r\n    {list_a, list_b} = Enum.split(list, half_size)\r\n\r\n    merge(\r\n      ascending(list_a),\r\n      ascending(list_b)\r\n    )\r\n  end\r\n\r\n  defp merge([], list_b), do: list_b\r\n  defp merge(list_a, []), do: list_a\r\n\r\n  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do\r\n    [head_a | merge(tail_a, list_b)]\r\n  end\r\n\r\n  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do\r\n    [head_b | merge(list_a, tail_b)]\r\n  end\r\nend\r\n```",
  inserted_at: ~N[2018-01-23 12:34:57.781080],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Tail Call Optimization For Recursive Functions",
  body:
    "By using a tail call optimization, you can greatly decrease the memory usage of a recursive function. However, this can come at a cost of code complexity. It is probably best to avoid it unless your function will be going through a high amount of iterations or unless you can implement it in an easy understand and maintain way.\r\nStandard recursive function that requires lots of memory when passing in a high number for the argument.\r\n```elixir\r\ndefmodule Factorial do\r\n  def of(0), do: 1\r\n  def of(n) when n > 0, do: n * of(n - 1)\r\nend\r\n```\r\nTail call optimized function that consumes significantly less memory than the above.\r\n```elixir\r\ndefmodule TRFactorial do\r\n  def of(n), do: factorial_of(n, 1)\r\n  defp factorial_of(0, acc), do: acc\r\n  defp factorial_of(n, acc) when n > 0, do: factorial_of(n - 1, n * acc)\r\nend\r\n```",
  inserted_at: ~N[2018-01-23 12:34:57.781080],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})

Repo.insert!(%Post{
  title: "Using A Leading Underscore for Private Functions",
  body:
    "You may be familiar with using a leading underscore to denote a parameter whose value does not matter for the function.\r\n```elixir\r\ndef some_func(0, _param2), do: 0\r\ndef som_func(param1, param2, do: param1 * param2\r\n```\r\nYou can also use a leading underscore on a function name. Per the [Elixir docs](https://hexdocs.pm/elixir/naming-conventions.html#underscore-_foo), you can do this to keep a function from being imported by default.\r\n\r\nI learned in the book _Programming Elixir_ you can use it on private functions that have the same name as public functions. Here is an example using FizzBuzz.\r\n```elixir\r\ndefmodule FizzBuzz do\r\n  def fizzbuzz(n) when n > 0, do: Enum.each(1..n, &_fizzbuzz/1)\r\n\r\n  defp _fizzbuzz(n) when rem(n, 15) == 0, do: IO.puts(\"FizzBuzz\")\r\n  defp _fizzbuzz(n) when rem(n, 3) == 0, do: IO.puts(\"Fizz\")\r\n  defp _fizzbuzz(n) when rem(n, 5) == 0, do: IO.puts(\"Buzz\")\r\n  defp _fizzbuzz(n), do: IO.puts(n)\r\nend\r\n\r\n```\r\nAnother form of this would be to start the function name with `do_`.\r\n```elixir\r\ndef sum, do: do_sum\r\ndefp do_sum do: 1 + 1\r\n```\r\n\r\nI find using `do_` is easier to read than using `_`. It also avoids potential confusion with the other use of `_`. Better yet, use a different function name. In the above example, use `fizzword` instead of `_fizzbuzz`.",
  inserted_at: ~N[2018-02-22 12:34:57.781080],
  channel: elixir,
  developer: developer,
  slug: Post.generate_slug()
})
