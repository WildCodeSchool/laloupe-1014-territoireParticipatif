require 'test_helper'

class ContributeurTest < ActiveSupport::TestCase

  setup do
    @count = Contributeur.count
    @contributeur = build(:contributeur)
  end

  test "ne doit pas créer un contributeur sans email" do
    @contributeur.email = ''
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans pseudo" do
    @contributeur.pseudo = ''
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans nom" do
    @contributeur.nom = ''
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans prénom" do
    @contributeur.prenom = ''
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans date de naissance" do
    @contributeur.annee_naissance = nil
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans commune" do
    @contributeur.commune = nil
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans status" do
    @contributeur.status = nil
    assert_not @contributeur.valid?
  end

  test "ne doit pas créer un contributeur sans sexe" do
    @contributeur.sexe = nil
    assert_not @contributeur.valid?
  end


  test "ne doit pas créer un contributeur avec un email déjà utilisé" do
    @contributeur.save
    contributeur = build(:contributeur, email: @contributeur.email)
    assert_not contributeur.valid?
  end

  test "ne doit pas créer un contributeur avec un pseudo déjà utilisé" do
    @contributeur.save
    contributeur = build(:contributeur, pseudo: @contributeur.pseudo)
    assert_not contributeur.valid?
  end

  test "ne doit pas créer un contributeur avec un mot de passe trop court" do
    @contributeur.password = 'aaa'
    @contributeur.password = 'aaa'
    assert_not @contributeur.valid?
  end

  test "ne pas créer un contributeur si il n'a pas signé la charte" do
    @contributeur.charte = false
    assert_not @contributeur.valid?
  end

  test "créer un contributeur valide" do
    assert @contributeur.save
    assert Contributeur.count == @count + 1
  end
end
