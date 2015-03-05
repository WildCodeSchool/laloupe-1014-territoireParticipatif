class PagesController < ApplicationController
  before_action :authenticate_animateur!, only: [:animation]

  def intro
    @projets = Projet.last(3).reverse
  end

  def charte
  end

  def mentions
  end

  def howto
  end

  def animation
    @actualites = Actualite.order(created_at: :desc)
    @projets = Projet.order(id: :desc)
    @commentaires = Commentaire.order(created_at: :desc)
  end

end
