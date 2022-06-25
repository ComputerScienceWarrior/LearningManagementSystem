module CoursesHelper
    def course_is_users?(course, user)
        course.user.id == user.id
    end

    def user_enrolled?(course, student)
        course.students.include? student.id
    end

    def course(course)
        Course.find(course)
    end
end
