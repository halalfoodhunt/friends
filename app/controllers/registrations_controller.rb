class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @registration.build_card
    @membership = Membership.find_by id: params["membership_id"]
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
   @registration = Registration.new(registration_params)
    if @registration.save
      case params['payment_method']
        when "paypal"
          redirect_to @registration.paypal_url(registration_path(@registration))
      end
    else
      render :new
    end
  end
  
  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:name, :name_person_2, :ic_number, :ic_person_2, :dob_person_2, :email_person_2, :date_of_birth, :contact_number, :email, :instagram_account, :facebook_ads, :facebook_newsfeed, :facebook_video, :instagram, :shipping_address, :membership_id, card_attributes: [
                                               :first_name, :last_name, :card_type, :card_number,
                                               :card_verification, :card_expires_on] )
    end
end
