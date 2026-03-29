defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and 
  imaginary parts. For example, the real number `1` is `{1, 0}`, the imaginary number `i`
  is `{0, 1}` and the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {real :: float, imaginary :: float}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: float
  def real({real, _}) do
    real
  end

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: float
  def imaginary({_, imaginary}) do
    imaginary
  end

  @doc """
  Multiply two complex numbers
  """
  @spec mul(complex, complex) :: complex
  def mul({a, b}, {c, d}) do
    {a * c - b * d, b * c + a * d}
  end

  @doc """
  Add two complex numbers
  """
  @spec add(complex, complex) :: complex
  def add({a, b}, {c, d}) do
    {a + c, b + d}
  end

  @doc """
  Subtract two complex numbers
  """
  @spec sub(complex, complex) :: complex
  def sub({a, b}, {c, d}) do
    {a - c, b - d}
  end

  @doc """
  Divide two complex numbers
  """
  @spec div(complex, complex) :: complex
  def div({a, b}, {c, d}) do
    divisor = c * c + d * d
    {(a * c + b * d) / divisor, (b * c - a * d) / divisor}
  end

  @doc """
  Absolute value of a complex number
  """
  @spec abs(complex) :: float
  def abs({a, b}) do
    :math.sqrt(a * a + b * b)
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(complex) :: complex
  def conjugate({a, b}) do
    {a, -b}
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(complex) :: complex
  def exp({a, b}) do
    {:math.exp(a) * :math.cos(b), -:math.exp(a) * :math.sin(b)}
  end
end
