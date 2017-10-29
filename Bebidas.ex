defmodule Bebidas do
  def main() do
    num_testes = read_int()
    Enum.each(1..num_testes, fn _i ->
      solve()
    end)
  end

  def solve() do
    num_drinks = read_int()
    Enum.reduce(1..num_drinks, %{}, fn _i, map ->
      bebida = read_str()
      qty = read_int()
      new_qty = Map.get(map, bebida, 0)+qty
      Map.put(map, bebida, new_qty)
    end)
    |> Enum.sort()
    |> Enum.map(fn {key, value} -> "#{key} #{value}" end)
    |> Enum.each(&IO.puts/1)

    IO.puts("")
  end

  def read_int() do
    {:ok, [valor]} = :io.fread('', '~d')
    valor
  end

  def read_str() do
    {:ok, [charlist]} = :io.fread('', '~s')
    List.to_string(charlist)
  end
end

Bebidas.main()