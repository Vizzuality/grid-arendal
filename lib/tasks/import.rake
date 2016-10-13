require 'csv'

namespace :import do

  desc "Import activities from client provided doc"
  task activities: :environment do
    csv_text = File.read(File.join(Rails.root, 'lib', 'data', 'GA-project-descriptions-2016.csv'))
    csv = CSV.parse(csv_text, :headers => true)
    puts "#{Activity.count}"
    csv.each do |row|
      next if row[1] && Activity.where(title: row[1].strip).any?
      Activity.create({
        project_number: row[0] && row[0].strip,
        title: row[1] && row[1].strip,
        #activity: row[2].strip,
        #programme: row[3],
        #staff_project_lead: row[4],
        short_description: row[5] && row[5].strip,
        description: row[6] && row[6].strip,
        #outcomes: row[7],
        #links: row[8],
        #partners: row[9],
        #staff: row[10].strip,
        #tags: row[11].strip
      })
    end
    puts "#{Activity.count}"
  end
end
