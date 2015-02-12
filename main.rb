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
  @products = Product.all("products")
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
   @prods = Product.all("products")
  erb :delete_product, :layout=> :boilerplate
end

get "/confirm_prod_delete" do
  Product.delete_record(params["table"], params["id"])
  @prods = Product.all("products")
  erb :confirm_del_product, :layout=> :boilerplate
end

get "/add_cat" do
  @cats=Category.all("categories")
  erb :add_category, :layout=> :boilerplate
end
  
get "/create_cat" do
  new_category = Category.new(params)
  new_category.insert("categories")
  @cats=Category.all("categories")
  erb :create_category, :layout=> :boilerplate
end

get "/delete_cat"  do
   @cats = Category.all("categories")
  erb :delete_category, :layout=> :boilerplate
end

get "/confirm_cat_delete" do
  Category.delete_record(params)
  @cats = Category.all("categories")
  erb :confirm_cat_delete, :layout=> :boilerplate
end
  
get "/add_loc" do
  @locs=Location.all("locations")
  erb :add_location, :layout=> :boilerplate
end

get "/create_loc" do
  new_location = Location.new(params)
  new_location.insert("locations")
  @locs=Location.all("locations")
  erb :create_location, :layout=> :boilerplate
end

get "/delete_loc"  do
   @locs = Location.all("locations")
  erb :delete_location, :layout=> :boilerplate
end

get "/cat_delete" do
  Location.delete_record(params)
  @locs = Location.all("locations")
  erb :confirm_loc_delete, :layout=> :boilerplate
end