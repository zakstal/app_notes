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