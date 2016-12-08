class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if is_admin? && @student.save?
      redirect_to @student
    #else
      #show some error not sure where to redirect
    end
  end


  def edit
    @student = Student.find(params[:id])
    # unless is_admin?
    #  #throw error something like "Must be admin to edit!"
    # end
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if is_admin?
      @student.destroy
      redirect_to school_student_path
    # else
      #render errors :O
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :grade, :GPA, :detentions, :gender, :fav_animal, :shirt_size, :allergies, :emergency_contact)
    end

end
