defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim_leading()
    |> String.first()
  end

  def initial(name) do
    "#{name |> first_letter() |> String.upcase()}."
  end

  def initials(full_name) do
    [first, last] = String.split(full_name, " ", parts: 2)
    "#{first |> initial()} #{last |> initial()}"
  end

  def pair(full_name1, full_name2) do
    initials1 = full_name1 |> initials()
    initials2 = full_name2 |> initials()

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials1}  +  #{initials2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
