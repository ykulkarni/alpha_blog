require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "Sports")
        @user =  User.create(username: "klrahul", email: "rahuldeputtar@abc.com", password: "password", admin: true)
    end
   
   test " Should return index " do
       get :index
       assert_response :success
   end
   
   test "should return new action" do
       session[:user_id] = @user.id
        get :new
        assert_response :success
   end
   
   test "should return show action" do
       get(:show, {'id' => @category.id})
       assert_response :success
   end
   
    test "should redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do
          post :create, category: { name: "sports" }
        end
        assert_redirected_to categories_path
    end
    
end