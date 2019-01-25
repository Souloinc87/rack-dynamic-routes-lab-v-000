class Application

  @@itmes = [Item.new("bananas", 1.00), Item.new("oranges", 2.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      item_n = req.path.split(/items/).last
        if item = @@items.find{|i| i.name == i.item_n}
          resp.write item.price
        else
          resp.write "Route not found"
          resp.status = 404
        end
      else
        resp.write "Item not found"
        resp.status = 400

    end
    resp.finish
  end
end
