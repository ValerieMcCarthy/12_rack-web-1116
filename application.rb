class Application

  def call(env)
    request = Rack::Request.new(env)
    if request.get? && request.path == '/'
      render('index.html')
    elsif request.get? && request.path == '/dogs'
      render('dogs.html')
    elsif request.get? && request.path == '/books' && request.params["id"]
      @book = Book.find(request.params["id"])
      render("books/show.html.erb")
    elsif request.get? && request.path == '/books'
      @books = Book.all
      render('books/index.html.erb')
    else
      resp = Rack::Response.new('Not Found', 404)
      resp.finish
    end
    # if the person makes a request to home, I want to respond with 'Welcome Home'
    # if they make a request to '/dogs' i want to respond with 'Woof!!'
  end

  def render(file_path)
    resp = Rack::Response.new
    template = File.read("./app/views/#{file_path}")
    erb_instance = ERB.new( template )
    result = erb_instance.result( binding )
    resp.write( result )
    resp.finish
  end

end
