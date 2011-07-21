module ProfileUrlsHelper
  # to be used in url display name dropdowns
  # ex:
  #  <%= f.select :display_name, options_for_select(url_label_list) %>
  def url_label_list
    [['Your Website', 'Your Website'], ['PlentyOfFish', 'PlentyOfFish'], ['Match.com', 'Match.com']]
  end
end
