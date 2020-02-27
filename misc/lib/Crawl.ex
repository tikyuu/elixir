# json取得 パターンマッチ
defmodule Crawl do

    # パイプを利用
    # |> パイプ演算子 前の処理の出力を、次の処理の第１引数として暗黙で渡す
    # 引数が複数ある場合、第２引数以降を()で指定可能
    def get() do
        HTTPoison.get!("https://qiita.com/api/v2/items?query=Elixir")
        |> body
        |> Poison.decode!
        |> title_list([])
    end

    # 元コード、パイプを利用する
    # def get() do
    #     response = HTTPoison.get!("https://qiita.com/api/v2/items?query=Elixir")
    #     body = body(response)
    #     Poison.decode!(body)
    # end

    # statusが200のときだけ、body部から抜き出す
    # パターンマッチで簡単にできる!
    def body(%{status_code: 200, body: json_body }), do: json_body

    def title_list([head | tail], titles) do
        %{ "title" => json_title } = head
        added_titles = [json_title] ++ titles
        title_list(tail, added_titles)
    end
    def title_list([], titles), do: titles
    def title_list(_), do: "hello"
end