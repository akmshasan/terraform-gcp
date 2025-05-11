# 🤝 Contributing Guide

Thank you for considering a contribution to this Terraform GCP infrastructure repository!

This project enforces infrastructure-as-code quality, security, and consistency. Please follow these guidelines to contribute effectively.

---

## 🧱 Branching Strategy

* **`dev`**: Development branch
* **`prod`**: Production branch
* **`main`**: Protected branch. Only `dev` and `prod` can PR into `main`

---

## 🔧 Making Changes

1. **Branch off** from `dev` or `prod`:

   ```bash
   git checkout dev
   git pull
   git checkout -b feature/my-change
   ```

2. **Make your changes** inside:

   * `modules/` if creating or updating reusable infra components
   * `environments/dev/` if changing environment-specific infra

3. **Lint and test locally**:

   ```bash
   tflint --init && tflint --recursive
   checkov -d environments/dev
   terraform fmt -recursive
   terraform validate
   ```

4. **Commit and push**:

   ```bash
   git add .
   git commit -m "feat: description of the change"
   git push origin feature/my-change
   ```

5. **Open a pull request** targeting:

   * `dev` if infrastructure is still in testing
   * `prod` if it's production-specific

> ❗ Only `dev` or `prod` PRs to `main` are allowed.

---

## ✅ PR Requirements

Your PR must:

* Pass `terraform validate`, `tflint`, and `checkov`
* Not include merge commits (linear history enforced)
* Be reviewed and approved (if not self-owned)

---

## 🔒 Permissions

* Only the repository owner can merge to `main`, `dev`, or `prod`
* Others can open PRs from `dev` or `prod`, but cannot merge

---

## 💡 Suggestions

* Keep module logic reusable and versioned
* Document any environment-specific changes in the README
* Use consistent naming: `vpc_<env>`, `subnet_<vpc>_1`, etc.

---

## 🙋‍♀️ Questions or Issues?

Please open an issue or contact [@akmshasan](https://github.com/akmshasan) directly.

---

Happy Terraforming! ☁️
