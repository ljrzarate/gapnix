class BillableTask
  def initialize(user)
    @user = user 
  end

  def get_billable_remaining_time
    @user.tasks
  end
  def get_billable_wasted_time
    
  end 
end


