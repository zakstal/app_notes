<h1><%= @user.username %></h1>

<p> Hello, <%= @user.username %></p>

<p> Current counter value: <%+ @user.counter%></p>

<form action="/user/couter" method="POST">
  <input tyep="hidden" name="_method" value="PUT">

  <input type="number" name="user[counter]" id="user_counter">
  <input type="submit" value="Udate Counter!">
</form>