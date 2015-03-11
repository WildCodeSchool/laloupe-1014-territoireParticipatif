class NewsletterController < ApplicationController
  def inscription
    gb = Gibbon::API.new(ENV["MAILCHIMP_API"])

    begin
      gb.lists.subscribe({
        :id => ENV['MAILCHIMP_LIST_ID'],
        :email => {:email => params[:email]},
        :double_optin => true
      })
      notice = "Bravo, vous êtes inscrit à la newsletter, rendez vous dans votre boite mail afin de valider l'inscription"
    rescue Gibbon::MailChimpError => e
      notice = e.message
    end
    redirect_to root_url, notice: notice
  end
end
