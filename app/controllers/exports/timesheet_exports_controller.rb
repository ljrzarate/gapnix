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
        ids_tasks: @ids_tasks,
        journyx_username: params[:journyx_username],
        journyx_password: params[:journyx_password]
      ).export
    end

end
# https://growthaccel.apps.journyx.com/jtcgi/jtgui.pyc?jxtcprn=227463
