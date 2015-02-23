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
