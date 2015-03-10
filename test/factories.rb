FactoryGirl.define do


  factory :actualite do
    titre "Atelier Tourisme"
    contenu "Du contenu"
    image "http://mesimages.com/cat.png"
    animateur
  end

  factory :sondage do
    contributeur
  end

  sequence :email do |n|
    "contributeur#{n}@wcs.fr"
  end

  sequence :pseudo do |n|
    "contrib_#{n}"
  end

  factory :contributeur do
    email { generate :email }
    pseudo { generate :pseudo }
    password '12345678'
    password_confirmation '12345678'
    nom "Dupré"
    prenom "Camille"
    commune "La Loupe"
    sexe "F"
    status "secondaire"
    annee_naissance 1988
    charte true
    confirmed_at Time.now
    type 'Contributeur'

    factory :animateur, class: Animateur do
      type 'Animateur'
    end
  end

  factory :commentaire do
    message 'yolo'
    contributeur
    projet
  end

  factory :projet do
    titre "Des cours de code en primaire"
    codepostal "28240"
    description "Le code comme outil créatif"
    contributeur
    categorie
  end

  factory :like do
    projet
    contributeur
  end

  factory :categorie do
    nom 'Agriculture'
  end

end
