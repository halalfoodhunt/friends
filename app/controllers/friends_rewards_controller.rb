class FriendsRewardsController < ApplicationController
  http_basic_authenticate_with :name => "ss08", :password => "ss08", only: :index
  before_action :set_friends_reward, only: [:show, :edit, :update, :destroy]

  # GET /friends_rewards
  # GET /friends_rewards.json
  def index
    @friends_rewards = FriendsReward.all
  end

  # GET /friends_rewards/1
  # GET /friends_rewards/1.json
  def show
  end

  # GET /friends_rewards/new
  def new
    @friends_reward = FriendsReward.new
  end

  # GET /friends_rewards/1/edit
  def edit
  end

  # POST /friends_rewards
  # POST /friends_rewards.json
  def create
    @friends_reward = FriendsReward.new(friends_reward_params)

    respond_to do |format|
      if @friends_reward.save
        format.html { redirect_to @friends_reward, notice: 'Friends reward was successfully created.' }
        format.json { render :show, status: :created, location: @friends_reward }
      else
        format.html { render :new }
        format.json { render json: @friends_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_rewards/1
  # PATCH/PUT /friends_rewards/1.json
  def update
    respond_to do |format|
      if @friends_reward.update(friends_reward_params)
        format.html { redirect_to @friends_reward, notice: 'Friends reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @friends_reward }
      else
        format.html { render :edit }
        format.json { render json: @friends_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_rewards/1
  # DELETE /friends_rewards/1.json
  def destroy
    @friends_reward.destroy
    respond_to do |format|
      format.html { redirect_to friends_rewards_url, notice: 'Friends reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_reward
      @friends_reward = FriendsReward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friends_reward_params
      params.require(:friends_reward).permit(:business_name, :listing_link, :address, :friends_terms, :featured_image, :reward_id)
    end
end
