require './juego.rb'


use Rack::Static, :urls => ["/css", "/images"], :root => "public"
  use Rack::ShowExceptions
  use Rack::Lint
  use Rack::Session::Cookie,
     :key => 'rack.session',
     :secret => 'some_secret'
  run PiedraPapelTijera::App.new



