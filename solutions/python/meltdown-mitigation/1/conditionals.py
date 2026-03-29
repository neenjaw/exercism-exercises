"""Functions to prevent a nuclear meltdown."""
from typing import Literal

Number = int|float
EfficiencyRating = Literal["green", "orange", "red", "black"]
Threshold = Literal["LOW", "NORMAL", "DANGER"]

def is_criticality_balanced(temperature: Number, neutrons_emitted: Number) -> bool:
    """Verify criticality is balanced.

    :param temperature: Number - temperature value in kelvin.
    :param neutrons_emitted: Number - number of neutrons emitted per second.
    :return: bool - is criticality balanced?

    A reactor is said to be balanced in criticality if it satisfies the following conditions:
    - The temperature is less than 800 K.
    - The number of neutrons emitted per second is greater than 500.
    - The product of temperature and neutrons emitted per second is less than 500000.
    """

    MAX_TEMERATURE = 800
    MIN_NEUTRON_EMISSION = 500
    MAX_PRODUCT = 500_000
    
    return (
        temperature < MAX_TEMERATURE and
        neutrons_emitted > MIN_NEUTRON_EMISSION and
        temperature * neutrons_emitted < MAX_PRODUCT        
    )


def reactor_efficiency(voltage: Number, current: Number, theoretical_max_power: Number) -> EfficiencyRating:
    """Assess reactor efficiency zone.

    :param voltage: Number - voltage value.
    :param current: Number - current value.
    :param theoretical_max_power: Number - power that corresponds to a 100% efficiency.
    :return: str - one of ('green', 'orange', 'red', or 'black').

    Efficiency can be grouped into 4 bands:

    1. green -> efficiency of 80% or more,
    2. orange -> efficiency of less than 80% but at least 60%,
    3. red -> efficiency below 60%, but still 30% or more,
    4. black ->  less than 30% efficient.

    The percentage value is calculated as
    (generated power/ theoretical max power)*100
    where generated power = voltage * current
    """

    generated_power = voltage * current
    efficiency = generated_power / theoretical_max_power

    if efficiency >= 0.8:
        return "green"
    if efficiency >= 0.6:
        return "orange"
    if efficiency >= 0.3:
        return "red"
    return "black"

def fail_safe(temperature: Number, neutrons_produced_per_second: Number, threshold: Number) -> Threshold:
    """Assess and return status code for the reactor.

    :param temperature: Number - value of the temperature in kelvin.
    :param neutrons_produced_per_second: Number - neutron flux.
    :param threshold: Number - threshold for category.
    :return: str - one of ('LOW', 'NORMAL', 'DANGER').

    1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
    2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
    3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """

    reactivity = temperature * neutrons_produced_per_second
    output_percentage = reactivity / threshold

    if output_percentage < 0.9:
        return "LOW"
    if 0.9 <= output_percentage <= 1.1:
        return "NORMAL"
    return "DANGER"
