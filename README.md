# DevSecOps Pipeline

## Introduction

This repository includes a workflow that automates security checks for a simple web application. The pipeline builds a Docker image, scans it for known vulnerabilities, runs the application, and performs a web security test before uploading final reports.

## Key Components

- **Dockerfile**: Builds a container image for the application.  
- **Trivy**: Performs vulnerability scanning on the Docker image, focusing on operating system and library dependencies.  
- **OWASP ZAP**: Executes a baseline security scan on the running container to detect common web application issues (such as missing headers or potential XSS).

## Pipeline Flow

1. **Code Checkout**  
   The repository files (including the Dockerfile) are cloned onto the GitHub Actions runner.

2. **Optional Docker Login**  
   If Docker Hub credentials are present in repository secrets, the workflow logs in to avoid rate limits when pulling images.

3. **Docker Image Build**  
   A Docker image named `minimal-devsecops-example` is created by reading the Dockerfile. This image encapsulates the application.

4. **Vulnerability Scan (Trivy)**  
   The newly built image is scanned for security vulnerabilities. Any discovered issues are displayed in the workflow logs.

5. **Run Container**  
   The application’s container is started on port 8080, providing a live environment for further security checks.

6. **Web Security Scan (OWASP ZAP)**  
   A secondary container with the ZAP tool runs a baseline scan against the live application endpoint. Reports summarizing findings are generated in HTML, Markdown, and JSON formats.

7. **Stop Container**  
   The running application container is terminated to free resources.

8. **Report Upload**  
   The three ZAP reports are bundled and uploaded to GitHub as an artifact named `zap-scan-reports`. This artifact can be downloaded from the workflow run’s “Artifacts” section.

## Reports & Artifacts

A successful run produces three output files:
- **report_json.json**: A structured data representation of ZAP’s findings.  
- **report_md.md**: A Markdown summary.  
- **report_html.html**: An HTML version that is easily viewed in a browser.

All three files are uploaded as a single artifact. Opening `report_html.html` locally in a web browser provides a convenient way to review security warnings.

## Benefits

- **Automated Container Scans**: Ensures vulnerabilities are caught early, reducing the risk of deploying insecure images.  
- **Web Security Testing**: Assesses common application-level issues, improving confidence in the application’s security posture.  
- **Artifact Storage**: Keeps a record of each run’s security findings, enabling easy review and traceability over time.
