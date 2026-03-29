defmodule FreelancerRates do
  @hours_per_day 8
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    @hours_per_day * hourly_rate * 1.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@billable_days_per_month)
    |> apply_discount(discount) 
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / (daily_rate(hourly_rate)
    |> apply_discount(discount))
    |> Float.floor(1)
  end
end
