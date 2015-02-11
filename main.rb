require "sinatra"
require "sqlite3"
require_relative "product"
require_relative "location"
require_relative "category"
require_relative "database_methods"
require_relative "db_setup"
require_relative "driver_methods"
require_relative "driver"
require_relative "warehouse_database.db"



# include Helper

# doesn't have to match exactly ie greeting...welcome
get "/" do
  erb :welcome, :layout=> :boilerplate
end

get "/add_prod"  do
  erb :add_product, :layout=> :boilerplate
 # person = params["my_name"]  #if type in localhost:4567/?my_name = "will get info from here "
end

get "/create_prod" do
  prod = Product.new(params)
  prod.insert(products)
  erb :create_product, :layout=> :boilerplate
end

get "/edit_prod"  do
  erb :edit_product, :layout=> :boilerplate
  # person = params["my_name"]
 #
 #  "Hello, #{person}"
end

get "/delete_prod"  do
  erb :delete_product, :layout=> :boilerplate
  
end