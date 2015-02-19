class DashboardController < ApplicationController
  def index
    @title = "People, Pets, and Meals | Dashboard"
    @users = User.all
  end

  def reports
  end

  def all_report
    @users = User.all
    @pets  = Pet.all
    respond_to do |format|
      format.csv do
        send_data User.to_csv, filename: 'users_report.csv', disposition: 'download'
      end
      format.html do
        render layout: 'pdf'
      end
      format.pdf do
        send_data PDFKit.new(all_report_url(format: 'html')), filename: 'all_report.pdf'
      end
    end
  end
end
