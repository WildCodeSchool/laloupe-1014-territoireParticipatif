require 'test_helper'

class IdeeTest < ActiveSupport::TestCase

  test "ne peux pas créer une idée sans titre" do
    idee = idees(:sans_titre)
    assert_not idee.save
  end

  test "ne peux pas créer une idée sans objectif" do
    idee = idees(:sans_objectif)
    assert_not idee.save
  end

  test "ne peux pas créer une idée sans description" do
    idee = idees(:sans_description)
    assert_not idee.save
  end

  test "peux créer une idée avec titre, objectif et description" do
    idee = idees(:valide)
    assert idee.save
  end

end
