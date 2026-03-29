defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}
  def build_tree(preorder, inorder) do
    case validate(preorder, inorder) do
      :ok -> 
        {tree, _} = do_build_tree(preorder, inorder)
        {:ok, tree}

      {:error, _} = err ->  err
    end
  end

  defp do_build_tree(preorder, []) do
    {{}, preorder}
  end

  defp do_build_tree([root | preorder], inorder) do
    {left_inorder, [_ | right_inorder]} = Enum.split_while(inorder, fn e -> e != root end)

    {left_subtree, preorder} = do_build_tree(preorder, left_inorder)
    {right_subtree, preorder} = do_build_tree(preorder, right_inorder)
    tree = {left_subtree, root, right_subtree}

    {tree, preorder}
  end


  defp validate(preorder, inorder) do
    :ok
    |> validate_equal_length(preorder, inorder)
    |> validate_sameness(preorder, inorder)
    |> validate_uniqueness(preorder)
  end

  defp validate_equal_length(:ok, preorder, inorder) when length(preorder) == length(inorder), do: :ok
  defp validate_equal_length(:ok, _preorder, _inorder), do: {:error, "traversals must have the same length"}
  defp validate_equal_length(err, _preorder, _inorder), do: err

  defp validate_sameness(:ok, preorder, inorder) do
    cond do
      Enum.sort(preorder) == Enum.sort(inorder) -> :ok
      true -> {:error, "traversals must have the same elements"}
    end
  end
  defp validate_sameness(err, _preorder, _inorder), do: err

  defp validate_uniqueness(:ok, order) do
    cond do
      Enum.uniq(order) == order -> :ok
      true -> {:error, "traversals must contain unique items"}
    end
  end
  defp validate_uniqueness(err, _order), do: err
end
