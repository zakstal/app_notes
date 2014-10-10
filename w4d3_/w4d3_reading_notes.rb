---Action Mailer Basics---

$ rails generate mailer UserMailer


calss UserMailer < ActionMailer::Base

def welcome_email(user)
  @user = suer
  @url = 'http://example.com/login'
  mail(to: suer.email, subject: 'Welcome to My Awesome Site')
end

mail method returns an object of Mail::Message

call #deliver to send


define a views template

make a text version of the email

make a file called welcom_email.text.erb

Welcome to example.com, <%= @user.name %>
===============================================

You have successfully signed up to example.com,
your username is: <%= @user.login %>.

To login to the site, just follow this link: <%= @url %>.

Thanks for joining and have a great day!

end


add attachments

attachments['filename.jpg'] = File.read(filename)

default url
config.action_mailer.default_url_options = { host: 'address' }

gem letter_opener # run in development

gem "letter_opener", group: :development

# config/environments/development.rb
config.action_mailer.delivery_method = :letter_opener


---View Helpers---

common helpers (form_for), including assets (javascript_include_tag)

we can write our own helpers that are stored in :
app/helpers/#{controller}_helper.rb


caputre a block in erb

<%= long_quote("name") do %>

  <% end %>

<%= yeild %> can be inserted in multiple places

<%= yield :head %>

to render in to content in a name yield use:
content_for

<% content_for :head do %>
  <title>A simple page </title>
<% end %>


assest tags

use javasript_inlcud_tag "example"
<script src="/assets/common.js"></script>

and for css
stylesheet_link_tag

stylesheet_link_tag "application"
# => <link href="/assets/application.css" media="screen" rel="stylesheet" />


---Partials---

to render a partial

<%= render "footer" %>

render objects

<% @cats.each do |cat| %>
  <%= render "cat", cat: cat %>
<% end %>

can render a collection
<%= render @cats %>


example of passing local variables
<form action="<%= action_url %>" method="post">
  <% if @user.persisted? %>
    <input type="hidden" name="_method" value="put">
  <% end %>
  <!-- inputs go here... -->
</form>