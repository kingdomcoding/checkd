defmodule CheckdWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use CheckdWeb, :controller` and
  `use CheckdWeb, :live_view`.
  """
  use CheckdWeb, :html

  embed_templates "layouts/*"
end
