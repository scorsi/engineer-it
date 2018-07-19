
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"7]ylz&7(6ZNVjzlQ((4dGy6|1wu0fYn5]}&y^Uo,*og*3.~@?xR6%evq04%*IqU0"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"Qya&FaCSb>Jjf5ENm||qEMX^<wMeVwfQdE*^BvN<WGM3u?JE@5w;FjVZq|,R)Vgc"
end

release :togebuild do
  set version: current_version(:togebuild)
  set applications: [
    :runtime_tools
  ]
end
