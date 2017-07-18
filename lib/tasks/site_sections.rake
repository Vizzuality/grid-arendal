namespace :initialize do

  desc "Creates objects for site sections with default descriptions"
  task site_sections: :environment do
    puts "started with #{SiteSection.count}"
    SiteSection::SECTIONS.each do |section|
      SiteSection.find_or_create_by(section: section)
    end
    puts "ended with #{SiteSection.count}"
  end
end
