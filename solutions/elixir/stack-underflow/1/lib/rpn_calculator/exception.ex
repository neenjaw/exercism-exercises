defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  # Please implement StackUnderflowError here.
  defmodule StackUnderflowError do
    @message "stack underflow occurred"
    defexception message: @message

    @impl true
    def exception(value) do
      case value do
        [] ->
          %__MODULE__{}
        _ ->
          %__MODULE__{message: @message <> ", context: #{value}"}
      end
    end
  end

  def divide(stack) when length(stack) < 2, do: raise StackUnderflowError, "when dividing"
  def divide([0, _ | _]), do: raise DivisionByZeroError
  def divide([divisor, dividend]), do: dividend / divisor
end
