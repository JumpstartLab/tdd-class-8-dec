# test this with controller test
# submit the JSON that hypothetically comes in via the API
# check the JSON that comes back
# I have two tests (positive and negative case),
# because I'm really just testing that everything was wired up right
class SearchController < ApiController
  # POST /api/v1/search (json)
  def search
    # params = {
    # ...,
    # search: {
    #     date_range: {start_date: '2013-01-01', end_date: '2014-01-01'}
    #   }
    # }
    query   = GenerateQuery.call(Permissions.new(current_service))
    results = ExecuteQuery.new(query)
    render json: results.page(1)
  end
end


# tests about what it will allow / disallow based on permissions and features
class SearchFormPresenter < ActiveModel::Base
  def initialize(privileges, features)
    @privileges = privileges
    @features   = features
  end

  def date_range(&block)
    return unless @privileges.date_range? && @features[:change_detection]
    block.call
  end
  
  # other things we might see
  def form_class
    # logic to generate the clas on the form, easy to test
  end
end

RSpec.describe "SearchFormPresenter" do
  describe 'date range form elements' do
    def privileges_with(overrides)
      defaults = {
        date_range:       true,
        change_detection: true,
      }
      Privileges.new(defaults.merge overrides)
    end
    def features
      @features ||= {change_detection: true}
    end
    it 'renders the date_range form when everything allows allow' do
      presenter = SearchFormPresenter.new(privileges_with({}), features)
      expect(presenter.date_range { :pass }).to eq :pass
    end
    it 'doesn\'t render when you don\'t have permission' do
      # multiple ways to do this, but that would be testing the Permissions object
      # and it's got its own tests. We're just interested in the fact that date_range? returns false
      presenter  = SearchFormPresenter.new(privileges_with(date_range: false), features)
      expect(presenter.date_range { :pass }).to eq nil
    end
    it 'doesn\'t render when you haven\'t turned on that feature' do
      presenter = SearchFormPresenter.new(privileges_with({}), features.merge(change_detection: false))
      expect(presenter.date_range { :pass }).to eq nil
    end
  end
end


# search/query.html.erb
# <%= form_for @search_presenter, url: search_path, class: @search_presenter.form_class do |f| %>
#   <%= presenter.date_range do %>
#     <%= f.date_time :start_date %>
#     <%= f.date_time :end_date %>
#   <% end %>
# <% end %>












