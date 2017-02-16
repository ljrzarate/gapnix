class Exports::TimesheetExportsController < ApplicationController
  
    add_breadcrumb I18n.t("exports.title"), :exports_timesheet_exports_path 

    def show
      # @tasks = WeeklyReport.new(current_user).fetch.paginate(page: params[:page])
      @tasks = WeeklyReport.new(current_user).getTaskAndTaskTimes
    end

    def create
      @ids_tasks = params[:exports][:tasks_ids].split(",").map(&:to_i)
      binding.pry
      @resultSet = TimesheetExport.new(
        current_user: current_user,
        task_ids: @ids_tasks,
        journyx_username: params[:exports][:journyx_username],
        journyx_password: params[:exports][:journyx_password]
      ).export
    end

end
# Shttps://growthaccel.apps.journyx.com/jtcgi/jtgui.pyc?jxtcprn=227463
