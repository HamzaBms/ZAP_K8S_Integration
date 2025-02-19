# ZAP_K8S_Integration
This project integrates OWASP ZAP into a Kubernetes cluster to perform automated Dynamic Application Security Testing (DAST) on a frontend application. The automation is managed through GitLab CI/CD, using SecureCodeBox chart as the scanning orchestrator.

🚀 OWASP ZAP DAST Scanning in Kubernetes with GitLab CI/CD

📌 Features <br/>
  ✅ Deployment of OWASP ZAP in Kubernetes <br/>
  ✅ Automated DAST scanning via GitLab CI/CD <br/>
  ✅ Dynamic security analysis to detect vulnerabilities <br/>
  ✅ Generation of vulnerability reports for the frontend application <br/>
  ✅ Automated mails contains reports <br/>

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

This setup ensures automated security testing with OWASP ZAP in a Kubernetes environment, enhancing security visibility for your frontend application. 🚀🔍 </br></br></br>




---
## Zap Automated Scan Mechanism :

<h4>Spider:</h4> It is used to automatically discover new resources/URLs on your website. It visits those URLs, identifies the hyperlinks and adds them to the list. </br>

<h4>Active Scan:</h4> It is used to find the potential vulnerabilities by using the known attacks against the selected targets. It gets its targets from the spider attack. </br></br>

![ZAP Kubernetes Integration](https://github.com/HamzaBms/ZAP_K8S_Integration/blob/main/WebAppScanning.png)

</br>
---
</br></br></br>
## 🚀 Installation & Deployment  

You can deploy OWASP ZAP in your **Kubernetes cluster** using either **Ansible** or manually.

### 📥 Manual Installation  

#### 1️⃣ Add the SecureCodeBox Helm Repository  
```sh
helm repo add secureCodeBox https://charts.securecodebox.io
```
2️⃣ Create a Namespace for SecureCodeBox

```sh
kubectl create namespace securecodebox-system
```

3️⃣ Install the SecureCodeBox Operator & CRDs
```sh
helm --namespace securecodebox-system upgrade --install securecodebox-operator secureCodeBox/operator
```

4️⃣ Configure Storage Class for Persistent Volume Claims (PVC)
Modify your configuration to set the appropriate StorageClass:
```sh
storageClassName: yourstorageclass
```

5️⃣ Install OWASP ZAP
```sh
helm upgrade --install zap secureCodeBox/zap -n securecodebox-system
```

🔄 Automating Deployment with Ansible
For automated installation, an Ansible playbook "ansible.yml" can be used to deploy OWASP ZAPin your Kubernetes cluster.

