defmodule Day4 do
  def part1 do
  end

  defp mark_board(board, num) do
    board
    |> Enum.map(fn x ->
      Enum.map(x, fn {y, b} ->
        if y == num do
          {y, true}
        else
          {y, b}
        end
      end)
    end)
  end

  defp check_bingo(board) do
    horiz =
      board
      |> Enum.map(fn x ->
        Enum.all?(x, fn {_, b} -> b end)
      end)
      |> Enum.any?()

    vert =
      board
      |> List.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.map(fn x ->
        Enum.all?(x, fn {_, b} -> b end)
      end)
      |> Enum.any?()

    diagonal1 = Enum.zip(Enum.to_list(0..4), Enum.to_list(0..4))
    diagonal2 = Enum.zip(Enum.to_list(4..0), Enum.to_list(0..4))

    d1 =
      Enum.map(diagonal1, fn {x, y} ->
        {_, b} = board |> Enum.at(y) |> Enum.at(x)
        b
      end)

    d2 =
      Enum.map(diagonal2, fn {x, y} ->
        {_, b} = board |> Enum.at(y) |> Enum.at(x)
        b
      end)

    horiz || vert || d1 || d2
  end

  def get_input(file) do
    [nums | boards] =
      File.read!(file)
      |> String.split("\n\n", trim: true)

    nums =
      nums
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer(&1))

    boards =
      boards
      |> Enum.map(fn x -> String.split(x, "\n", trim: true) end)
      |> Enum.map(fn x ->
        Enum.map(x, fn y ->
          y
          |> String.split(~r{\s}, trim: true)
          |> IO.inspect()
          |> Enum.map(&{String.to_integer(&1), false})
        end)
      end)

    {nums, boards}
  end
end
