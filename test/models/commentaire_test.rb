require 'test_helper'

class CommentaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ne pas créer de commentaire sans message" do
    commentaire = commentaires(:sans_message)
    assert_not commentaire.save
  end

  test "un message appartient à un projet et à un contributeur" do
    assert commentaires(:valide).save
    commentaire = Commentaire.find(1)
    assert_equal commentaire.projet.id, 1
    assert_equal commentaire.contributeur.id, 1
  end
end
