#!/bin/bash

export x="urltarget"
mkdir reports

for target in $(cat targets.yaml | yq -r '.target[]'); do
    kubectl get pods -o=name -n dry-run
    kubectl delete -f scan.yaml -n dry-run
    sed -i "s|${x}|${target}|g" scan.yaml
    sleep 5
    kubectl apply -f scan.yaml -n dry-run
    sleep 60
    export x="${target}"
    kubectl get pods -n dry-run
    export pname=$(kubectl get pods -o=name -n dry-run)
    echo "[INFO] Pname = $pname"
    pod_name=$(echo "$pname" | cut -d'/' -f2)
    echo "[INFO] PodName = $pod_name"
    export status=$(kubectl get pod/$pod_name --no-headers -o custom-columns=":status.phase" -n dry-run)
    echo "[INFO] status = $status"
    while [[ "$status" != "Running" && "$status"=="ContainerCreating" ]]; do
      echo "[INFO] 10 seconds remaining to start the scan ..."
      sleep 10
    done
    export pname=$(kubectl get pods -o=name -n dry-run)
    echo "[INFO] Pname=$pname"
    kubectl logs --follow $pname -n dry-run
    echo "$pname"
    echo "[INFO] PodName = $pod_name"
    kubectl cp -n dry-run $pod_name:/zap/wrk/report_html -c ubuntu zap-scan-report.html
    kubectl cp -n dry-run $pod_name:/zap/wrk/zap-results.xml -c ubuntu zap-results.xml
    sanitized_target=$(echo "${target}" | sed 's/[^a-zA-Z0-9._-]/_/g')
    mv zap-scan-report.html zap-scan-report_$sanitized_target.html
    mv zap-results.xml zap-results_$sanitized_target.xml
    echo "sanitized_target=$sanitized_target"
    cp zap-scan-report_$sanitized_target.html $CI_PROJECT_DIR/reports/zap-scan-report_$sanitized_target.html
    cp zap-results_$sanitized_target.xml $CI_PROJECT_DIR/reports/zap-results_$sanitized_target.xml
    echo "[INFO] SCAN REPORTS GENERATED SUCCESSFULLY"
    echo "[INFO] Reports will be sent by mail or you can found it in artifact section in this pipeline"
    echo "[INFO] ls -lrtha command"
    ls -lrtha
done
