class TimeReported::BillablesController < ApplicationController
  def index
    @billable = BillableTask.new(current_user).get_billable_remaining_time
  end

  
end