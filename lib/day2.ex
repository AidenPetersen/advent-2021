defmodule Day2 do
  def part1 do
    {a, b} = get_input("data/day2p1.txt")
    |> List.foldl({0, 0}, fn {dir, num}, {x, y} ->
      case dir do
        :up -> {x, y - num}
        :down -> {x, y + num}
        :forward -> {x + num, y}
      end
    end)
    a * b
  end

  def part2 do
    {a, b, _} = get_input("data/day2p2.txt")
    |> List.foldl({0, 0, 0}, fn {dir, num}, {x, y, aim} ->
      case dir do
        :up -> {x, y, aim - num}
        :down -> {x, y, aim + num}
        :forward -> {x + num, y + aim * num, aim}
      end
    end)
    a * b
  end

  defp get_input file do
    File.read!(file)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split &1)
    |> Enum.map(fn [dir, num] -> {String.to_atom(dir), String.to_integer(num)} end)
  end
end
