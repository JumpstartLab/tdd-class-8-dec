class ItemsController < ApplicationController
  class ItemSearch
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
    @item_search = ItemSearch.new
  end
end
