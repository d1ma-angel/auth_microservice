require_relative 'config/environment'

map '/' do
  run Rack::Cascade.new(
    [
      AuthRoutes,
      UserRoutes,
      UserSessionRoutes
    ]
  )
end
