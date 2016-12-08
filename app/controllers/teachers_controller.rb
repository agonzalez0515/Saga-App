class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find(params[:id])
    unless @teacher == current_teacher
      redirect_to teachers_new_path
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.id = current_teacher

    if @teacher.save
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  def destrory
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to school_teachers_path
  end

  private
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password)
    end
end
