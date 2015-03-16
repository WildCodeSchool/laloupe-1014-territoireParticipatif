CarrierWave.configure do |config|
  config.sftp_host = "ftp.innoveduc.fr"
  config.sftp_user = ENV["FTP_USER"]
  config.sftp_url = "http://storage.percheparticipatif.fr"
  config.sftp_folder = "storage/percheparticipatif"
  config.sftp_options = {
    password: ENV["FTP_PASSWORD"],
    port: 21
  }
end
