require 'csv'

namespace :populate do
  desc "Populating User DataBase"
  task user: :environment do
    puts "Populating user DB"
    CSV.foreach('user.csv', :headers => true) do |row|
      unless User.find_by_email(row.to_hash['email'])
        User.create!(row.to_hash)
      end
    end
  end
end
