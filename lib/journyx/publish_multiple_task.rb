module Journyx
  class PublishMultipleTask
    attr_reader :task_object, :username, :password
    def initialize(task_object, username, password)
      @task_object = task_object
      @username = username
      @password = password
    end

    def publish
      task_object.each do |task|
        task[:times].each do |time|
          params = {
            username: username,#"yhormanperez",
            password: password,#"DiasExtremos1412",
            project: task[:project],
            category: task[:category],
            description: task[:description],
            hours: time[:hours],
            wday: time[:wday]
          }
          PublishSingleTask.new(params).post_data
        end
      end
    end
  end 
end