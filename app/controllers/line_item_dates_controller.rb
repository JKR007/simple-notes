class LineItemDatesController < ApplicationController
  before_action :set_note
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      redirect_to note_path(@note), notice: "Date was successfully updated!"
    else
      render :edit
    end
  end

  def new
    @line_item_date = @note.line_item_dates.new
  end

  def create
    @line_item_date = @note.line_item_dates.new(line_item_date_params)

    if @line_item_date.save
      redirect_to note_path(@note), notice: "Date was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy
    redirect_to note_path(@note), notice: "Date was successfully removed"
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
