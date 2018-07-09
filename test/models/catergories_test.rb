require "test_helper"

class CatergoriesTest < ActiveSupport::TestCase
   
   def setup
      @category = Category.new(name: "Sports") 
   end
   
   test "Category is Valid" do
    #   cat = Category.new ""
    #   assert cat.valid?
    assert @category.valid?
   end
   
   test "Category name is valid" do
      cat = Category.new name: " "
      assert_not cat.valid? 
   end
   
   test "Category name is unique" do
       @category.save
       dup_cat = Category.new(name: "Sports")
       assert_not dup_cat.valid?
   end
   
   test "Category name is not less than 3" do
      invalid_cat = Category.new(name: "aa")
      assert_not invalid_cat.valid?
   end
    
end