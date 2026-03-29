defmodule GuessingGame do
  def compare(secret, guess \\ :no_guess)

  def compare(secret, :no_guess) do
    "Make a guess"
  end

  def compare(guess, guess) do
    "Correct"
  end

  def compare(secret, guess) when guess + 1 == secret or guess - 1 == secret do
    "So close"
  end
  
  def compare(secret, guess) when guess > secret do
    "Too high"
  end

  def compare(secret, guess) when guess < secret do
    "Too low"
  end
end
