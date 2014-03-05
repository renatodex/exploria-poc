class MerchantController < ApplicationController
	before_filter :layout_vars
	before_filter :check_merchant_hack
	
  def store
		@merchant = Merchant.find_by_id(params[:merchant_id])
  end

  def buy_items
		@merchant = Merchant.find_by_id(params[:merchant_id])
		@items = @merchant.item
  end

	def sell_items
		@merchant = Merchant.find_by_id(params[:merchant_id])
		@items = @logged_data.all_items
	end

  def buy_transaction
		params[:merchant_id]
		params[:item_id]
		
		merchant = Merchant.find_by_id(params[:merchant_id])
		item = Item.find_by_id(params[:item_id])
		
		if merchant.sells?(item)
			if @logged_data.pay?(item.price)
				@logged_data.item << item
			end
		end
		
		redirect_to merchant_buy_path
  end

  def sell_transaction
		hero_item = HeroItem.find_by_id(params[:hero_item_id])

		if @logged_data.has_item?(hero_item.item)
			@logged_data.receive_money(hero_item.item.resale_price)
			HeroItem.delete(hero_item.id)
		end
		
		redirect_to merchant_sell_path
  end

	private
	def check_merchant_hack
		@merchant = Merchant.find_by_id(params[:merchant_id])
		redirect_to scene_path if @merchant.scene != @logged_data.scene
	end
end
