require 'test_helper'

class ActualiteTest < ActiveSupport::TestCase

  setup do
    @actu = build(:actualite)
  end

  test "une actualité sans titre est invalide" do
    @actu.titre = ''
    assert_not @actu.valid?
  end

  test "une actualité sans auteur est invalide" do
    @actu.animateur_id = nil
    assert_not @actu.valid?
  end

  test "une actualité sans image est invalide" do
    @actu.image = nil
    assert_not @actu.valid?
  end

  test "une actualité valide" do
    assert @actu.valid?
  end

  test "une actualité dont l'image ne commence pas par http n'est pas valide" do
    @actu.image = "monimage.png"
    assert_not @actu.valid?
  end

end
