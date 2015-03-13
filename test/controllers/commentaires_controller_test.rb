require 'test_helper'

class CommentairesControllerTest < ActionController::TestCase

  setup do
    @contributeur = create(:contributeur)
    @animateur = create(:animateur)
    @projet = create(:projet)
    @commentaire = create(:commentaire, projet: @projet, contributeur: @contributeur)
  end

  test "should get new" do
    sign_in @contributeur
    get :new, projet_id: @projet.id
    assert_not_nil assigns(:projet)
    assert_redirected_to @projet
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
    assert_redirected_to projet_path @projet
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

  test "un animateur peut éditer un commentaire" do
    sign_in @animateur
    get :edit, projet_id: @projet.id, id: @commentaire.id
    assert_response :success
    assert_not_nil assigns(:commentaire)
  end

  test "redirige un visiteur vers login pour éditer un commentaire" do
    get :edit, projet_id: @projet.id, id: @commentaire.id
    assert_redirected_to new_contributeur_session_path
  end

  test "un contributeur ne peut pas éditer un commentaire" do
    sign_in @contributeur
    get :edit, projet_id: @projet.id, id: @commentaire.id
    assert_response 403
  end

  test "un contributeur ne peux pas mettre à jour un comentaire" do
    sign_in @contributeur
    comm_params = attributes_for(:commentaire)
    comm_params[:message] = "J'ai changé d'avis"
    patch :update, projet_id: @projet.id, id: @commentaire.id, commentaire: comm_params
    assert_response 403
  end

  test "un animateur peut mettre à jour un commentaire" do
    sign_in @animateur
    comm_params = attributes_for(:commentaire)
    comm_params[:message] = "J'ai changé d'avis"
    patch :update, projet_id: @projet.id, id: @commentaire.id, commentaire: comm_params
    assert_equal @commentaire, assigns(:commentaire)
    assert_equal "J'ai changé d'avis", assigns(:commentaire).message
    assert_redirected_to projet_path @projet
  end

  test "redirige vers edit si commentaire invalide" do
    sign_in @animateur
    comm_params = attributes_for(:commentaire)
    comm_params[:message] = ""
    patch :update, projet_id: @projet.id, id: @commentaire.id, commentaire: comm_params
    assert_not_nil assigns(:commentaire)
    assert_template :edit
  end

  test "redirige le visiteur vers login si suppression" do
    delete :destroy, projet_id: @projet.id, id: @commentaire.id
    assert_redirected_to new_contributeur_session_path
  end

  test "un contributeur ne peut pas supprimer un commentaire" do
    sign_in @contributeur
    delete :destroy, projet_id: @projet.id, id: @commentaire.id
    assert_response 403
  end

  test "un animateur peut supprimer un commentaire" do
    count = Commentaire.count
    sign_in @animateur
    delete :destroy, projet_id: @projet.id, id: @commentaire.id
    assert_not_nil assigns(:commentaire)
    assert_equal count - 1, Commentaire.count
    assert_redirected_to animation_path
  end

end
