#!/usr/bin/ruby
require 'rack'
require 'thin'
require 'haml'
require 'heroku'
  
  module PiedraPapelTijera
    class App
  
      def initialize(app = nil)
        @app = app
        @content_type = :html

	#Hash con las reglas de juego
        @defeat = {'piedra' => 'tijeras', 'papel' => 'piedra', 'tijera' => 'papel'}

	#Posibles opciones, piedra, papel o tijera.
        @throws = @defeat.keys
	
	#Hash para almacenar las estadísticas entre diferentes sesiones.
        @estadisticas = {'win' => 0, 'lose' => 0, 'equal' => 0}

      end
      
      def set_env(env)
        @env = env
        @session = env['rack.session']
      end
      
      def some_key
        return @session['some_key'].to_i if @session['some_key']
        @session['some_key'] = 0
      end

      def some_key=(value)
        @session['some_key'] = value
      end    
  
      def call(env)
	set_env(env)
        req = Rack::Request.new(env)
  
	#Elección al azar por parte de la máquina
        computer_throw = @throws.sample
	#Elección del jugador a través del path_info
        player_throw = req.GET["choice"]

        engine = Haml::Engine.new File.open("views/index.html.haml").read
      
        res = Rack::Response.new

	resultado = {
          :estadisticas => @estadisticas,
          :throws => @throws,
          :computer_throw => computer_throw,
          :player_throw => player_throw,
	  :some_key => some_key
        }
		
        res.write engine.render({},resultado)
        
        res.finish
      end # call
    end # App
  end # PiedraPapelTijera
