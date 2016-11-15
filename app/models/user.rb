require "csv"

class User < ActiveRecord::Base

  belongs_to :company

  def self.csv
    users = ["first name", "last name", "email", "opted in?", "user creation date", "company", "venue", "company creation date"].to_csv
    User.all.includes(:company).limit(10).each do |user|
      users += [user.first_name, user.last_name, user.email, user.opt_in, user.created_at, user.company.name, user.company.venue, user.company.created_at].to_csv
    end
    users
  end

end
