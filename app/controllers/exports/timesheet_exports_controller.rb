class Exports::TimesheetExportsController < ApplicationController
  
    add_breadcrumb I18n.t("exports.title"), :exports_timesheet_exports_path 

    def show
      # @tasks = WeeklyReport.new(current_user).fetch.paginate(page: params[:page])
      @tasks = WeeklyReport.new(current_user).getTaskAndTaskTimes.paginate(page: params[:page])
    end

    def create 
      @ids_tasks = params[:exports][:tasks_ids].split(",").map(&:to_i)
      binding.pry
      @resultSet = TimesheetExport.new(current_user, @ids_tasks).export
    end

end

