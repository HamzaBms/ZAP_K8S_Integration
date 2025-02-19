# ZAP_K8S_Integration
This project integrates OWASP ZAP into a Kubernetes cluster to perform automated Dynamic Application Security Testing (DAST) on a frontend application. The automation is managed through GitLab CI/CD, using SecureCodeBox chart as the scanning orchestrator.

🚀 OWASP ZAP DAST Scanning in Kubernetes with GitLab CI/CD

📌 Features
  ✅ Deployment of OWASP ZAP in Kubernetes
  ✅ Automated DAST scanning via GitLab CI/CD
  ✅ Dynamic security analysis to detect vulnerabilities
  ✅ Generation of vulnerability reports for the frontend application
  ✅ Automated mails contains reports 

🏗️ Architecture
OWASP ZAP runs in a Kubernetes pod and scans the frontend application
SecureCodeBox orchestrates and automates the scan execution
GitLab CI/CD triggers scans after each deployment
Results are exported as reports and can be integrated into vulnerability management

⚙️ Deployment
  - OWASP ZAP is deployed as a Kubernetes Job via SecureCodeBox
  A GitLab CI/CD pipeline runs the scan after each code change
  Scan results are sent automatically via mail.

📜 Files in This Repository
  - .gitlab-ci.yml → GitLab CI/CD pipeline configuration
  - Scan.yaml → SecureCodeBox scan configuration
  - ansible.yml → playbook to add annd install secure code box repo and deploy ZAP in your cluster
  - Sample scan reports will be sent automatically using mailx after retreiving the report after the scan end
 
🚀 Getting Started
  - Deploy SecureCodeBox in your Kubernetes cluster using ansible playbook or manually
  - Apply the ZAP scan configuration
  - Configure GitLab CI/CD to trigger scans on deployment
  - Retreive scan findings and configure automated reports sent by mail
  - Review DAST scan reports in GitLab

This setup ensures automated security testing with OWASP ZAP in a Kubernetes environment, enhancing security visibility for your frontend application. 🚀🔍
