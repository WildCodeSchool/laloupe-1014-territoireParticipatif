require 'test_helper'

class CommentaireTest < ActiveSupport::TestCase

  setup do
    @commentaire = build(:commentaire)
  end

  test "un commentaire valide" do
    assert @commentaire.valid?
  end

  test "ne pas créer de commentaire sans message" do
    @commentaire.message = nil
    assert_not @commentaire.valid?
  end

  test "un message appartient à un projet et à un contributeur" do
    assert @commentaire.projet
    assert @commentaire.contributeur
  end
end
