require_relative '../config/environments/init.rb'






values = []

File.open("urls", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  values << line.gsub(/[(,)]/i, '').chomp
end

Url.transaction do 
	values.each do |x|
		b = rand(1000000).to_s
		Url.connection.execute("INSERT INTO urls (long_url, short_url,created_at, updated_at) VALUES ('#{x}', '#{b}', '#{Time.now}', '#{Time.now}');")
			end
		end
		
	
