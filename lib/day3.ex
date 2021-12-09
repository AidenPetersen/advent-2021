defmodule Day3 do
  def part1 do
    input = get_input ("data/day3p1.txt")
    height = length(input)
    width = List.first(input) |> length

    added = input
    |> List.foldl(List.duplicate(0, width), &:lists.zipwith(fn a, b -> a + b end, &1, &2))

    gamma = added
    |> Enum.map(fn x -> if x < height / 2, do: 0, else: 1 end)
    |> bitstr_to_integer

    epsilon = added
    |> Enum.map(fn x -> if x < height / 2, do: 1, else: 0 end)
    |> bitstr_to_integer

    gamma * epsilon
  end

  def part2 do
    input = get_input("data/day3p2.txt")

    o2(input, 0) * co2(input, 0)
  end


  defp o2(arr, idx) do
    if length(arr) <= 1 do
      arr
      |> Enum.at(0)
      |> bitstr_to_integer
    else
      bits = arr
      |> Enum.map(&(Enum.at(&1, idx)))
      |> Enum.frequencies()

      bit =  if bits[1] >= bits[0] do 1 else 0 end

      modified = arr
      |> Enum.filter(&(Enum.at(&1, idx) == bit))

      o2(modified, idx + 1)
    end
  end


  defp co2(arr, idx) do
    if length(arr) <= 1 do
      arr
      |> Enum.at(0)
      |> bitstr_to_integer
    else
      bits = arr
      |> Enum.map(&(Enum.at(&1, idx)))
      |> Enum.frequencies()

      bit =  if bits[1] < bits[0] do 1 else 0 end

      modified = arr
      |> Enum.filter(&(Enum.at(&1, idx) == bit))

      co2(modified, idx + 1)
    end
  end


  defp bitstr_to_integer x do
    x
    |> Enum.map(&Integer.to_string &1)
    |> Enum.join
    |> String.to_integer(2)
  end

  defp get_input file do
    File.read!(file)
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.graphemes(x) |> Enum.map(&String.to_integer &1) end)
  end
end
