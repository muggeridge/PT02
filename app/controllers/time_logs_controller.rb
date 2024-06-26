
class TimeLogsController < ApplicationController
    def index
        @time_logs = TimeLog.all
    end
    def new
    end
    def create
        @time_log = TimeLog.new(time_log_params)
        if( @time_log.save )
            redirect_to time_logs_path
        else
            redirect_to root_path
        end
    end

    def destroy 
        if TimeLog.find(params[:id]).destroy
            redirect_to time_logs_path
        else
            redirect_to root_path
        end
    end

    private

    def time_log_params
        params.require(:time_log).permit(
            :user_id, 
            :project_id,
            :week_num_id, 
            :date,
            :hours,
            :progress_comment
        )
    end
end