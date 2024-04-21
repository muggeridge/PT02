module TimeLogHelper
    def collect_weeks 
        select = []
        (-4..4).each do |i| #-4 to +4 weeks shown in drop down
            date_offset = Date.today + i.weeks

            select << [week_desc_from_date(date_offset), week_num_id(date_offset)]
        end
        select
    end

    def week_desc_from_date(date)
        format = "%b %d"
        date.beginning_of_week.strftime(format).to_s + " - " + date.end_of_week.strftime(format).to_s    
    end

    def week_desc_from_week_num_id(week_num_id)
        year = week_num_id.to_s[0,4]
        week_num = week_num_id.to_s[4,2]
        week_desc_from_date(Date.commercial(year.to_i, week_num.to_i))
    end

    def week_num_id(date)
        date.year.to_s + date.strftime("%W")
    end
end