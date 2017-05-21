# frozen_string_literal: true

class Admin::LessonsController < Comfy::Admin::Cms::BaseController
  before_action :set_lesson, only: %i[show edit update destroy download]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all

    if params[:title].present?
      @lessons = @lessons.search_by_title(params[:title])
    end

    if params[:lesson_type].present?
      @lessons = @lessons.where(lesson_type: params[:lesson_type])
    end

    if params[:terms].present?
      @lessons = @lessons.joins(:terms).where('terms.name in (?)', params[:terms])
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show; end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit; end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to [:admin, @lesson], notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    if (@lesson.user == current_user) || current_user.admin? || current_user.super_user?
      respond_to do |format|
        if @lesson.update(lesson_params)
          format.html { redirect_to [:admin, @lesson], notice: 'Lesson was successfully updated.' }
          format.json { render :show, status: :ok, location: @lesson }
        else
          format.html { render :edit }
          format.json { render json: @lesson.errors, status: :unprocessable_entity }
        end
      end
    else
      render :show, notice: 'Only admins or lesson creator can edit this lesson.'
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    if (@lesson.user == current_user) || current_user.admin? || current_user.super_user?
      @lesson.destroy
      respond_to do |format|
        format.html { redirect_to admin_lessons_url, notice: 'Lesson was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      render :show, notice: 'Only admins or lesson creator can edit this lesson.'
    end
  end

  def download
    send_data @lesson.document,
              filename: @lesson.document_file_name,
              type: @lesson.document_content_type,
              disposition: 'attachment'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lesson_params
    params.require(:lesson).permit(:byline, :lesson_type, :user_id, :title, :body, :questions, :document, term_ids: [], links: [])
  end
end
