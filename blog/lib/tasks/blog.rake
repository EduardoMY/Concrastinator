desc "Fetch Google results"
task :fetch_results => :environment do
  require 'rubygems'
  require 'mechanize' 
  require 'hpricot'

  agent = Mechanize.new 
  agent.user_agent_alias = 'Linux Firefox' 
  page = agent.get('http://google.com/') 
  google_form = page.form('f') google_form.q = 'hello world'

  page = agent.submit(google_form)

   page.links.each do |link|
  if link.href.to_s =~/url.q/
          str=link.href.to_s
          strList=str.split(%r{=|&}) 
          url=strList[1]
          # if You need cached url's then just remove this condition and simply use URL's 
          if ! url.include? "webcache"
              puts url
          end
       end
    end

end