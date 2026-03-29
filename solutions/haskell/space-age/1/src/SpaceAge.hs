module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secondsPerEarthYear :: Float
secondsPerEarthYear = 31557600.0

relativeYear :: Planet -> Float
relativeYear Mercury = 0.2408467
relativeYear Venus   = 0.61519726
relativeYear Earth   = 1.0
relativeYear Mars    = 1.8808158
relativeYear Jupiter = 11.862615
relativeYear Saturn  = 29.447498
relativeYear Uranus  = 84.016846
relativeYear Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / secondsPerEarthYear / (relativeYear planet)
