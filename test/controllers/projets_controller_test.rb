require 'test_helper'

class ProjetsControllerTest < ActionController::TestCase

  def setup
    @projet = projets(:valide)
  end

  test "lister les projets" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projets)
    assert_equal Projet.count, assigns(:projets).count
    assert assigns(:projets).first.updated_at > assigns(:projets).last.updated_at,
      "les projets ne sont pas classés par date de mise à jour décroissante"
    assert_template 'pages/intro'
  end

  test "afficher un projet" do
    get :show, id: @projet.id
    assert_response :success
    assert_select 'h1', @projet.titre
    assert_select 'p', @projet.objectif
    assert_select 'p', @projet.description
  end

  test "nouveau projet" do
    get :new
    assert_response :success
    assert_not_nil assigns(:projet)
    assert_template :new
  end

  test "créer un projet" do
    post :create, projet: {titre: 'MyString', objectif: 'MyString', description: 'MyText'}
    assert_equal @projet.titre, assigns(:projet).titre
    assert_redirected_to projet_path assigns(:projet)
  end

  test "redirige vers new si projet invalide" do
    post :create, projet: {titre: '', objectif: 'MyString', description: 'MyText'}
    assert_template :new
  end

  test "editer un projet" do
    get :edit, id: @projet.id
    assert_response :success
    assert_equal @projet.id, assigns(:projet).id
  end

  test "mettre à jour un projet" do
    patch :update, id: @projet.id, projet: {titre: 'YourString', objectif: 'MyString', description: 'MyString'}
    assert_equal @projet, assigns(:projet)
    assert_equal 'YourString', assigns(:projet).titre
    assert_redirected_to projet_path assigns(:projet)
  end

  test "echec de mise à jour d'un projet sans titre" do
    patch :update, id: @projet.id, projet: {titre: '', objectif: 'MyString', description: 'MyString'}
    assert_template :edit
  end

end
