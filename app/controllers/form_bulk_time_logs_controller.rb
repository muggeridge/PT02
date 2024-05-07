class FormBulkTimeLogsController < ApplicationController
    def new
        @form_bulk_time_log = FormBulkTimeLog.new
    end

    def create
        binding.break
        @form_bulk_time_log = FormBulkTimeLog.new(allowed_params)

        if @form_bulk_time_log.save
            redirect_to time_logs_path 
        else
            flash[:notice] = @form_bulk_time_log.errors 
            redirect_to root_path 
        end
    end

    private

    def allowed_params
        params.require(:form_bulk_time_log).permit(
            :user_id,
            :week_num_id,
            project_ids: [],
            mon_hours: [],
            mon_progress_comments: [],
            tues_hours: [],
            tues_progress_comments: [],
            wed_hours: [],
            wed_progress_comments: [],
            thur_hours: [],
            thur_progress_comments: [],
            fri_hours: [],
            fri_progress_comments: [],
            sat_hours: [],
            sat_progress_comments: [],
            sun_hours: [],
            sun_progress_comments: []
        )
    end
end