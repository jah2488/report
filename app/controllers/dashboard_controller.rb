class DashboardController < ApplicationController
  def index
    @title = "People, Pets, and Meals | Dashboard"
    @users = User.all
  end

  def reports
  end

  def all_report
    respond_to do |format|
      format.csv do
        render text: User.to_csv
      end
      format.html do
      end
      format.pdf do
      end
    end
  end
end
