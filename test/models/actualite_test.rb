require 'test_helper'

class ActualiteTest < ActiveSupport::TestCase

  setup do
    @actu = build(:actualite)
  end

  test "une actualité sans titre est invalide" do
    @actu.titre = ''
    assert_not @actu.valid?
  end

  test "une actualité valide" do
    assert @actu.valid?
  end
end
