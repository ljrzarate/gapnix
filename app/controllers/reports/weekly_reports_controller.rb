class Reports::WeeklyReportsController < ApplicationController

    def show
      @tasks = WeeklyReport.new(current_user).fetch.paginate(page: params[:page])
    end

end

