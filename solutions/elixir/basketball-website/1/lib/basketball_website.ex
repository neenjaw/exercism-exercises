defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path = path |> String.split(".")

    path
    |> Enum.reduce(data, fn
      _, nil -> nil
      key, data -> data[key]
    end)
  end

  def get_in_path(data, path) do
    path = path |> String.split(".")
    get_in(data, path)
  end
end
