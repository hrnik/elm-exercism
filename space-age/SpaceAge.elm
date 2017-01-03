module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet age =
    age / secondInYearOnPlanet planet


secondInYearOnPlanet : Planet -> Float
secondInYearOnPlanet planet =
    case planet of
        Earth ->
            earthSecondInYear

        Mercury ->
            secondFromEarthOrbitalPeriod 0.2408467

        Venus ->
            secondFromEarthOrbitalPeriod 0.61519726

        Mars ->
            secondFromEarthOrbitalPeriod 1.8808158

        Jupiter ->
            secondFromEarthOrbitalPeriod 11.862615

        Saturn ->
            secondFromEarthOrbitalPeriod 29.447498

        Uranus ->
            secondFromEarthOrbitalPeriod 84.016846

        Neptune ->
            secondFromEarthOrbitalPeriod 164.79132


earthSecondInYear : Float
earthSecondInYear =
    31557600


secondFromEarthOrbitalPeriod : Float -> Float
secondFromEarthOrbitalPeriod period =
    earthSecondInYear * period
