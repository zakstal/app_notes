---IntroRailsVideoDemo: 14-radio-and-textarea
COAT_COLORS = colors

validation :cat_colors, inclustion: COAT_COLORS
<label for="cat_coat_color">Coat color</label>
  <select name="cat[coat_color]" id="cat_coat_color">
  <% Cat::COAT_COLORS.each do |coat_color| %>
    <optoin value="<%= coat_color %>"
      <%= "selected" if cat.coat_color == coat_color %>
      <T= coat_color.upcase %>
      </optoins>
      <% end %>

the selected is to keep the options selected


<% Cat::COAT_COLORS.each do |coat_clorl| %>
  <label>
    <input type="radio"
           name="cat[coat_color]"
           value="<%= cat_coat_color%>"

         <%= "checked" if cat.coat_color == coat_color%>
      <%= coat_coat_color.upcase%>
    </label>
  <% end %>

can do rake db:drop db:create db:create all in one migration

---IntroRailsVideoDemo: 15-helpers---

truncate cat description

<a href="<%= cat_url(cat) %>">
<%= cat.name %>
(<%= cat.descriptoin.slice(0, 20) %>
<%= "..." if cat.descriptoin.length > 20 %>)
</a>

can make

def cat_link(cat)
  "<a href=\"#{cat_url(cat)}\">#{cat.name}</a>".html_safe
end
the hatml_safe will prevent rails from making this < into "lessthan"

use instead

use h() or html_escape(cat.name)
"<aheref=\"#{cat_url(cat)}\">#{h(cat.name)}</a>".html_safe

button to helper method
<%= button_to "Destroy cat", cat_url(cat), method: delete %>

---IntroRailsVideoDemo: 16-tag-ids-setter---

checkboxes
check boxes

compund index a cat can only be tagged once with a tag

add_index :taggings, :cat_id
add_index :taggings, :tag_id
add_index :taggings, [:cat_id, :tag_id], unique: true

validate a column in the context of another column

validates :tag_id, uniqyeness: { scope: :cat_id }
?: has many defined many methods?

has_many :tags, thorugh: :tagggings

#cat#tags <<<
#cat#tag_ids <<
#cat#tag_ids=
# * Creates/Destroys records in a join table.
# * new_tags = [1, 2, 3]
#* markov.tag_ids=(new_gats)

first is queries markv.tags_ids to get the ids fo markov's crueent tags.
any ids in new_tags no in markov.tag_ids ye, it builds and saves
a new tagging object with cat-id: markov/id, tag_id: new_tag_id
?: ask johnathan about theses tags_to_destroy/tags_to_create at time 13:00

ActiveRecord::Base.transaction
?: what is the aboive

def my_set_tag_ids(new_tag_ids)
  old_tag_ids = self.tag_ids

  tag_ids_to_destroy = old_tag_ids - new_tag_ids
  tag_ids_to_create = new_tag_ids = old_tag_ids

  ActiveRecord::Base.transaction do
    Taggin.where(cat_id: self.id, tag_id: tag_ids_to_destroy).destroy_all
    Taggin
  end
end

the transaction is for when you are doing multiple things and they have to be all or nothing. ActiveRecord::Base.transaction will roll back everything is something goes wrong. If everything goes fine it will commit

---IntroRailsVideoDemo: 17-checkboxes-1---

we can get an array of tag ids by adding a extra bracket cat[tag_ids][]

<% Tag.all.each do |tag| %>
  <label>
    <input type="checkbox" name="cat[tag_ids][]" value="<%= tag.id %>">
    <%= tag.name %>
    </label>
    <br>
  <% end %>


---IntroRailsVideoDemo: 18-checkoutx-2---

?: what is dependent: destroy?
?: inverse_of
has_many :taggings, dependent: :destroy, inverse_of :cat

---IntroRailsVideoDemo: 19-checkboxes-3---

for when there is not tags selected

  <input type="hidden" name="cat[tag_ids][]" value="">

---IntroRailsVideoDemo: 20-query-string---
this is a way to find all the cats with a cerain tag if that tag is selected
the .cats is an association

?: is it the name: params[:tag] that filters the association
def index
  if params[:tag]
    @cats = Tag.find_by(name: params[:tag]).cats
  else
    @cats = Cat.all
  end

end


can retunr a list of all cats tagged with a selected tag in cats_url(tag: tag.name) by passing the hash

<h1> All the cats!</h2>

<ul>
<li><%= link_to "All", cats_url %></li>
<% Tag.all.each do |tag| %>
  <li><%= linkto_tag.name, cats_url(tag: tag.name) %></li>
  <% end %>
</ul>

<ul>
<% @cats.each do |cat| %>
  <li>
  <%= cat_link(cat) %>

  <%- button_to "Destroy Cat", cat_url(cat), method: :delete %>

  </li>
  <% end %>
</ul>

<%= link_to "New Cat!", new_cat_url %>


