desc "Fetch Google results"
task :fetch_results => :environment do

  require 'mechanize'
  agent = WWW::Mechanize.new
  
  agent.get("http://www.google.com/")
  form = agent.page.forms.first
  form.submit
  
  agent.page.link_with(:text => "Wish List").click
  agent.page.search(".edit_item").each do |item|
    Product.create!(:name => item.text.strip)
  end
end