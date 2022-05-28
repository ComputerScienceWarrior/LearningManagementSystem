module CoursesHelper
    def course_is_users?(course, user)
        course.user_id == user.id 
    end
end
