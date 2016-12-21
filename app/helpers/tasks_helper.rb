module TasksHelper
    def get_begin_end_week_format
        "(#{Date.current.at_beginning_of_week.strftime("%d-%m-%Y")} To #{Date.current.at_end_of_week.strftime("%d-%m-%Y")})"
    end
end