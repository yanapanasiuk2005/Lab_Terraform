# Get All Courses
data "archive_file" "get_all_courses" {
    type = "zip"

    source_file  = "modules/lambda/functions/get-all-courses/get-all-courses.js" 
    output_path  = "modules/lambda/functions/get-all-courses/get-all-courses.zip" 
}


resource "aws_lambda_function" "get_all_courses" {
 filename         = data.archive_file.get_all_courses.output_path
 function_name   = "get-all-courses"
 role            =  var.get_all_courses_arn
 handler         = "get-all-courses.handler"
 runtime         = "nodejs16.x"
}

# Get All Authors
data "archive_file" "get_all_authors" {
    type = "zip"

    source_file  = "modules/lambda/functions/get-all-authors/get-all-authors.js" 
    output_path  = "modules/lambda/functions/get-all-authors/get-all-authors.zip" 
}


resource "aws_lambda_function" "get_all_authors" {
 filename         = data.archive_file.get_all_authors.output_path
 function_name   = "get-all-authors"
 role            =  var.get_all_authors_arn
 handler         = "get-all-authors.handler"
 runtime         = "nodejs16.x"
}


# Save Courses
data "archive_file" "save-course" {
    type = "zip"

    source_file  = "modules/lambda/functions/save-course/save-course.js" 
    output_path  = "modules/lambda/functions/save-course/save-course.zip" 
}


resource "aws_lambda_function" "save-course" {
 filename         = data.archive_file.save-course.output_path
 function_name   = "save-course"
 role            =  var.save-course_arn
 handler         = "save-course.handler"
 runtime         = "nodejs16.x"
}

# Update Courses
data "archive_file" "update-course" {
    type = "zip"

    source_file  = "modules/lambda/functions/update-course/update-course.js" 
    output_path  = "modules/lambda/functions/update-course/update-course.zip" 
}


resource "aws_lambda_function" "update-course" {
 filename         = data.archive_file.update-course.output_path
 function_name   = "update-course"
 role            =  var.update-course_arn
 handler         = "update-course.handler"
 runtime         = "nodejs16.x"
}

# Get Courses
data "archive_file" "get-course" {
    type = "zip"

    source_file  = "modules/lambda/functions/get-course/get-course.js" 
    output_path  = "modules/lambda/functions/get-course/get-course.zip" 
}


resource "aws_lambda_function" "get-course" {
 filename         = data.archive_file.get-course.output_path
 function_name   = "get-course"
 role            =  var.get-course_arn
 handler         = "get-course.handler"
 runtime         = "nodejs16.x"
}

# Delete Courses
data "archive_file" "delete-course" {
    type = "zip"

    source_file  = "modules/lambda/functions/delete-course/delete-course.js" 
    output_path  = "modules/lambda/functions/delete-course/delete-course.zip" 
}


resource "aws_lambda_function" "delete-course" {
 filename         = data.archive_file.delete-course.output_path
 function_name   = "delete-course"
 role            =  var.delete-course_arn
 handler         = "delete-course.handler"
 runtime         = "nodejs16.x"
}


data "archive_file" "sns" {
  type        = "zip"
  source_file = "modules/lambda/functions/sns-notify/sns-notify.py"
  output_path = "modules/lambda/functions/sns-notify/sns-notify.zip"
}

resource "aws_lambda_function" "sns" {
  function_name =  "sns-notify"
  filename      = data.archive_file.sns.output_path
  role          = var.sns_topic_arn
  handler       = "sns-notify.lambda_handler"


  runtime = "python3.9"
}