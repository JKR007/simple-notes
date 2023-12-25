class LineItemsController < ApplicationController
  before_action :set_note
  before_action :set_line_item_date
  before_action :set_line_item, only: [:edit, :update, :destroy]

  def new
    @line_item = @line_item_date.line_items.new
  end

  def create
    @line_item = @line_item_date.line_items.new(line_item_params)

    if @line_item.save
      respond_to do |format|
        format.html { redirect_to note_path(@note), notice: "Item was successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Item was successfully created!" }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      respond_to do |format|
        format.html { redirect_to note_path(@note), notice: "Item was successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Item was successfully updated!" }
      end
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to note_path(@note), notice: "Item was successfully removed!" }
      format.turbo_stream { flash.now[:notice] = "Item was successfully removed!" }
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:name, :description, :quantity, :unit_price)
  end

  def set_note
    @note = current_company.notes.find(params[:note_id])
  end

  def set_line_item_date
    @line_item_date = @note.line_item_dates.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end
end
