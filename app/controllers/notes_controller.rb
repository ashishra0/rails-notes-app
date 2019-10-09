class NotesController < ApplicationController
  before_action :set_note, only: %i[edit update show destroy]
  before_action :require_user
  before_action :require_same_user, only: %i[show edit update destroy]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      flash[:success] = 'note was saved successfully'
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def index
    @notes = current_user.notes
  end

  def show; end

  def edit; end

  def update
    if @note.update(note_params)
      flash[:success] = 'Note was successfully updated'
      redirect_to note_path(@note)
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    flash[:danger] = 'Note was successfully deleted'
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end

  def require_same_user
    if current_user != @note.user
      flash[:danger] = 'Cannot perform the required action'
      redirect_to root_path
    end
  end

end