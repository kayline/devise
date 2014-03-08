require '../test_helper'

class CustomResponderIntegrationTest < ActionDispatch::IntegrationTest
  test "Devise uses ActionController::Responder when no responder_path is specified" do
    get 'users/sign_in'

    assert_template 'devise/sessions/new'
  end

  test 'Devise uses custom responder when responder_path is specified' do
    Devise.responder_name= 'CustomResponder'
    load '/Users/pivotal/workspace/devise/app/controllers/devise_controller.rb'

    get 'users/sign_in', {}, {'ACCEPT' => 'application/json'}
    assert_equal response.body, '{"i_am_a":"json_response"}'
    assert_equal response.content_type, 'application/json'
  end
end