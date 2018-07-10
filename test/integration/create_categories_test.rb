require "test_helper.rb"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    def setup
        @user =  User.create(username: "klrahul", email: "rahuldeputtar@abc.com", password: "password", admin: true)
    end
    
    test "Create categories Test" do
        sign_in_as(@user,"password")
        get new_category_path
        assert_template "categories/new"
        assert_difference 'Category.count', 1 do
            post_via_redirect categories_path, category: {name: "sports"}
        end
        assert_template "categories/index"
        assert_match "sports", response.body
    end
    
    test "Create invalid categories Test" do
        sign_in_as(@user,"password")
        get new_category_path
        assert_template "categories/new"
        assert_no_difference 'Category.count' do
            post categories_path, category: {name: " "}
        end
        assert_template "categories/new"
        assert_select "div.panel-title"
    end
end