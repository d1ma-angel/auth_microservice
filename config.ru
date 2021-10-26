require_relative 'config/environment'

map '/auth' do
  run Rack::Cascade.new([
    UserRoutes,
    UserSessionRoutes
  ])
end
