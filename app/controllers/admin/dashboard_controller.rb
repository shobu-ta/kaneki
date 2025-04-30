class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin! # 管理者のみアクセス可

    def index
    end
  end

