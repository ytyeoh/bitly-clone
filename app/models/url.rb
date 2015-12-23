class Url < ActiveRecord::Base
# validates :email, :email_validation
validates :long_url, presence: true
validates :long_url, format: { with: URI.regexp }, if: Proc.new { |a| a.long_url.present? }

  def shorten
    self.short_url = rand(1000).to_s
  end
	# This is Sinatra! Remember to create a migration!


end


