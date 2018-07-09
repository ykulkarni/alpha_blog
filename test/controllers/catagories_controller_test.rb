require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "Sports")
    end
   
   test " Should return index " do
       get :index
       assert_response :success
   end
   
   test "should return new action" do
        get :new
        assert_response :success
   end
   
   test "should return show action" do
       get(:show, {'id' => @category.id})
       assert_response :success
   end
    
end