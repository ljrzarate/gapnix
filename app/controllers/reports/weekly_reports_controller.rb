class Reports::WeeklyReportsController < ApplicationController
  
    add_breadcrumb I18n.t("reports.title"), :reports_weekly_reports_path

    def show
      @tasks = WeeklyReport.new(current_user).fetch.paginate(page: params[:page])
      
    end

end

