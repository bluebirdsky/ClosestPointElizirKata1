defmodule Coord do
  defstruct x: 0, y: 0
end

defmodule ClosestPoint do

  def sortByX(coordListMap) do
    Enum.sort(coordListMap)
  end

  def getMiddleCoord(coordList) do

    listLength = length coordList

    if rem(listLength, 2) == 0 do
      round(listLength/2 + 1)
    else
      round(listLength/2)
    end

  end

  def splitCoordDomains(coordList, groupSize) do
    coordList |> Enum.chunk(groupSize)
  end

  @spec distanceBetweenTwoPoints(Coord, Coord) :: number
  def distanceBetweenTwoPoints(coord1, coord2) do
    :math.sqrt(:math.pow((coord1.x - coord2.x), 2) +
      :math.pow((coord1.y - coord2.y), 2))
  end

  def findPointDistances(coord, coordList) do
    Enum.map(coordList, fn(a) -> %{dist: ClosestPoint.distanceBetweenTwoPoints(a, coord), coord: a} end)
  end

  def findClosestPoint(coord, coordList) do
    dist = ClosestPoint.findPointDistances(coord, coordList)
    distSorted = Enum.sort(dist, &(&1.dist < &2.dist))
    Enum.at(distSorted, 1)
  end

end
