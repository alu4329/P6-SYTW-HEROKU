desc "Ejecución básica de la aplicación"
task :default do
  sh "rackup"
end

desc "Ejecución de los test unitarios"
task :test do
  sh "ruby test/test.rb"
end


desc "Ejecución de los test spec"
task :spec do
  sh "rspec spec/rsack/server_spec.rb"
end


desc "Ejecución de los test spec en formato extendido"
task :spec_documentado do
  sh "rspec -I. spec/rsack/server_spec.rb --format documentation"
end

