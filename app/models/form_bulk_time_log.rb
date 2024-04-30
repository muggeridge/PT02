class FormBulkTimeLog
    include ActiveModel::Model

    attr_accessor :user_id, :week_num_id, :project_id_p1, :project_id_p2, 
                  :mon_hours_p1, :mon_hours_p2, :mon_progress_comment_p1, :mon_progress_comment_p2,
                  :tues_hours_p1, :tues_hours_p2, :tues_progress_comment_p1, :tues_progress_comment_p2,
                  :wed_hours_p1, :wed_hours_p2, :wed_progress_comment_p1, :wed_progress_comment_p2,
                  :thur_hours_p1, :thur_hours_p2, :thur_progress_comment_p1, :thur_progress_comment_p2,
                  :fri_hours_p1, :fri_hours_p2, :fri_progress_comment_p1, :fri_progress_comment_p2,
                  :sat_hours_p1, :sat_hours_p2, :sat_progress_comment_p1, :sat_progress_comment_p2,
                  :sun_hours_p1, :sun_hours_p2, :sun_progress_comment_p1, :sun_progress_comment_p2

    validate :project_id_selected_and_day_entries_valid 

    def save
        return false if invalid?

        first_date_of_week = Date.commercial(@week_num_id.to_s[0..3].to_i,@week_num_id.to_s[4..5].to_i)

        ActiveRecord::Base.transaction do
            if @project_id_p1 != ""  
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 0),
                                hours: @mon_hours_p1,
                                progress_comment: @mon_progress_comment_p1) if @mon_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 1),
                                hours: @tues_hours_p1,
                                progress_comment: @tues_progress_comment_p1) if @tues_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 2),
                                hours: @wed_hours_p1,
                                progress_comment: @wed_progress_comment_p1) if @wed_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 3),
                                hours: @thur_hours_p1,
                                progress_comment: @thur_progress_comment_p1) if @thur_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 4),
                                hours: @fri_hours_p1,
                                progress_comment: @fri_progress_comment_p1) if @fri_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 5),
                                hours: @sat_hours_p1,
                                progress_comment: @sat_progress_comment_p1) if @sat_progress_comment_p1 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p1,
                                week_num_id: @week_num_id,
                                date: first_date_of_week.advance(days: 6),
                                hours: @sun_hours_p1,
                                progress_comment: @sun_progress_comment_p1) if @sun_progress_comment_p1 != "" 
            end

            if @project_id_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @mon_hours_p2,
                                progress_comment: @mon_progress_comment_p2) if @mon_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @tues_hours_p2,
                                progress_comment: @tues_progress_comment_p2) if @tues_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @wed_hours_p2,
                                progress_comment: @wed_progress_comment_p2) if @wed_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @thur_hours_p2,
                                progress_comment: @thur_progress_comment_p2) if @thur_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @fri_hours_p2,
                                progress_comment: @fri_progress_comment_p2) if @fri_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @sat_hours_p2,
                                progress_comment: @sat_progress_comment_p2) if @sat_progress_comment_p2 != "" 
                TimeLog.create!(user_id: @user_id,
                                project_id: @project_id_p2,
                                week_num_id: @week_num_id,
                                hours: @sun_hours_p2,
                                progress_comment: @sun_progress_comment_p2) if @sun_progress_comment_p2 != "" 

            end
            
        end
        true

    rescue ActiveRecord::RecordInvalid => e
        errors.add(:base, e.message)
        false
    end

    private

    def project_id_selected_and_day_entries_valid 
        valid = true
        if @project_id_p1 != "" 
            valid = !( @mon_progress_comment_p1 == "" && 
                    @tues_progress_comment_p1 == "" && 
                    @wed_progress_comment_p1 == "" && 
                    @thur_progress_comment_p1 == "" && 
                    @fri_progress_comment_p1 == "" && 
                    @sat_progress_comment_p1 == "" && 
                    @sun_progress_comment_p1 == "" ) 

        end
        if @project_id_p2 != "" 
            valid = !( @mon_progress_comment_p2 == "" && 
                    @tues_progress_comment_p2 == "" && 
                    @wed_progress_comment_p2 == "" && 
                    @thur_progress_comment_p2 == "" && 
                    @fri_progress_comment_p2 == "" && 
                    @sat_progress_comment_p2 == "" && 
                    @sun_progress_comment_p2 == "" ) 
        end

        if valid == false
            errors.add("form validation", "project selected but at least 1 progress comment not made")
        end

        valid
    end

end