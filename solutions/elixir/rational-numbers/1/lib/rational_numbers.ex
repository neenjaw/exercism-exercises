defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(rational, rational) :: rational
  def add({a, b}, {c, d}) do
    {a * d + c * b, b * d} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(rational, rational) :: rational
  def subtract({a, b}, {c, d}) do
    {a * d - c * b, b * d} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(rational, rational) :: rational
  def multiply({a, b}, {c, d}) do
    {a * c, b * d} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a, b}, {c, d}) do
    multiply({a, b}, {d, c}) |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
  end
  
  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0 do
    pow_rational({b, a}, -n)
  end

  def pow_rational({a, b}, n) do
    {:math.pow(a, n) |> round, :math.pow(b, n) |> round} |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: float, n :: rational) :: float
  def pow_real(x, {a, b}) do
    :math.pow(x, a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(rational) :: rational
  def reduce({a, b}) when b < 0 do
    reduce({-a, -b})
  end

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {div(a, gcd), div(b, gcd)}
  end
end
