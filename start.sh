# Setup database
mix ecto.setup

# Make server file executable
chmod a+x _build/prod/rel/checkd/bin/server

# Start server
_build/prod/rel/checkd/bin/server
