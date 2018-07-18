defmodule API.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(API.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(API.Gettext, "errors", msg, opts)
    end
  end
end
