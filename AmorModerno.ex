defmodule AmorModerno do
  def main() do
    str = IO.gets("") |> String.trim()
    if str != "*" do
      charlist = String.to_charlist(str)
      maiusculas = Enum.count(charlist, fn x -> x in ?A..?Z end)
      minusculas = Regex.scan(~r/[a-z]/, str) |> Enum.count()

      case maiusculas / (minusculas+maiusculas) do
        0.0 -> "oi"
        x when x <= 0.05 -> "entendi"
        x when x <= 0.2 -> "eu gosto dessa musica"
        _ -> "desculpe"
      end |> IO.puts()

      main()
    end
  end
end

AmorModerno.main()