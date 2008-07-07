module Merb
        module PostsHelper
                def link_to_post(post)
                        link_to post.title + ('.'), url_for_post(post)
                end
                
                def link_to_post_year(post)
                        link_to post.created_on.year, url_for_post_year(post)
                end
                
                def link_to_post_month(post)
                        link_to post.created_on.strftime('%m'), url_for_post_month(post)
                end
                
                def link_to_post_day(post)
                        link_to post.created_on.day, url_for_post_day(post)
                end

                def url_for_post_year(post)
                        "/archives/#{post.created_on.year}"
                end

                def url_for_post_month(post)
                        url_for_post_year(post) + "/#{post.created_on.strftime('%m')}"
                end
                
                def url_for_post_day(post)
                        url_for_post_month(post) + "/#{post.created_on.day}"
                end
                
                def url_for_post(post)
                        url_for_post_day(post) + "/#{post.slug}"
                end
        end
end
