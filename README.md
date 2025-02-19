# ZAP_K8S_Integration
This project integrates OWASP ZAP into a Kubernetes cluster to perform automated Dynamic Application Security Testing (DAST) on a frontend application. The automation is managed through GitLab CI/CD, using SecureCodeBox chart as the scanning orchestrator.

🚀 OWASP ZAP DAST Scanning in Kubernetes with GitLab CI/CD

📌 Features
✅ Deployment of OWASP ZAP in Kubernetes
✅ Automated DAST scanning via GitLab CI/CD
✅ Dynamic security analysis to detect vulnerabilities
✅ Integration with SecureCodeBox for scan orchestration
✅ Generation of vulnerability reports for the frontend application

🏗️ Architecture
OWASP ZAP runs in a Kubernetes pod and scans the frontend application
SecureCodeBox orchestrates and automates the scan execution
GitLab CI/CD triggers scans after each deployment
Results are exported as reports and can be integrated into vulnerability management

⚙️ Deployment
OWASP ZAP is deployed as a Kubernetes Job via SecureCodeBox
A GitLab CI/CD pipeline runs the scan after each code change
Scan results are stored in a CI/CD report

📜 Files in This Repository
k8s/zap-job.yaml → Kubernetes Job definition for OWASP ZAP
.gitlab-ci.yml → GitLab CI/CD pipeline configuration
securecodebox/zap-scan.yaml → SecureCodeBox scan configuration
docs/report.md → Documentation and sample scan reports

🚀 Getting Started
Deploy SecureCodeBox in your Kubernetes cluster
Apply the ZAP scan configuration
Configure GitLab CI/CD to trigger scans on deployment
Review DAST scan reports in GitLab

This setup ensures automated security testing with OWASP ZAP in a Kubernetes environment, enhancing security visibility for your frontend application. 🚀🔍
