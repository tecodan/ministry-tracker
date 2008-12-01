require File.dirname(__FILE__) + '/../test_helper'

class ImportsControllerTest < ActionController::TestCase
  fixtures Campus.table_name
  def setup
    login
  end
  
  test "new" do
    get :new
    assert assigns(:import)
    assert_response :success
  end
  
  test "create" do
    file = fixture_file_upload('/files/sample_import.csv', 'text/csv')
    post :create, :import => {:uploaded_data => file},  :html => { :multipart => true }, :campus_id => Campus.first.id
    assert assigns(:import)
    assert_equal(1, assigns(:successful))
    assert_response :redirect
    assert_redirected_to '/people/directory'
  end
  
  test "create with no good rows" do
    file = fixture_file_upload('/files/sample_import_bad.csv', 'text/csv')
    post :create, :import => {:uploaded_data => file},  :html => { :multipart => true }, :campus_id => Campus.first.id
    assert assigns(:import)
    assert_equal(0, assigns(:successful))
    assert_equal(1, assigns(:unsuccessful))
    assert_response :success, @response.body
  end
  
  test "create with one of each" do
    file = fixture_file_upload('/files/sample_import_one_of_each.csv', 'text/csv')
    post :create, :import => {:uploaded_data => file},  :html => { :multipart => true }, :campus_id => Campus.first.id
    assert assigns(:import)
    assert_equal(1, assigns(:successful))
    assert_equal(1, assigns(:unsuccessful))
    assert_response :redirect
    assert_redirected_to '/people/directory'
  end
end
