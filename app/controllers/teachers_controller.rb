class TeachersController < ApplicationController
  before_action :require_login, except: ['new', 'create']
  before_action :check_school_match

  def index
    @school = School.find(params[:school_id])
    @teachers = @school.teachers
  end

  def new
    @teacher = Teacher.new
    @schools = School.all
  end

  def edit
    @teacher = Teacher.find(params[:id])
    unless @teacher == current_teacher
      redirect_to teachers_new_path
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      login(@teacher)
      redirect_to school_teacher_path(@teacher.school, @teacher)
    else
      render 'new'
      p @teacher.errors.full_messages
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to school_teacher_path(@teacher.school,@teacher)
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to school_teachers_path
  end

  private
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password)
    end
end
