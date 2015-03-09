class ContributeurMailer < ApplicationMailer

  def nouveau_commentaire(abonne, commentaire)
    @destinataire = abonne
    @commentaire = commentaire
    @projet_url = projet_url(@commentaire.projet_id)
    @subject = "Nouveau commentaire sur \"#{@commentaire.projet.titre}\""
    mail(to: @destinataire.email, subject: @subject)
  end

end
