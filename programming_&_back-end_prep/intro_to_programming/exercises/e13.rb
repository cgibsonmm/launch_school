contacts = {
    "Joe Smith" => {:email=>"joe@email.com", :address=>"123 Main st.", :number=>"555-123-4567"},

    "Sally Johnson" => {:email=>"sally@email.com", :address=>"404 Not Found Dr.", :number=>"123-234-3454"}
  }

  puts contacts["Joe Smith"][:email]
  puts contacts["Sally Johnson"][:number]
