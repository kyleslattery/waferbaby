module DataMapper
        module Timestamp
                def created_year
                        created_at.strftime('%Y')
                end

                def created_month
                        created_at.strftime('%m')
                end
                
                def created_month_short_name
                        created_at.strftime('%b')
                end

                def created_day
                        created_at.strftime('%d')
                end
                
                def created_time
                        created_at.strftime('%I:%M%p')
                end
        end
end