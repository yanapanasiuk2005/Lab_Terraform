output "get_all_authors_arn" {
  value = aws_lambda_function.get_all_authors.arn
}
output "get_all_authors_invoke_arn" {
  value = aws_lambda_function.get_all_authors.invoke_arn
}

output "get_all_courses_arn" {
  value = aws_lambda_function.get_all_courses.arn
}
output "get_all_courses_invoke_arn" {
  value = aws_lambda_function.get_all_courses.invoke_arn
}

output "get_course_arn" {
  value = aws_lambda_function.get-course.arn
}
output "get_course_invoke_arn" {
  value = aws_lambda_function.get-course.invoke_arn
}


output "delete_course_arn" {
  value = aws_lambda_function.delete-course.arn
}
output "delete_course_invoke_arn" {
  value = aws_lambda_function.delete-course.invoke_arn
}


output "save_course_arn" {
  value = aws_lambda_function.save-course.arn
}
output "save_course_invoke_arn" {
  value = aws_lambda_function.save-course.invoke_arn
}



output "update_course_arn" {
  value = aws_lambda_function.update-course.arn
}
output "update_course_invoke_arn" {
  value = aws_lambda_function.update-course.invoke_arn
}


output "sns_topic_arn" {
  value = aws_lambda_function.sns.arn
}
