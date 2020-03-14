class Application

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)

      if !@@cart.empty?
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      else
        resp.write "Your cart is empty"
      end


    elsif req.path.match(/add/)

      search_term = req.params["item"]

      if @@items.include?(search_term)
        @@cart << search_term
        resp.write "added Figs"
      else
        resp.write "We don't have that item"
      end
   end
    resp.finish
  end
end
