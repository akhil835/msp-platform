locals {
  common_tags = {
    project = "ots-integration"
    env     = var.environment
  }
}

# ============================================================
# AWS: RDS MySQL (No persistent volumes - managed service)
# ============================================================
resource "aws_db_subnet_group" "main" {
  count      = var.cloud_provider == "aws" ? 1 : 0
  name       = "${var.instance_name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = local.common_tags
}

resource "aws_security_group" "rds" {
  count       = var.cloud_provider == "aws" ? 1 : 0
  name        = "${var.instance_name}-rds-sg"
  description = "Security group for RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_db_instance" "main" {
  count = var.cloud_provider == "aws" ? 1 : 0

  identifier        = var.instance_name
  engine            = "mysql"
  engine_version    = var.mysql_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp3"

  db_name  = var.database_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main[0].name
  vpc_security_group_ids = [aws_security_group.rds[0].id]

  skip_final_snapshot       = true
  deletion_protection       = false
  multi_az                  = false
  publicly_accessible       = false
  backup_retention_period   = 7

  tags = local.common_tags
}

# ============================================================
# GCP: Cloud SQL MySQL (No persistent volumes - managed service)
# ============================================================
resource "google_sql_database_instance" "main" {
  count = var.cloud_provider == "gcp" ? 1 : 0

  name             = var.instance_name
  region           = var.gcp_region
  database_version = "MYSQL_8_0"
  project          = var.project_id

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.gcp_network
    }

    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }

    user_labels = local.common_tags
  }

  deletion_protection = false
}

resource "google_sql_database" "main" {
  count    = var.cloud_provider == "gcp" ? 1 : 0
  name     = var.database_name
  instance = google_sql_database_instance.main[0].name
  project  = var.project_id
}

resource "google_sql_user" "main" {
  count    = var.cloud_provider == "gcp" ? 1 : 0
  name     = var.db_username
  instance = google_sql_database_instance.main[0].name
  password = var.db_password
  project  = var.project_id
}

# ============================================================
# Azure: Azure Database for MySQL Flexible Server (No PV)
# ============================================================
resource "azurerm_mysql_flexible_server" "main" {
  count = var.cloud_provider == "azure" ? 1 : 0

  name                   = var.instance_name
  resource_group_name    = var.resource_group_name
  location               = var.azure_location
  administrator_login    = var.db_username
  administrator_password = var.db_password
  sku_name               = var.sku_name
  version                = var.mysql_version
  backup_retention_days  = 7

  tags = local.common_tags
}

resource "azurerm_mysql_flexible_database" "main" {
  count               = var.cloud_provider == "azure" ? 1 : 0
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main[0].name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}
