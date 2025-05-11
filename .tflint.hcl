plugin "google" {
  enabled = true
  version = "0.32.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

# Enable or disable built-in TFLint rules
rule "terraform_unused_declarations" {
  enabled = true
}

# Google plugin rules (examples)
rule "google_instance_invalid_machine_type" {
  enabled = true
}

rule "google_project_invalid_project_id" {
  enabled = true
}

rule "google_compute_instance_default_service_account" {
  enabled = true
}
