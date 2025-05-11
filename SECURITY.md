# 🔐 Security Policy

This project follows infrastructure security best practices for Terraform on Google Cloud Platform (GCP). It enforces strict CI/CD policies, branch protections, and security scanning.

---

## 🧩 Components Involved

* **Terraform**: Infrastructure as code
* **TFLint**: Linter for Terraform syntax and GCP best practices
* **Checkov**: Static analysis for misconfigurations and security violations
* **GitHub Actions**: Enforces validation, linting, and compliance before merges

---

## ✅ Enforcement Policies

### ✅ GitHub Branch Protections

| Branch | PR Required | Merge by Owner Only | Status Checks Required |
| ------ | ----------- | ------------------- | ---------------------- |
| `main` | ✅ Yes       | ✅ Yes               | ✅ Yes                  |
| `dev`  | ✅ Yes       | ✅ Yes               | ✅ Yes                  |
| `prod` | ✅ Yes       | ✅ Yes               | ✅ Yes                  |

* 🔒 Only the repository owner can merge to protected branches.
* 🔁 Only `dev` and `prod` are allowed to PR into `main`.
* 🧱 Linear history is enforced (no merge commits).

---

## 🔍 CI/CD Security Enforcement

### ✅ TFLint

* Enforced in CI via `.tflint.hcl`
* Uses `tflint-ruleset-google@v0.32.0`
* Checks GCP-specific configurations (e.g., invalid machine types, missing project IDs)

### ✅ Checkov

* Runs in CI on every PR and push
* Enforces checks like:

  * Subnets must have flow logs
  * Private Google API access must be enabled
* Hard fails the workflow on high severity
* Posts violations as PR comments

---

## 🛡 GitHub Secrets

* `GCP_SA_KEY_BASE64` — contains a base64-encoded GCP service account key
* Only available to GitHub Actions workflows
* Not stored or printed in logs

---

## 📝 Reporting Vulnerabilities

If you find a security issue, please report it directly to the repository owner:

* GitHub: [@akmshasan](https://github.com/akmshasan)
* Do not open public issues for sensitive vulnerabilities.

---

## 🔁 Future Enhancements

* [ ] Integrate OIDC (Workload Identity Federation) to remove the need for static credentials
* [ ] Add automated drift detection
* [ ] Enforce Checkov policy allow/deny lists via `.checkov.yaml`

---

*Last updated: {{CURRENT\_YEAR}} by A K M Shafiul Hasan*
