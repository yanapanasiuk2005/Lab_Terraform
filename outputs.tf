output "courses_table_arn" {
    value = module.table_courses.arn
}

output "table_table_name" {
    value = module.table_courses.id  
}


output "authors_table_arn" {
    value = module.table_authors.arn
}

output "authors_table_name" {
    value = module.table_authors.id  
}

