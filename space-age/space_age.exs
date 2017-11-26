defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @earth_year_seconds 31557600
  @planets_year_length %{
    earth: @earth_year_seconds,
    mercury: 0.2408467 * @earth_year_seconds,
    venus: 0.61519726 * @earth_year_seconds,
    mars: 1.8808158 * @earth_year_seconds,
    jupiter: 11.862615 * @earth_year_seconds,
    saturn: 29.447498 * @earth_year_seconds,
    uranus: 84.016846 * @earth_year_seconds,
    neptune: 164.79132 * @earth_year_seconds,
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @planets_year_length[planet]
  end
end
