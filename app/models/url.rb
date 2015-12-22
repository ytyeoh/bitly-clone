class Url < ActiveRecord::Base
  def shorten


    self.short_url = rand(1000).to_s

  end
	# This is Sinatra! Remember to create a migration!


end


