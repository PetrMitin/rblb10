require "test_helper"
require "selenium-webdriver"

class AuthomorphNumbersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @@driver = Selenium::WebDriver.for :chrome
    @@driver.navigate.to "http://127.0.0.1/authonumous-numbers/input"
  end

  test "should get input" do
    get authomorph_numbers_input_url
    assert_response :success
  end

  test "should get view" do
    get authomorph_numbers_view_url
    assert_response :success
  end
end
