class FormBulkTimeLogsController < ApplicationController
    def new
        @form_bulk_time_log = FormBulkTimeLog.new
    end
    def create
        @form_bulk_time_log = FormBulkTimeLog.new(user_id: allowed_params[:user_id],
                                                  project_id_p1: allowed_params[:project_id_p1],
                                                  project_id_p2: allowed_params[:project_id_p2],
                                                  week_num_id: allowed_params[:week_num_id],
                                                  mon_progress_comment_p1: allowed_params[:mon_progress_comment_p1],
                                                  mon_progress_comment_p2: allowed_params[:mon_progress_comment_p2],
                                                  tues_progress_comment_p1: allowed_params[:tues_progress_comment_p1],
                                                  tues_progress_comment_p2: allowed_params[:tues_progress_comment_p2],
                                                  wed_progress_comment_p1: allowed_params[:wed_progress_comment_p1],
                                                  wed_progress_comment_p2: allowed_params[:wed_progress_comment_p2],
                                                  thur_progress_comment_p1: allowed_params[:thur_progress_comment_p1],
                                                  thur_progress_comment_p2: allowed_params[:thur_progress_comment_p2],
                                                  fri_progress_comment_p1: allowed_params[:fri_progress_comment_p1],
                                                  fri_progress_comment_p2: allowed_params[:fri_progress_comment_p2],
                                                  sat_progress_comment_p1: allowed_params[:sat_progress_comment_p1],
                                                  sat_progress_comment_p2: allowed_params[:sat_progress_comment_p2],
                                                  sun_progress_comment_p1: allowed_params[:sun_progress_comment_p1],
                                                  sun_progress_comment_p2: allowed_params[:sun_progress_comment_p2],
                                                  mon_hours_p1: allowed_params[:mon_hours_p1],
                                                  mon_hours_p2: allowed_params[:mon_hours_p2],
                                                  tues_hours_p1: allowed_params[:tues_hours_p1],
                                                  tues_hours_p2: allowed_params[:tues_hours_p2],
                                                  wed_hours_p1: allowed_params[:wed_hours_p1],
                                                  wed_hours_p2: allowed_params[:wed_hours_p2],
                                                  thur_hours_p1: allowed_params[:thur_hours_p1],
                                                  thur_hours_p2: allowed_params[:thur_hours_p2],
                                                  fri_hours_p1: allowed_params[:fri_hours_p1],
                                                  fri_hours_p2: allowed_params[:fri_hours_p2],
                                                  sat_hours_p1: allowed_params[:sat_hours_p1],
                                                  sat_hours_p2: allowed_params[:sat_hours_p2],
                                                  sun_hours_p1: allowed_params[:sun_hours_p1],
                                                  sun_hours_p2: allowed_params[:sun_hours_p2]
                                                 )


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
            :project_id_p1,
            :project_id_p2,
            :week_num_id,
            :mon_progress_comment_p1,
            :mon_progress_comment_p2,
            :tues_progress_comment_p1,
            :tues_progress_comment_p2,
            :wed_progress_comment_p1,
            :wed_progress_comment_p2,
            :thur_progress_comment_p1,
            :thur_progress_comment_p2,
            :fri_progress_comment_p1,
            :fri_progress_comment_p2,
            :sat_progress_comment_p1,
            :sat_progress_comment_p2,
            :sun_progress_comment_p1,
            :sun_progress_comment_p2,
            :mon_hours_p1,
            :mon_hours_p2,
            :tues_hours_p1,
            :tues_hours_p2,
            :wed_hours_p1,
            :wed_hours_p2,
            :thur_hours_p1,
            :thur_hours_p2,
            :fri_hours_p1,
            :fri_hours_p2,
            :sat_hours_p1,
            :sat_hours_p2,
            :sun_hours_p1,
            :sun_hours_p2
        )
    end
end