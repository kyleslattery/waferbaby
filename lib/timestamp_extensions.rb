module DataMapper
        module Timestamp
                def created_year
                        created_on.strftime('%Y')
                end

                def created_month
                        created_on.strftime('%m')
                end
                
                def created_month_short_name
                        created_on.strftime('%b')
                end

                def created_day
                        created_on.strftime('%d')
                end
                
                def created_time
                        created_on.strftime('%I:%M%p')
                end

                def updated_year
                        updated_on.strftime('%Y')
                end

                def updated_month
                        updated_on.strftime('%m')
                end

                def updated_day
                        updated_on.strftime('%d')
                end
        end
end