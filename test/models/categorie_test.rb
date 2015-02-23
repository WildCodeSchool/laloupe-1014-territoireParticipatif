require 'test_helper'

class CategorieTest < ActiveSupport::TestCase

  setup do
    @categorie = build(:categorie)
  end

  test "une catégorie sans nom est invalide" do
    @categorie.nom = ''
    assert_not @categorie.valid?
  end

  test "créer une catégorie valide" do
    assert @categorie.valid?
  end

end
