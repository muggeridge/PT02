class FormBulkTimeLog
    include ActiveModel::Model

    attr_accessor :user_id, :week_num_id, :project_ids,  
                  :mon_hours, :mon_progress_comments,
                  :tues_hours, :tues_progress_comments,
                  :wed_hours, :wed_progress_comments,
                  :thur_hours, :thur_progress_comments,
                  :fri_hours, :fri_progress_comments,
                  :sat_hours, :sat_progress_comments,
                  :sun_hours, :sun_progress_comments

    validate :project_id_selected_and_day_entries_valid 


    def save
        return false if invalid?

        first_date_of_week = Date.commercial(@week_num_id.to_s[0..3].to_i,@week_num_id.to_s[4..5].to_i)

        ActiveRecord::Base.transaction do
            @project_ids.each_with_index do |project_id, i|   
                if project_id != ""
                    7.times do |j| 
                        hours = hours_from_index(j,i) 
                        TimeLog.create!(user_id: @user_id,
                                    project_id: project_id,
                                    week_num_id: @week_num_id,
                                    date: first_date_of_week.advance(days: j),
                                    hours: hours,
                                    progress_comment: progress_from_index(j,i)) if hours != "" 
                    end
                end
            end
        end
        true

    rescue ActiveRecord::RecordInvalid => e
        errors.add(:base, e.message)
        false
    end

    private

    def progress_from_index(day_index, project_index)
        days = [:mon, :tues, :wed, :thur, :fri, :sat, :sun]
        str = days[day_index].to_s + "_progress_comments"
        instance_variable_get("@" + str)[project_index]
    end

    def hours_from_index(day_index, project_index)
        days = [:mon, :tues, :wed, :thur, :fri, :sat, :sun]
        str = days[day_index].to_s + "_hours"
        instance_variable_get("@" + str)[project_index]
    end

    def project_id_selected_and_day_entries_valid 
        valid = true
        @project_ids.each_with_index do |project_id, i| 
            all_pairs = [
                            [@mon_hours[i],   @mon_progress_comments[i]  ],  
                            [@tues_hours[i],  @tues_progress_comments[i] ], 
                            [@wed_hours[i],   @wed_progress_comments[i]  ],
                            [@thur_hours[i],  @thur_progress_comments[i] ],
                            [@fri_hours[i],   @fri_progress_comments[i]  ],
                            [@sat_hours[i],   @sat_progress_comments[i]  ],
                            [@sun_hours[i],    @sun_progress_comments[i] ]
                        ]
            valid_pair_count = 0
            blank_pair_count = 0
            all_pairs.each do |pair|
                if pair[0] == "" and pair[1] == ""
                    blank_pair_count += 1
                elsif pair[0] != "" and pair[1] != ""
                    valid_pair_count += 1
                end
            end
            invalid_pair_count = 7 - valid_pair_count - blank_pair_count

            if  (project_id != "" and invalid_pair_count == 0 and valid_pair_count > 0 )  or
                (project_id == "" and blank_pair_count == 7)

                valid = true
            else
                valid = false
                
                errors.add("form validation", "project column " + (i+1).to_s + ": project not selected or hours/progress pair incomplete")
            end
        end
        valid

    end

end