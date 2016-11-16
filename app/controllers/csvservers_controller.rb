require 'csv'

class CsvserversController < ApplicationController
  include ActionController::Live

  def root
    # @users = User.csv
    # send_data @users, filename: "users-#{Date.today}.csv"
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = "inline; filename='users-#{Date.today}.csv'"
    response.stream.write ["first name", "last name", "email", "opted in?", "user creation date", "company", "venue", "company creation date"].to_csv
    User.includes(:company).find_each do |user|
      response.stream.write "#{user.first_name},#{user.last_name},#{user.email},#{user.opt_in},#{user.created_at},#{user.company.name},#{user.company.venue},#{user.company.created_at}\n"
    end
    response.stream.close
  end

end
