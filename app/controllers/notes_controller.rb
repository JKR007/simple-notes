class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_company.notes.desc
  end

  def show
    @line_item_dates = @note.line_item_dates.ordered
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_company.notes.build(note_params)

    if @note.save
      respond_to do |format|
        format.html { redirect_to notes_path, notice: "Note was successfully created!" }
        format.turbo_stream { flash.now[:notice] = "Note was successfully created!" }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to notes_path, notice: "Note was successfully updated!" }
        format.turbo_stream { flash.now[:notice] = "Note was successfully updated!" }
      end
    else
      render :edit
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_path, notice: "Note was successfully removed!" }
      format.turbo_stream { flash.now[:notice] = "Note was successfully removed!" }
    end
  end

  private

  def set_note
    @note = current_company.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title)
  end
end
