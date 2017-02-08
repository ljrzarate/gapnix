module Journyx
  class PublishMultipleTask
    attr_reader :task_object
     example = [{:description=>"myTaskDesc1", :project=>"myPry1", :category=>"myCateg1", :times=>[{:hours=>0.0, :wday=>"Tuesday"}, {:hours=>0.0, :wday=>"Wednesday"}]}, {:description=>"fsdf", :project=>"myPry1", :category=>"myCateg1", :times=>[{:hours=>0.0, :wday=>"Tuesday"}, {:hours=>0.0, :wday=>"Wednesday"}]}, {:description=>"ggggssgs", :project=>"myPry1", :category=>"myCateg1", :times=>[{:hours=>0.0, :wday=>"Tuesday"}]}]
    def initialize(task_object)
      @task_object = task_object
    end

    def publish
      task_object.each do |task|
        task[:times].each do |time|
          param = {
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