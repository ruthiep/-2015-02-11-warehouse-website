require "sinatra"
require 'pry'
require 'sqlite3'
DATABASE = SQLite3::Database.new('warehouse_database.db')
require_relative "db_setup"
require_relative "database_methods"
require_relative 'location'
require_relative 'category'
require_relative "product"
require_relative "driver_methods"
include DriverMethods


# include Helper

get "/" do
  erb :welcome, :layout=> :boilerplate
end

get "/add_prod" do
  erb :add_product, :layout=> :boilerplate
end

get "/create_prod" do
  new_product = Product.new(params)
  new_product.insert("products")
  product_list
  erb :create_product, :layout=> :boilerplate
end

get "/edit_prod" do
  # product_list
  #make a form that is pre-populated with the values for them to change, and then save
  erb :edit_product, :layout=> :boilerplate
  # person = params["my_name"]
 #
 #  "Hello, #{person}"
end

get "/delete_prod"  do
  erb :delete_product, :layout=> :boilerplate
end

get "/confirm_prod_delete" do
  Product.delete_record(params)
  erb :confirm_del_product, :layout=> :boilerplate
end

get "/add_cat" do
  
  erb :add_category, :layout=> :boilerplate
end
  
get "/create_cat" do
  new_category = Category.new(params)
  new_category.insert("categories")
  category_list
  erb :create_category, :layout=> :boilerplate
end
  
get "/add_loc" do
  erb :add_location, :layout=> :boilerplate
end

get "/create_loc" do
  new_location = Location.new(params)
  new_location.insert("locations")
  location_list
  erb :create_location, :layout=> :boilerplate
end