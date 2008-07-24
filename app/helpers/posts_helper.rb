module Merb
        module PostsHelper
                def link_to_post(post, title = post.title)
                        link_to title, url_for_post(post)
                end
                
                def link_to_post_year(post, title = post.created_year)
                        link_to title, url_for_post_year(post)
                end
                
                def link_to_post_month(post, title = post.created_month)
                        link_to title, url_for_post_month(post)
                end
                
                def link_to_post_day(post, title = post.created_day)
                        link_to title, url_for_post_day(post)
                end

                def url_for_post_year(post)
                        "/archives/#{post.created_year}"
                end

                def url_for_post_month(post)
                        url_for_post_year(post) + "/#{post.created_month}"
                end
                
                def url_for_post_day(post)
                        url_for_post_month(post) + "/#{post.created_day}"
                end
                
                def url_for_post(post)
                        url_for_post_day(post) + "/#{post.slug}"
                end
                
                def title_of(post)
                        post.is_selected ? post.title : link_to_post(post)
                end
                
                def contents_of(post)
                        contents = post.is_selected ? post.contents : post.contents.first_paragraph
                        BlueCloth::new(contents).to_html
                end
        end
end
