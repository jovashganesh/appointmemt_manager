require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
      get contact_index_url
      assert_response :success
      assert_template layout: 'application'
      assert_select 'h1', 'Contact us'
      assert_select 'p', 'Complete this form to get in touch with us'
    end
  end
