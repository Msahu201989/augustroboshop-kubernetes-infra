env = "prod"

vpc = {
  vpc1 = {
    cidr_block = "10.200.0.0/16"
    additional_cidr_block = []
    private_subnets = {
      frontend = {
        cidr_block = ["10.200.0.0/24", "10.200.1.0/24"]
        name       = "frontend"
        attach_to  = "ngw"
      }
      database = {
        cidr_block = ["10.200.2.0/24", "10.200.3.0/24"]
        name       = "database"
        attach_to  = "ngw"
      }
      app = {
        cidr_block = ["10.200.4.0/24", "10.200.5.0/24"]
        name       = "app"
        attach_to  = "ngw"
      }
    }
    public_subnets  = {
      public = {
        cidr_block = ["10.200.255.0/24", "10.200.254.0/24"]
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

eks = {
  prod = {
    DESIRED_SIZE            = 1
    MAX_SIZE                = 1
    MIN_SIZE                = 1
    CREATE_ALB_INGRESS      = false
    CREATE_EXTERNAL_SECRETS = false
    INSTALL_KUBE_METRICS    = false
  }
}