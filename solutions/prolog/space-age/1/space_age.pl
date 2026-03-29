:- use_module(library(clpfd)).

atom_to_label(mercury, "Mercury").
atom_to_label(venus, "Venus").
atom_to_label(earth, "Earth").
atom_to_label(mars, "Mars").
atom_to_label(jupiter, "Jupiter").
atom_to_label(saturn, "Saturn").
atom_to_label(uranus, "Uranus").
atom_to_label(neptune, "Neptune").

relative_orbital_period(mercury, 0.2408467).
relative_orbital_period(venus, 0.61519726).
relative_orbital_period(earth, 1.0).
relative_orbital_period(mars, 1.8808158).
relative_orbital_period(jupiter, 11.862615).
relative_orbital_period(saturn, 29.447498).
relative_orbital_period(uranus, 84.016846).
relative_orbital_period(neptune, 164.79132).

space_age(PlanetLabel, AgeSec, PlanetYears) :-
    atom_to_label(Planet, PlanetLabel),
    EarthYears is AgeSec / 31557600,
    relative_orbital_period(Planet, RelPeriod),
    PlanetYears is EarthYears / RelPeriod.