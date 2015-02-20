require 'test_helper'

class ProjetTest < ActiveSupport::TestCase

  setup do
    @projet = build(:projet)
  end

  test "ne peux pas créer un projet sans titre" do
    @projet.titre = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer un projet sans objectif" do
    @projet.objectif = nil
    assert_not @projet.valid?
  end

  test "ne peux pas créer une idée sans description" do
    @projet.description = nil
    assert_not @projet.valid?
  end

  test "peux créer une idée avec titre, objectif et description" do
    assert @projet.valid?
  end

end
