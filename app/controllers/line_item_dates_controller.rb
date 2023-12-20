class LineItemDatesController < ApplicationController
  before_action :set_note
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to note_path(@note), notice: "Date was successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @line_item_date = @note.line_item_dates.new
  end

  def create
    @line_item_date = @note.line_item_dates.new(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to note_path(@note), notice: "Date was successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy

    respond_to do |format|
      format.html { redirect_to note_path(@note), notice: "Date was successfully removed!" }
      format.turbo_stream { flash.now[:notice] = "Date was successfully removed!" }
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_note
    @note = current_company.notes.find(params[:note_id])
  end

  def set_line_item_date
    @line_item_date = @note.line_item_dates.find(params[:id])
  end
end
