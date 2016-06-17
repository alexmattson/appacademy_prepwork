class Student
  attr_accessor :first_name, :last_name, :courses
  
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end
  
  def name 
    "#{@first_name} #{@last_name}"
  end
  
  def enroll(course)
    check_if_conflict(course)
    return nil if @courses.include?(course)
    course.students << self
    @courses << course
  end
  
  def course_load
    course_load = Hash.new(0)
    @courses.each do |course|
      course_load[course.department] += course.credits 
    end
    course_load
  end
  
  def check_if_conflict(another_course)
    self.courses.each do |course|
      if course.conflicts_with?(another_course)
        raise "#{another_course} can not be added because 
                it conflicts with #{course}"
      end
    end
  end
  
end
        