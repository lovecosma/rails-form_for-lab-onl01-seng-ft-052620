class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.update(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    set_student
  end

  def edit
    set_student
  end

  def update
    set_student
    @student.update(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end



  private
  def set_student
    @student = Student.find_by_id(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
