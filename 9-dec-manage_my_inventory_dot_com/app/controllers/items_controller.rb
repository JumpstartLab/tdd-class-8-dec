class ItemsController < ApplicationController
  class SearchPresenter
    extend  ActiveModel::Naming
    include ActiveModel::Validations
    include ActiveModel::MassAssignmentSecurity
    include ActiveModel::Conversion

    def persisted?
      false
    end

    def initialize(attributes = {})
      attributes ||= {}
      attributes.each { |k, v| send "#{k}=", v }
    end

    def color
    end

    def color_select
      CharacteristicType
        .where(name: 'color')
        .first
        .characteristics
        .map { |c| [c.name, c.id] }
    end
  end

  def search
    @search = SearchPresenter.new
  end

  def results
    @items = Item.find_by_sql([
      'select * from items
         where (items.merchant_id = ?)
         and (items.id in
               (select item_id from item_to_characteristics
                  where characteristic_id in (?)))',
      current_merchant.id,
      params[:search].values
    ])
  end
end
