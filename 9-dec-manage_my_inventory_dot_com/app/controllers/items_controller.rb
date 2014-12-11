class ItemsController < ApplicationController
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
                 params[:search].values])
  end
end
