# Práctica 6 - SYTW  
![Ruby](http://medularis.com/assets/ruby-fbdcfd4fc56395d1df69240ccd77275e.png)

## Víctor Plaza Martín - alu4329

## Objetivo de la práctica
Despliegue de la aplicación creada en prácticas anteriores en el sistema de computación en la nube, Heroku

## Descripción
Despliegue en Heroku de nuestra aplicación, para lo cual hemos tenido que añadir el archivo `Procfile` y una extensa modificación del `config.ru`

### Archivos incluídos o modificados en esta práctica:
1. `Procfile` -> Archivo añadido a la raiz de nuestro proyecto en el cual se detallan los tipos de procesos de nuestra aplicación.
2. `config.ru` -> Modificado para adaptarlo a las necesidades de Heroku
3. `Gemfile` -> Añadida gema Heroku

### Link a la aplicación
[Link a la aplicación](http://p6sytw.herokuapp.com/)

###Método de complicación
	$ rake
	$ rake test
	$ rake spec

Otro método:

	$ rackup
	$ ruby test/test.rb
	$ rspec spec/rsack/server_spec.rb

****
Posteriormente escribir en el navegador utilizado:

	http://localhost:9292

###Notas:
- Aconsejo usar la herramienta para desarrolladores de Google Chrome para visualizar que las cookies existen.
