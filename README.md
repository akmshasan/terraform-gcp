# 🚀 Terraform GCP Infrastructure

This repository manages **modular and environment-specific infrastructure on Google Cloud Platform** using Terraform, GitHub Actions, and security/compliance tooling.

---

## 📁 Project Structure

```bash
.
├── environments/
│   ├── dev/     # Development environment
│   └── prod/    # Production environment
├── modules/     # Reusable Terraform modules
│   ├── vpc/
│   ├── subnets/
│   ├── cloudrouter/
│   ├── cloudnat/
│   └── public_ip/
└── .github/workflows/  # CI for plan, apply, lint, security
```

---

## 🌍 Environments

| Environment | Branch | Plan Trigger | Apply Trigger      |
| ----------- | ------ | ------------ | ------------------ |
| `dev`       | `dev`  | On push/PR   | On merge to `main` |
| `prod`      | `prod` | On push/PR   | Manual dispatch    |

---

## ⚙️ Requirements

* Terraform `>= 1.11.4`
* GCP project and service account with IAM roles
* GCS bucket for remote backend (e.g., `learning-gcs-tfstate`)
* GitHub Secret: `GCP_SA_KEY_BASE64` (base64-encoded service account JSON)

---

## 🔐 Branch Protections

* ✅ Only `dev` and `prod` branches can PR into `main`
* ✅ Only repository owner can merge to `main`, `dev`, or `prod`
* ✅ PRs require passing:

  * Terraform validation
  * TFLint (GCP plugin)
  * Checkov security checks
* ✅ Linear history enforced

---

## 🚀 Usage

### Run Terraform manually (example for dev)

```bash
cd environments/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### Push to `dev` branch → triggers:

* Terraform validation
* Linting with TFLint
* Security checks via Checkov

### Merge `dev` → `main` → triggers:

* Auto `terraform apply` to `dev`

---

## 🥪 CI/CD: GitHub Actions Workflows

* `terraform-plan-dev.yml`
* `terraform-apply-dev.yml`
* `terraform-plan-prod.yml` *(optional)*
* `terraform-apply-prod.yml` *(optional + manual)*

---

## 🔐 Security & Compliance

* 🚹 TFLint with GCP provider plugin (`.tflint.hcl`)
* 🔍 Checkov scans on every PR for subnet logging, private IP access, etc.
* ❌ Merge blocked on critical misconfigurations

---

## 👤 Author

**A K M Shafiul Hasan**
🔗 [github.com/akmshasan](https://github.com/akmshasan)

---

## 📜 License

MIT License. See [LICENSE](LICENSE) for details.
