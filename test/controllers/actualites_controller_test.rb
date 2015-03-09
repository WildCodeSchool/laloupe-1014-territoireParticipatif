require 'test_helper'

class ActualitesControllerTest < ActionController::TestCase

  setup do
    @actu = create(:actualite)
    @animateur = create(:animateur)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actualites)
  end

  test "should get show" do
    get :show, id: @actu.id
    assert_response :success
    assert_equal @actu.id, assigns(:actualite).id
  end

  test "should get last actualite" do
    get :last_actu
    assert_redirected_to actualite_path @actu
  end

  ### new
  #
  test "rediriger vers le login si un visiteur demande new" do
    get :new
    assert_redirected_to new_contributeur_session_path
  end

  test "should not get new si un contributeur est connecté" do
    sign_in create(:contributeur)
    get :new
    assert_response 403
  end

  test "should get new si un animateur est connecté" do
    sign_in @animateur
    get :new
    assert_not_nil assigns(:actualite)
    assert_response :success
  end

  ### create
  #
  test "redirection vers new si create invalide" do
    sign_in @animateur
    post :create, actualite: {titre: ''}
    assert_not_nil assigns(:actualite)
    assert_template :new
  end

  test "créer quand animateur est connecté" do
    sign_in @animateur
    post :create, actualite: attributes_for(:actualite)
    assert_not_nil assigns(:actualite)
    assert_redirected_to actualite_path assigns(:actualite).id
  end

  ### edit
  #
  test "rediriger vers le login si un visiteur demande edit" do
    get :edit, id: @actu.id
    assert_redirected_to new_contributeur_session_path
  end

  test "should not get edit si un contributeur est connecté" do
    sign_in create(:contributeur)
    get :edit, id: @actu.id
    assert_response 403
  end

  test "should get edit si un animateur est connecté" do
    sign_in @animateur
    get :edit, id: @actu.id
    assert_response :success
    assert_not_nil assigns(:actualite)
    assert_equal @actu.id, assigns(:actualite).id
  end

  ### update
  #
  test "une update invalide redirige vers edit" do
    sign_in @animateur
    titre, contenu = "", "Mise à jour"
    patch :update, id: @actu.id, actualite: {titre: titre, contenu: contenu}
    assert_not_nil assigns(:actualite)
    assert_template :edit
  end

  test "une update valide" do
    sign_in @animateur
    titre, contenu = "Autre titre", "Mise à jour"
    patch :update, id: @actu.id, actualite: {titre: titre, contenu: contenu}
    assert_not_nil assigns(:actualite)
    assert_equal titre, assigns(:actualite).titre
    assert_equal contenu, assigns(:actualite).contenu
    assert_redirected_to actualite_path @actu
  end

  test "contributeur ne peut pas supprimer une actu" do
    sign_in create(:contributeur)
    delete :destroy, id: @actu.id
    assert_response 403
  end

  test "animateur peut supprimer une actu" do
    count = Actualite.count
    sign_in @animateur
    delete :destroy, id: @actu.id
    assert_equal @actu, assigns(:actualite)
    assert_equal count - 1, Actualite.count
    assert_redirected_to animation_path
  end

end
