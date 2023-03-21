class InstructorsController < ApplicationController

    def index 
        instructors = Instructor.all
        render json: instructors, status: :ok
    end 
    def show 
    instructor = Instructor.find_by(params[:id])
    render json: instructor
    end

    def create
    instructor = Instructor.create!(instructor_param)
    render json: instructor, status: :created
    end

    def update
    instructor = Instructor.find(params([:id]))
    instructor.update(student_params)
    render json: instructor, status: :ok
    #head: no_content

    end

    def destroy
    instructor = Instructor.find(params([:id]))
    instructor.destroy(student_params)
    render json: instructor, status: :ok
    
    end

    private

    def instructor_param
        params.permit(:name)
    end

end
