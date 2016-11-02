class UnbillablesController < ApplicationController
  def index
    @unbillable = BillableTask.new current_user
    @unbillable.get_billable_wasted_time
  end

  
end