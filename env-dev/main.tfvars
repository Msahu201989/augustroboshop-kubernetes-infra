env = "dev"

vpc = {
  vpc1 = {
    cidr_block = "10.0.0.0/16"
    additional_cidr_block = []
    private_subnets = {
      frontend = {
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
        name       = "frontend"
        attach_to  = "ngw"
      }
      database = {
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
        name       = "database"
        attach_to  = "ngw"
      }
      app = {
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24"]
        name       = "app"
        attach_to  = "ngw"
      }
    }
    public_subnets  = {
      public = {
        cidr_block = ["10.0.255.0/24", "10.0.254.0/24"]
        name       = "public"
        attach_to  = "igw"
      }
    }

    subnet_availability_zones = ["us-east-1a", "us-east-1b"]
  }
}

management_vpc = {
  vpc_id       = "vpc-0aa9e93d9aea8a408"
  route_table  = "rtb-02f3f9a8e79a6c925"
  vpc_cidr     = "172.31.0.0/16"
}

docdb = {
  db1 = {
    engine              = "docdb"
    skip_final_snapshot = true
    nodes               = {
      one = {
        instance_class = "db.t3.medium"
      }
    }
  }
}

rds = {
  db1 = {
    allocated_storage    = 10
    engine               = "aurora-mysql"
    engine_version       = "5.7.mysql_aurora.2.10.2"
    instance_class       = "db.t3.micro"
    skip_final_snapshot  = true
    nodes = {
      one = {
        instance_class = "db.t3.small"
      }
    }
  }
}

elasticache = {
  ec1 = {
    engine          = "redis"
    engine_version  = "6.2"
    node_type       = "cache.t3.micro"
    num_cache_nodes = 1
  }
}

rabbitmq = {
  mq1 = {
    instance_type = "t3.micro"
  }
}

apps = {
  cart = {
  instance_type    = "t3.micro"
  max_size         = 1
  min_size         = 1
  app_port_no      = 8080
  lb_listener_priority = 100
  type               = "backend"

   }
  catalogue = {
    instance_type    = "t3.micro"
    max_size         = 1
    min_size         = 1
    app_port_no      = 8080
    lb_listener_priority = 101
    type               = "backend"
  }
  user = {
    instance_type    = "t3.micro"
    max_size         = 1
    min_size         = 1
    app_port_no      = 8080
    lb_listener_priority = 102
    type               = "backend"
  }
  shipping = {
    instance_type    = "t3.micro"
    max_size         = 1
    min_size         = 1
    app_port_no      = 8080
    lb_listener_priority = 103
    type               = "backend"
  }
  payment = {
    instance_type    = "t3.micro"
    max_size         = 1
    min_size         = 1
    app_port_no      = 8080
    lb_listener_priority = 104
    type               = "backend"
  }
  frontend = {
    instance_type    = "t3.micro"
    max_size         = 1
    min_size         = 1
    app_port_no      = 80
    type               = "frontend"
    lb_listener_priority = 100
    public_dns_name     = "dev"
  }
}

BASTION_NODE = "172.31.88.133/32"
private_zone_id = "Z05924431K7Z6FJ26Q2EY"
public_zone_id  = "Z00328002YWJIOD14P0G"

alb = {
  public = {
    internal = false
  }
  private = {
    internal = true
  }
}

ACM_ARN = "arn:aws:acm:us-east-1:332775960109:certificate/1c424b19-19db-405c-8510-5764f7442c59"