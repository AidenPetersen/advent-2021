defmodule Day1 do
  def part1 do
    get_input("data/day1p1.txt")
    |> compare1
  end

  defp get_input file do
    File.read!(file)
    |> String.split
    |> Enum.map(&String.to_integer &1)
  end

  defp compare1([h | t]), do: compare1(t, h, 0)
  defp compare1([]), do: 0

  defp compare1([x | xs], prev, acc) when x > prev, do: compare1(xs, x, acc + 1)
  defp compare1([x | xs], _, acc), do: compare1(xs, x, acc)
  defp compare1([], _, acc), do: acc

  def part2 do
    get_input("data/day1p2.txt")
    |> compare2
  end

  defp compare2([x, y, z | xs]), do: compare2([y, z | xs], x + y + z, 0)
  defp compare2(_), do: 0

  defp compare2([x, y, z | xs], prev, acc) when (x + y + z) > prev, do: compare2([y, z | xs], (x + y + z), acc + 1)
  defp compare2([x, y, z | xs], _, acc), do: compare2([y, z | xs], (x + y + z), acc)
  defp compare2(_, _, acc), do: acc
end
