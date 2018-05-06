class application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_n = req.path.split("/items/").last

      ite = @@items.find{|x| x.name == item_n}

      if ite.nil?
        resp.write "Item not found"
        resp.Status = 400
      else
        resp.write.ite.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
