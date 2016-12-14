class Application

  def call(env)
    request = Rack::Request.new(env)
    resp = Rack::Response.new
    if request.get? && request.path == '/'
      resp.write( File.read('./app/views/index.html') )
    elsif request.get? && request.path == '/dogs'
      resp.write( File.read('./app/views/dogs.html') )
    elsif request.get? && request.path == '/books'
      @books = Book.all
      template = File.read('./app/views/books/index.html.erb')
      erb_instance = ERB.new( template )
      result = erb_instance.result( binding )
      resp.write( result )
    else
      resp = Rack::Response.new('Not Found', 404)
    end
    resp.finish
    # if the person makes a request to home, I want to respond with 'Welcome Home'
    # if they make a request to '/dogs' i want to respond with 'Woof!!'
  end

end
