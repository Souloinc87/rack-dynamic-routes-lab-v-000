class Application

  @@itmes = [Item.new("bananas", 1.00), Item.new("oranges", 2.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match("/items")
      resp.write " "
    else
      resp.write "Item not found"
      resp.status = 400
    end
    resp.finish
  end
end
