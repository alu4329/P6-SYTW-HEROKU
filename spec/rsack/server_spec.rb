require 'rspec'
require 'rack'
require 'rsack'
require '././juego.rb'

describe PiedraPapelTijera::App do

  #Rack::MockRequest te permite testear tu aplicación sin necesidad de hacer uso de HTTP
  def server
    Rack::MockRequest.new(Rack::Session::Cookie.new(PiedraPapelTijera::App.new, :key => 'rack.session', :secret => 'some_secret'))
  end

  context '/' do
    it "Debería devolver código de estado 200" do
      response = server.get('/')
      response.status.should == 200
    end

    it "Deberia haber una cabecera y un middle antes de elegir opción" do
      response = server.get('/')
      response.body = "Cabecera"
      response.body = "Middle"
    end

    it "Comprobar que tiene un boton" do
      response = server.get('/')
      response.body = "button"
    end

    it "Debería haber un botton despues de que el usuario elija papel" do
      response = server.get('/?choice=papel')
      response.body = "botton"
    end

    it "Debería haber un botton despues de que el usuario elija piedra" do
      response = server.get('/?choice=piedra')
      response.body = "botton"
    end

    it "Debería haber un botton despues de que el usuario elija tijera" do
      response = server.get('/?choice=tijera')
      response.body = "botton"
    end

    it "Comprobación del fondo" do
      response = server.get('/')
      response.body = "fondo.jpg"
    end

    it "Comprobación del fondo" do
      response = server.get('/')
      response.body = "fondo.jpg"
    end
  end
end

