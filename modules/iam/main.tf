# Get All Courses
resource "aws_iam_role" "get_all_courses_role" {
 name = "get-all-courses-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_policy" "get_all_courses_police" {
  name = "get-all-courses-police"

  policy      = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = [
            "dynamodb:Scan",
            ],
            Effect   = "Allow",
            Resource = var.dynamodb_courses_arn
        },
        {
            Effect = "Allow",
            Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
            ],
            Resource = "*"
        }
        ]
    }) 
}

resource "aws_iam_role_policy_attachment" "get_all_courses_policy_attachment" {
  role        = aws_iam_role.get_all_courses_role.name
  policy_arn  = aws_iam_policy.get_all_courses_police.arn
}


# Get All Authors
resource "aws_iam_role" "get_all_authors_role" {
 name = "get-all-authors-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_policy" "get_all_authors_police" {
  name = "get-all-authors-police"

  policy      = jsonencode({
          "Version": "2012-10-17",
          "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:Scan",
            "Resource": var.dynamodb_authors_arn
        }
    ]
    }) 
}

resource "aws_iam_role_policy_attachment" "get_all_authors_policy_attachment" {
  role        = aws_iam_role.get_all_authors_role.name
  policy_arn  = aws_iam_policy.get_all_authors_police.arn
}


# Save Course
resource "aws_iam_role" "save_course_role" {
 name = "save-course-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_policy" "save_course_police" {
   name = "save-course-police"

  policy      = jsonencode({
          
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]          
    }) 
}

resource "aws_iam_role_policy_attachment" "save_course_police_attachment" {
  role        = aws_iam_role.save_course_role.name
  policy_arn  = aws_iam_policy.save_course_police.arn
}



# Update Course
resource "aws_iam_role" "update_course_role" {
 name = "update-course-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_policy" "update_course_police" {
  name = "update-course-police"

  policy      = jsonencode({
          
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]          
    }) 
}

resource "aws_iam_role_policy_attachment" "update_course_police_attachment" {
  role        = aws_iam_role.update_course_role.name
  policy_arn  = aws_iam_policy.update_course_police.arn
}




# Get Courseg
resource "aws_iam_role" "get_course_role" {
 name = "get-course-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}


resource "aws_iam_policy" "get_course_police" {
  name = "get-course-police"

  policy      = jsonencode({
   "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:GetItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "get_course_police_attachment" {
  role        = aws_iam_role.get_course_role.name
  policy_arn  = aws_iam_policy.get_course_police.arn
}




# Delete Courseg
resource "aws_iam_role" "delete_course_role" {
 name = "delete-course-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}


resource "aws_iam_policy" "delete_course_police" {
  name = "delete-course-police"

  policy      = jsonencode({
   "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:DeleteItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "delete_course_police_attachment" {
  role        = aws_iam_role.delete_course_role.name
  policy_arn  = aws_iam_policy.delete_course_police.arn
}




resource "aws_iam_role" "sns_lambda_role" {
    name = "sns-lambda-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = "sts:AssumeRole",
            Effect = "Allow",
            Principal = {
            Service = "lambda.amazonaws.com"
            }
        }
        ]
    })
}

resource "aws_iam_policy" "sns_lambda_policy" {
    name = "sns-lambda-policy"

    policy      = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = [
            "sns:Publish",
            ],
            Effect   = "Allow",
            Resource = var.sns_topic_arn
        },
        {
            Effect = "Allow",
            Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
            ],
            Resource = "*"
        }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "sns_lambda_policy_attachment" {
    policy_arn = aws_iam_policy.sns_lambda_policy.arn
    role       = aws_iam_role.sns_lambda_role.name
}