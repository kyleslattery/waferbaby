module Merb
    module PostsHelper
            
            def link_to_post(post)
                    link_to post.title + ('.'), url_for_post(post)
            end
            
            def url_for_post(post)
                    "/archives/#{post.created_on.year}/#{post.created_on.month}/#{post.created_on.day}/#{post.slug}"
            end
    end
end
