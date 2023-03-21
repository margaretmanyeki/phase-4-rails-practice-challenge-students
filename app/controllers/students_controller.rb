class StudentsController < ApplicationController
    def index 
        students = Student.all
        render json: students, status: :ok
    end 
    def show 
    student = Student.find_by(params[:id])
    render json: student, status: :ok
    end

    #use strong param and private mthd
    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find(params([:id]))
        student.update(student_params)
        render json: student, status: :ok

    end

    def destroy
        student = Student.find(params([:id]))
        student.destroy(student_params)
        render json: student, status: :ok
        #head: no_content

    end

    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end
    def record_not_found(error)
        render json: {error: error.message}, status: :not_found

    end
end
