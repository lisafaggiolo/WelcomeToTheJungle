class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with  name: ENV["HTTP_ADMIN_USERNAME"],
                                password: ENV["HTTP_ADMIN_PASSWORD"],
                                except: :index

  def show
    @products = Product.all.count
    @categories = Category.all.count
    
  end
end
