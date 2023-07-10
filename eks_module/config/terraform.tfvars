aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1" 
        eks_subnet_ids = ["subnet-0a17e65da380c6f7f","subnet-0cf2e9c47a5962997","subnet-0d39c05459135445b"]
        tags = <<-EOF
        {
             "Name" =  "demo-cluster"
         }  
         EOF
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0a17e65da380c6f7f","subnet-0cf2e9c47a5962997","subnet-0d39c05459135445b"]
        tags = <<-EOF
        {
             "Name" =  "node1"
         } 
         EOF
  }
}