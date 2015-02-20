require 'test_helper'

class CommentairesControllerTest < ActionController::TestCase

  setup do
    @contributeur = create(:contributeur)
    @projet = create(:projet)
  end

  test "should get new" do
    sign_in @contributeur
    get :new, projet_id: @projet.id
    assert_response :success
    assert_not_nil assigns(:commentaire)
  end

  test "ne pas accéder au formulaire de commentaires sans contributeur connecté" do
    get :new, projet_id: @projet.id
    assert_redirected_to new_contributeur_session_path
  end

  test "ne peux pas créer de commentaire si l'utilisateur n'est pas connecté" do
    post :create, projet_id: @projet.id, commentaire: {message: 'yoo'}
    assert_redirected_to new_contributeur_session_path
  end

  test "redirection à la création d'un commentaire invalide" do
    sign_in @contributeur
    post :create, projet_id: @projet.id, commentaire: {message: ''}
    assert_template :new
  end

  test "créer un commentaire valide" do
    sign_in @contributeur
    post :create, projet_id: @projet.id, commentaire: {message: 'yoo'}
    assert_not_nil assigns(:commentaire), "@commentaire doit être définis"
    assert_equal 'yoo', assigns(:commentaire).message, "Le commentaire ne contient pas de message"
    assert_equal @projet.id, assigns(:commentaire).projet_id, "Le commentaire n'a pas été asocié au bon projet"
    assert_equal @contributeur.id, assigns(:commentaire).contributeur_id, "Le commentaire n'a pas été associé au bon contributeur"
    assert_redirected_to projet_path(@projet.id), "L'utilisateur doit être redirigé vers `/projets/1`"
  end

end
