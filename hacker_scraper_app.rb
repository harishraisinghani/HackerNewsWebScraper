require_relative 'post'
require_relative 'comment'
require 'nokogiri'
require 'open-uri'

input_url = ARGV[0]

#Grab the HTML post
doc = Nokogiri::HTML(open(input_url))

#Initialize the Post
title = doc.search('.title > a:first-child').map {|link| link.inner_text}
url = "https://news.ycombinator.com/" + doc.search('.subtext > .age > a:first-child').map { |link| link['href']}[0]
points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}[0].scan(/\d+/).join().to_i
item_id = doc.search('.athing').map {|link| link['id']}[0]

post = Post.new(title,url,points,item_id)

#Initialize the Comments


user_id_arr = doc.search('.comhead > a:first-child').map{|span| span.inner_text}.drop(1)
age_arr = doc.search('.age > a:first-child').map{|span| span.inner_text}.drop(1)
comment_id_arr = doc.search('.age > a:first-child').map{|link| link['href']}.drop(1)
comment_arr = doc.search('.comment').map{|span| span.inner_text} #don't strip first element

for i in 0..(user_id_arr.length-1)
  post.add_comment(Comment.new(user_id_arr[i],age_arr[i],comment_id_arr[i].scan(/\d+/).join().to_i,comment_arr[i]))
end

puts "Post title: #{post.title}"
puts "Number of comments: #{post.num_comments}"



