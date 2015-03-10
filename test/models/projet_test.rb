require 'test_helper'

class ProjetTest < ActiveSupport::TestCase

  setup do
    @contributeur = build(:contributeur)
    @projet = build(:projet, contributeur: @contributeur)
  end

  test "ne peux pas créer un projet sans titre" do
    @projet.titre = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer un projet sans code postal" do
    @projet.codepostal = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer un projet sans description" do
    @projet.description = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer un projet sans auteur" do
    @projet.contributeur = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer un projet sans catégorie" do
    @projet.categorie = nil
    assert_not @projet.valid?
  end

  test "créer un projet valide" do
    assert @projet.valid?
  end

  # @projet.liked_by?
  test "liked_by? renvoie false si le projet n'a pas de like" do
    assert_not @projet.liked_by? @contributeur
  end

  test "liked_by? renvoie true si le contributeur a liké le projet" do
    @projet.save
    @projet.likes.create(contributeur: @contributeur)
    assert @projet.liked_by?(@contributeur)
  end

  # @projet.abonnes
  test "un projet sans commentaire a son auteur comme abonné" do
    @projet.save
    assert_equal [@contributeur], @projet.abonnes
  end

  test "un projet avec 1 commentaire a 2 contributeurs comme abonnés" do
    @projet.save
    contrib = create(:contributeur)
    commentaire = create(:commentaire, projet: @projet, contributeur: contrib)
    assert_equal 2, @projet.abonnes.count
    assert @projet.abonnes.include? contrib
    assert @projet.abonnes.include? @contributeur
  end

end
