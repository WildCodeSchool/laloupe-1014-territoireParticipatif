require 'test_helper'

class IdeesControllerTest < ActionController::TestCase

  def setup
    @idee = idees(:valide)
  end

  test "lister les idées" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idees)
    assert_template 'pages/intro'
  end

  test "afficher une idée" do
    get :show, id: @idee.id
    assert_response :success
    assert_select 'h1', @idee.titre
  end

  test "nouvelle idée" do
    get :new
    assert_response :success
    assert_not_nil assigns(:idee)
    assert_template :new
  end

  test "créer une idée" do
    post :create, idee: {titre: 'MyString', objectif: 'MyString', description: 'MyText'}
    assert_equal @idee.titre, assigns(:idee).titre
    assert_redirected_to idee_path assigns(:idee)
  end

  test "redirige vers new si idée invalide" do
    post :create, idee: {titre: '', objectif: 'MyString', description: 'MyText'}
    assert_template :new
  end

  test "editer une idee" do
    get :edit, id: @idee.id
    assert_response :success
    assert_equal @idee.id, assigns(:idee).id
  end

  test "mettre à jour une idée" do
    patch :update, id: @idee.id, idee: {titre: 'YourString', objectif: 'MyString', description: 'MyString'}
    assert_equal @idee, assigns(:idee)
    assert_equal 'YourString', assigns(:idee).titre
    assert_redirected_to idee_path assigns(:idee)
  end

  test "echec de mise à jour d'une idée" do
    patch :update, id: @idee.id, idee: {titre: '', objectif: 'MyString', description: 'MyString'}
    assert_template :edit
  end

end
