defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(value) do
    receive do
      {:report_state, sender} -> 
        send(sender, value)
        loop(value)

      {:take_a_number, sender} ->
        value = value + 1
        send(sender, value)        
        loop(value)

      :stop -> nil

      _ -> loop(value)
    end
  end
end
