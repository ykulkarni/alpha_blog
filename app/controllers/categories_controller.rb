class CategoriesController < ApplicationController
   
   before_action :require_admin, only: [:new, :create]
   
   def show
      
   end
   
   def new
      @category = Category.new
   end
   
   def create
      @category = Category.new(set_params)
      if @category.save
         flash[:success] = "Category created successfully"
         redirect_to categories_path
      else
         render :new
      end
   end
   
   def index
      @categories = Category.all
   end
   
   private
   def set_params
       params.require(:category).permit(:name)
   end
   
   def require_admin
      unless logged_in? && current_user.admin? 
         flash[:danger] = "You need to login before you can create category"
         redirect_to categories_path
      end
   end
   
   
    
end