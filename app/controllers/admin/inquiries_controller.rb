class Admin::InquiriesController < ApplicationController
  def index
    @inquiry = Inquiry.all
    # ページネーション追加予定
  end
end
