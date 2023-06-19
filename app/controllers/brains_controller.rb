class BrainsController < ApplicationController
  before_action :set_brain, %i[edit show create destroy]

  def new
    @brain = Brain.new
  end

  def index
    @brains = Brain.all
  end

  def show; end

  def edit
  end

  def destroy
    @brain.destroy
    redirect_to brains_path, status: :see_other
  end

  private

  def brain_params
    params.require(:brain).permit(:name, :description, :price)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
class BrainsController < ApplicationController
  before_action :set_brain, %i[edit show create update destroy]

  def new
    @brain = Brain.new
  end

  def create
    @brain = Brain.new(brain_params)
    if @brain.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @brains = Brain.all
  end

  def show; end

  def edit
  end

  def update
    @brain.update(brain_params)
    redirect_to brain_path(@brain)
  end

  def destroy
    @brain.destroy
    redirect_to brains_path, status: :see_other
  end

  private

  def brain_params
    params.require(:brain).permit(:name, :description, :price)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
