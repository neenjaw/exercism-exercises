defmodule Alphametics do
  @type puzzle :: binary
  @type solution :: %{required(?A..?Z) => 0..9}
  
 @initial_possibiltiies 0..9 |> Enum.to_list

  @doc """
  Takes an alphametics puzzle and returns a solution where every letter
  replaced by its number will make a valid equation. Returns `nil` when
  there is no valid solution to the given puzzle.

  ## Examples

      iex> Alphametics.solve("I + BB == ILL")
      %{?I => 1, ?B => 9, ?L => 0}

      iex> Alphametics.solve("A == B")
      nil
  """
  @spec solve(puzzle) :: solution | nil
  def solve(puzzle) do
    with fpuzzle              <- String.upcase(puzzle),
         equation             <- get_equation(fpuzzle),
         true                 <- valid_puzzle?(equation),
         raw_letter_value_map <- get_letters(fpuzzle),
         letter_value_map     <- remove_zero_possibilities(raw_letter_value_map, fpuzzle),
         rules                <- build_constraint_rules(letter_value_map, fpuzzle, equation),
         letters              <- Map.keys(letter_value_map),
         {:ok, solution}      <- generate_solution(letters, letter_value_map, equation, rules)
    do
      solution
    else
      false -> nil
      :no_solution -> nil
    end
  end

  def get_equation(puzzle) do
    ~r/(?'term'\w+|==)/u
      |> Regex.scan(puzzle, capture: :all_names) 
      |> List.flatten
      |> Enum.split_while(fn term -> term != "==" end)
      |> (fn {left, [_eq | right]} -> {left, right} end).()
  end
  
  def valid_puzzle?({left,right}) do
    num_left_terms = length(left)
    num_right_terms = length(right)
    
    max_left_term = max_term_length(left)
    max_right_term = max_term_length(right)
    
    
    (num_right_terms == 1)
      and (max_right_term >= max_left_term)
      and (
        (not ((num_left_terms == 1) and (num_right_terms == 1)))
          or ((left |> hd) == (right |> hd)) )
  end
  
  def max_term_length([]), do: nil
  def max_term_length(terms) when is_list(terms) do
    do_max_term_length(terms)
  end
  
  defp do_max_term_length(terms, max \\ 0)
  defp do_max_term_length([], max), do: max
  defp do_max_term_length([term | rest], max) do
    length_of_term = String.length(term)
  
    cond do
      length_of_term > max -> do_max_term_length(rest, length_of_term)
      true -> do_max_term_length(rest, max)
    end
  end
  
  def get_letters(puzzle) do
    puzzle
      |> to_charlist
      |> Enum.filter(&(&1 in ?A..?Z))
      |> Map.new(fn c -> {c, @initial_possibiltiies} end)
  end

  def remove_zero_possibilities(letter_map, puzzle) do
    Regex.scan(~r/(^|\W)(?'letter'\w)/u, puzzle, capture: :all_names) 
      |> List.flatten 
      |> Enum.uniq
      |> Enum.reduce(letter_map, fn l, map ->
        c = l |> to_charlist |> hd
    
        new_possibiltiies = map[c]
          |> List.delete(0)

        Map.put(map, c, new_possibiltiies)
      end)
  end

  def build_constraint_rules(letter_map, _puzzle, equation) do
    column_restrictions(letter_map, equation)
  end

  def column_restrictions(_letter_map, {left, right}) do
    left_by_column = left |> by_column
    right_by_column = right |> by_column

    combined_by_column = combine(left_by_column, right_by_column)

    create_column_rules(combined_by_column)
  end

  def by_column(terms) do
    sorted_terms = terms
      |> Enum.map(&({&1, String.length(&1), String.graphemes(&1)}))
      |> Enum.sort(fn {_, length_a, _}, {_, length_b, _} -> 
        length_a <= length_b 
      end)

    {_, max_term_length, _} = sorted_terms |> List.last

    sorted_terms
    |> Enum.map(fn {_, term_length, term_list} -> 
      List.duplicate("-", (max_term_length - term_length)) ++ term_list
    end)
    |> Enum.zip
  end
  
  def combine(left, right) do
    length_left = length(left)
    length_right = length(right)
    
    max_length = cond do
      length_left >= length_right -> length_left
      true -> length_right
    end
    
    normalized_left = 
      List.duplicate({"-"}, max_length - length_left) ++ left
    normalized_right = 
      List.duplicate({"-"}, max_length - length_right) ++ right
    
    Enum.zip(normalized_left, normalized_right)
  end
  
  def create_column_rules(columns, reversed_colums \\ [])
  def create_column_rules([], reversed_columns), do: do_create_column_rules(reversed_columns)
  def create_column_rules([{left, {right}} | rest], reversed_colums) do
    filtered_left = 
      left 
      |> Tuple.to_list
      |> Enum.filter(fn d -> d != "-" end)

    create_column_rules(rest, [{filtered_left, right} | reversed_colums])
  end

  def do_create_column_rules(reversed_columns, rules \\ [])
  def do_create_column_rules([], rules), do: rules |> Enum.reverse
  def do_create_column_rules([{adds_letter_list, sum_letter} | rest], rules) do
    column_letters = [sum_letter | adds_letter_list]
      |> Enum.join
      |> to_charlist
    
    column_letter_set = column_letters
      |> MapSet.new

    rule = fn soln_map, amount_carried_over ->
      required_letters_set = column_letter_set
      soln_letters_set = soln_map 
        |> Map.keys
        |> MapSet.new

      unless MapSet.subset?(required_letters_set, soln_letters_set) do
        :column_not_defined
      else
        [sum_digit | adds] = column_letters
          |> Enum.map(fn c -> soln_map[c] end)
        
        adds_sum_digits = adds
          |> Enum.sum
          |> Kernel.+(amount_carried_over)
          |> Integer.digits

        adds_last_digit = adds_sum_digits
          |> List.last

        amount_to_carry_over = adds_sum_digits
          |> List.delete_at(-1)
          |> Integer.undigits

        [match: (adds_last_digit == sum_digit), carry: amount_to_carry_over]
      end
    end

    do_create_column_rules(rest, [rule | rules])
  end

  def check_rules(rules, soln_map, amount_carried_over \\ 0)
  def check_rules([], _, _), do: :ok
  def check_rules([rule | rules], soln_map, amount_carried_over) do
    case rule.(soln_map, amount_carried_over) do
      [match: true, carry: next_carry] -> check_rules(rules, soln_map, next_carry)
      :column_not_defined -> :label_more_letters
      _ -> :backtrack
    end
  end

  def test_equation({left, right}, solution) do
    get_value_of(left, solution) == get_value_of(right, solution)
  end

  def get_value_of(terms,solution) do
    terms
      |> Enum.map(fn term ->
        term
          |> to_charlist
          |> Enum.map(&(solution[&1]))
          |> Integer.undigits
      end)
      |> Enum.sum
  end

  def generate_solution(chars, possible_vals, eq, rules, soln_map \\ %{})
  def generate_solution([], _, eq, _rules, soln_map) do
    # Base case, no more letters to generate a solution for so test the equation
    cond do
      test_equation(eq, soln_map) -> {:ok, soln_map}
      true                        -> :no_solution
    end
  end
  def generate_solution([char | chars], value_map, eq, rules, soln_map) do
  
    next_values =
      get_next_char_values(char, value_map, soln_map)
    
    case next_values do
      :no_value -> :no_solution
      
      [value | remaining_values] ->     
        updated_soln_map = Map.put(soln_map, char, value)

        rule_result = check_rules(rules, soln_map)

        current_result =
          case rule_result do
            :backtrack -> :no_solution
            _ -> generate_solution(chars, value_map, eq, rules, updated_soln_map)
          end
        
        case current_result do
          {:ok, _} = result -> result
          
          :no_solution -> 
            # if the solution fails with the current pick, then remove 
            # the possibility then try again
            updated_value_map = Map.put(value_map, char, remaining_values)

            generate_solution([char|chars], updated_value_map, eq, rules, soln_map)
        end
    end
  end
  
  def get_next_char_values(char, value_map, soln_map) do
    value_map[char] 
      |> do_get_next_char_values(soln_map)
  end
  
  defp do_get_next_char_values([], _soln_map), do: :no_value
  defp do_get_next_char_values(values, soln_map = %{}) when map_size(soln_map) == 0, do: values
  defp do_get_next_char_values(values, soln_map) do
    solution_values = Map.values(soln_map)

    values
      # filter out solutions that are already picked from potentials
      |> Enum.reject(fn value -> value in solution_values end)
  end
end