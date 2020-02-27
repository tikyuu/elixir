defmodule HugeAgreegation do
    def uniq_sum() do
        result = "sample.txt"
            |> File.stream!
            |> Stream.map(&(String.trim(&1)))
            |> Stream.map(&(String.split(&1, ", ")))
            |> Stream.map(fn([word, num]) -> %{ "word" => word, "num" => num } end)
            |> Enum.group_by(fn(pair) -> pair["word"] end, fn(pair) -> String.to_integer(pair["num"]) end)
            |> Enum.map(fn(pair) -> { elem(pair, 0), Enum.sum(elem(pair, 1))} end)
    end
end
