require 'test_helper'

class SondagesControllerTest < ActionController::TestCase

  def setup
    @contributeur = create(:contributeur)
  end

  test "nouveau sondage" do
    sign_in @contributeur
    get :new
    assert_response :success
    assert_not_nil assigns(:sondage)
    assert_template :new
  end

  test "utilisateur connecté" do
    get :new
    assert_redirected_to new_contributeur_session_path
  end

  test "redirige vers l'acceuil si sondage déjà répondu" do 
    create(:sondage, contributeur: @contributeur)
    sign_in @contributeur
    get :new
    assert_redirected_to root_path
  end

  test "creation sondage" do
    sign_in @contributeur
    post :create, sondage: {utilisation_fixe: 'MyString'}
    assert_not_nil assigns(:sondage)
    assert_equal @contributeur.id, assigns(:sondage).contributeur_id
    assert_redirected_to merci_path
  end

end
