#
# =>    posts_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module PostsHelper
                def link_to_post(post, title = post.title)
                        link_to(title,
                                url_for_post(post),
                                :title => "View the full '#{post.title}' post."
                        )
                end
                
                def link_to_post_year(post, title = post.created_year)
                        link_to(title,
                                url_for_post_year(post),
                                :title => "View all posts made in #{post.created_year}."
                        )
                end
                
                def link_to_post_month(post, title = post.created_month)
                        link_to(title,
                                url_for_post_month(post),
                                :title => "View all posts made on #{post.created_year}/#{post.created_month}."
                        )
                end
                
                def link_to_post_day(post, title = post.created_day)
                        link_to(title,
                                url_for_post_day(post),
                                :title => "View all posts made on #{post.created_year}/#{post.created_month}/#{post.created_day}."
                        )
                end
                
                def link_to_post_categories(post)
                        post.categories.collect do |category|
                                if category.slug == params[:category]
                                        category.name
                                else
                                        link_to(category.name,
                                                url(:post_category, :category => category.slug),
                                                :title => "View all posts filed under '#{category.name}'."
                                        )                                
                                end
                        end.join(', ')
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
