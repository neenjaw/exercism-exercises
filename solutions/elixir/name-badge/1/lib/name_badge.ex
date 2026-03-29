defmodule NameBadge do
  def print(id, name, department) do
    id_prefix =
      if id do
        "[#{id}] - "
      else
        ""
      end

    department =
      if department do
        department |> String.upcase()
      else
        "OWNER"
      end

    "#{id_prefix}#{name} - #{department}"
  end
end
