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

  test "ne peux pas créer un projet sans objectif" do
    @projet.objectif = nil
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

  test "créer un projet valide" do
    assert @projet.valid?
  end

  test "liked_by? renvoie false si le projet n'a pas de like" do
    assert_not @projet.liked_by? @contributeur
  end

  test "liked_by? renvoie true si le contributeur a liké le projet" do
    @projet.save
    @projet.likes.create(contributeur: @contributeur)
    assert @projet.liked_by?(@contributeur)
  end

end
