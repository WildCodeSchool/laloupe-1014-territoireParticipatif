class AnimateurMailer < ApplicationMailer

  def nouveau_projet(animateur, projet)
    @destinataire = animateur
    @projet = projet
    @projet_url = projet_url(@projet.id)
    @contributeur = @projet.contributeur
    @subject = "Nouveau projet \"#{@projet.titre}\""
    mail(to: @destinataire.email, subject: @subject)
  end

end
