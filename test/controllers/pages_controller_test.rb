require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "Perchons"
  end

  test "should get mentions" do
    get :mentions
    assert_response :success
    assert_select 'title', "Mentions légales - #{@base_title}"
  end

  test "la page charte existe" do
    get :charte
    assert_response :success
    assert_select 'title', "Charte d'utilisation - #{@base_title}"
  end

end
