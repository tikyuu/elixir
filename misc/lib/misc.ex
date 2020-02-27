defmodule Misc do
    # values (リスト/マップ)などをソートする
    def sort(values), do: Enum.sort(values)

    # 取得したマップのk2キーのみ表示する
    def match_sample(%{ k2: value }), do: value

    # yes: "we can" のみにマッチするパターン
    def match(%{ yes: "we can" }), do: "Barack Obama"
    # yes: ならなんでもマッチするパターン
    def match(%{ yes: need }), do: need
    # 上記にマッチしなかったすべてのパターンを吸収
    def match(_), do: "Yes...Not Exist"

    def match_inner(input_map) do
        %{ yes: need } = input_map
        need
    end
end