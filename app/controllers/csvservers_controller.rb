require 'csv'

class CsvserversController < ApplicationController

  def root
    @users = User.csv
    send_data @users, filename: "users-#{Date.today}.csv"
  end

end
