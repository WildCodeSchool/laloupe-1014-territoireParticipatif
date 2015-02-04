require 'test_helper'

class ProjetTest < ActiveSupport::TestCase

  test "ne peux pas créer une idée sans titre" do
    projet = projets(:sans_titre)
    assert_not projet.save
  end

  test "ne peux pas créer une idée sans objectif" do
    projet = projets(:sans_objectif)
    assert_not projet.save
  end

  test "ne peux pas créer une idée sans description" do
    projet = projets(:sans_description)
    assert_not projet.save
  end

  test "peux créer une idée avec titre, objectif et description" do
    projet = projets(:valide)
    assert projet.save
  end

end
