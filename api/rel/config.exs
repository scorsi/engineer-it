Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"YJiwFzd}]:JRhtV[WPqSL=Jo<a4)[LM@[f)hhLNIcBNxFPIsEg%.$_A(P.A3BG}C"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"c5MO`!xv!Od99FCghM%$Ni5i2@u:}{WuKQ9QdsPnI7E)DmFbIQ2B&Yp7!@WzZn4?"
end

release :togebuild do
  set version: current_version(:togebuild)
  set applications: [
    :runtime_tools
  ]
end
