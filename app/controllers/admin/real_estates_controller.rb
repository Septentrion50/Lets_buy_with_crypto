class Admin::RealEstatesController < ApplicationController
  before_action :is_admin?, :user_signed_in?

  def index
    @estates = estates_all
  end

  def new
  end

  def create
    @real_estate = RealEstate.new(estate_params)
    @real_estate.user = current_user

    if @real_estate.save
      flash[:notice] = "Real estate created!"
      @real_estate.pictures.attach(params[:pictures])
      redirect_to admin_real_estates_path
    else
      flash.now[:notice] = "Ouppps !"
      render :new
    end
  end

  def show
  end

  def edit
    @real_estate = estate_find
  end

  def update
    @real_estate = estate_find

    if @real_estate.update(estate_params)
      flash[:notice] = "Real estate updated!"
      @real_estate.pictures.attach(params[:pictures])
      redirect_to admin_real_estates_path
    else
      flash.now[:notice] = "Ouppps !"
      render :edit
    end
  end

  def destroy
    @real_estate = estate_find
    @real_estate.destroy
    redirect_to admin_real_estates_path
  end

  private

  def estates_all
    RealEstate.all
  end

  def estate_find
    RealEstate.friendly.find(params[:id])
  end

  def estate_params
      params.permit(
        :name,
        :price,
        :description,
        :adress,
        :zipcode,
        :city,
        pictures: []
      )
  end
end
