from graphviz import Source

dot_code = """
digraph G {
  rankdir = "RL";
  node [shape = rect, fontname = "sans-serif"];
  subgraph "cluster_module.ec2-instance" {
    label = "module.ec2-instance"
    fontname = "sans-serif"
    "module.ec2-instance.aws_iam_instance_profile.ec2_profile" [label="aws_iam_instance_profile.ec2_profile"];
    "module.ec2-instance.aws_iam_role.ec2_role" [label="aws_iam_role.ec2_role"];
    "module.ec2-instance.aws_iam_role_policy_attachment.ec2_policy_attachment" [label="aws_iam_role_policy_attachment.ec2_policy_attachment"];
    "module.ec2-instance.aws_instance.main" [label="aws_instance.main"];
    "module.ec2-instance.aws_security_group.allow_access" [label="aws_security_group.allow_access"];
  }
  subgraph "cluster_module.s3-bucket" {
    label = "module.s3-bucket"
    fontname = "sans-serif"
    "module.s3-bucket.aws_s3_bucket.main" [label="aws_s3_bucket.main"];
    "module.s3-bucket.aws_s3_bucket_ownership_controls.s3_bucket" [label="aws_s3_bucket_ownership_controls.s3_bucket"];
    "module.s3-bucket.aws_s3_bucket_policy.s3_bucket" [label="aws_s3_bucket_policy.s3_bucket"];
    "module.s3-bucket.aws_s3_bucket_public_access_block.s3_bucket" [label="aws_s3_bucket_public_access_block.s3_bucket"];
    "module.s3-bucket.aws_s3_bucket_website_configuration.s3_bucket" [label="aws_s3_bucket_website_configuration.s3_bucket"];
    "module.s3-bucket.aws_s3_object.css" [label="aws_s3_object.css"];
    "module.s3-bucket.aws_s3_object.html" [label="aws_s3_object.html"];
  }
  "module.ec2-instance.aws_iam_instance_profile.ec2_profile" -> "module.ec2-instance.aws_iam_role.ec2_role";
  "module.ec2-instance.aws_iam_role_policy_attachment.ec2_policy_attachment" -> "module.ec2-instance.aws_iam_role.ec2_role";
  "module.ec2-instance.aws_instance.main" -> "module.ec2-instance.aws_iam_instance_profile.ec2_profile";
  "module.ec2-instance.aws_instance.main" -> "module.ec2-instance.aws_security_group.allow_access";
  "module.s3-bucket.aws_s3_bucket_ownership_controls.s3_bucket" -> "module.s3-bucket.aws_s3_bucket.main";
  "module.s3-bucket.aws_s3_bucket_policy.s3_bucket" -> "module.s3-bucket.aws_s3_bucket_public_access_block.s3_bucket";
  "module.s3-bucket.aws_s3_bucket_public_access_block.s3_bucket" -> "module.s3-bucket.aws_s3_bucket.main";
  "module.s3-bucket.aws_s3_bucket_website_configuration.s3_bucket" -> "module.s3-bucket.aws_s3_bucket.main";
  "module.s3-bucket.aws_s3_object.css" -> "module.s3-bucket.aws_s3_bucket.main";
  "module.s3-bucket.aws_s3_object.html" -> "module.s3-bucket.aws_s3_bucket.main";
}
"""

src = Source(dot_code)
output_path = src.render(filename="terraform_graph", format="png", cleanup=False)

print(f"Graph saved to: {output_path}")