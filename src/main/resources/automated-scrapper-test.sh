#!/bin/bash

# Server URL
API_URL="http://localhost:8081/api/v0/search?keyword="

# 1,000 different keywords
KEYWORDS=("apis" "rest" "soap" "json" "xml" "swagger" "openapi" "postman" "insomnia"
          "rpc" "grpc" "expressjs" "fastapi" "flask" "django" "laravel" "symfony" "rails"
          "aspnet" "fastify" "koa" "sailsjs" "adonisjs" "meteor" "blazor" "nextjs"
          "nuxtjs" "remix" "gatsby" "ssg" "ssr" "csr" "wasm" "webgl" "threejs" "babylonjs"
          "opengl" "directx" "vulkan" "p5js" "canvas" "svg" "d3js" "chartjs" "highcharts"
          "echarts" "tensorflowjs" "pytorchlightning" "keras" "sklearn" "scikitlearn"
          "xgboost" "catboost" "lightgbm" "opencv" "mediapipe" "nlp" "huggingface"
          "transformers" "bert" "gpt" "llama" "t5" "whisper" "stable-diffusion" "gan"
          "vae" "mlflow" "databricks" "hadoop" "spark" "flink" "hive" "hbase" "cassandra"
          "couchdb" "dynamodb" "cosmosdb" "firestore" "rocksdb" "leveldb" "etcd" "consul"
          "zookeeper" "rabbitmq" "activemq" "pulsar" "nsq" "redisstreams" "ksqldb"
          "flinksql" "presto" "trino" "duckdb" "clickhouse" "timescaledb" "influxdb"
          "prometheus" "grafana" "loki" "jaeger" "opentelemetry" "zipkin" "newrelic"
          "datadog" "splunk" "elk" "logstash" "fluentd" "vector" "openpolicyagent"
          "kyverno" "vault" "hashicorp" "nomad" "packer" "vagrant" "podman" "buildah"
          "skopeo" "kaniko" "buildpacks" "tekton" "argo" "flux" "istio" "linkerd"
          "cilium" "calico" "weave" "cni" "crio" "containerd" "fargate" "lambda"
          "stepfunctions" "api-gateway" "appsync" "eventbridge" "sns" "sqs" "azurefunctions"
          "logicapps" "eventgrid" "googlecloudfunctions" "cloudrun" "pubsub" "cloudtasks"
          "spanner" "bigquery" "redshift" "snowflake" "vertica" "greenplum" "teradata"
          "airbyte" "dbt" "pentaho" "talend" "informatica" "airflow" "prefect" "dagster"
          "nifi" "mlops" "devsecops" "finops" "aiops" "bpf" "ebpf" "seccomp" "apparmor"
          "selinux" "grsecurity" "openstack" "proxmox" "xen" "kvm" "vsphere" "vmware"
          "hyperv" "vbox" "opennebula" "ceph" "glusterfs" "minio" "rclone" "restic"
          "velero" "trivy" "grype" "snyk" "dependabot" "codeql" "osquery" "sigma"
          "yara" "mitre" "attck" "atomicredteam" "threatintel" "ctfs" "hackthebox"
          "tryhackme" "metasploit" "burpsuite" "sqlmap" "johntheripper" "hashcat"
          "hydra" "nmap" "nessus" "openvas" "shodan" "censys" "virustotal" "urlscan"
          "hybrid-analysis" "sandboxing" "reverseproxy" "haproxy" "envoy" "traefik"
          "caddy" "istio" "consul-connect" "sidecar" "ingress" "loadbalancer"
          "roundrobin" "dns" "bind" "unbound" "coredns" "powerdns" "route53"
          "cloudflare" "akamai" "fastly" "cdn" "edgecomputing" "meshnetworking"
          "5g" "lte" "wifi" "wlan" "ethernet" "ipv6" "ipv4" "nat" "upnp" "tor"
          "i2p" "freenet" "vpn" "wireguard" "openvpn" "shadowsocks" "proxychains"
          "socks5" "mitm" "dnscrypt" "dnssec" "dhcp" "snmp" "smtp" "imap" "pop3"
          "smime" "dmarc" "spf" "dkim" "phishing" "socialengineering" "redteam"
          "blueteam" "purpleteam" "honeypot" "ids" "ips" "suricata" "zeek" "bro"
          "snort" "ossim" "ossec" "securityonion" "wazuh" "soc" "siem" "soar"
          "edr" "xdr" "sdr" "softwaredefinednetworking" "networkvirtualization"
          "vxlans" "nvgre" "gre" "ipsec" "bgp" "ospf" "rip" "is-is" "mrtg"
          "nagios" "icinga" "zabbix" "prometheus" "grafana" "cacti" "observability"
          "telemetry" "tracing" "monitoring" "logging" "alerting" "automation"
          "orchestrator" "ansible" "chef" "puppet" "saltstack" "fabric"
          "capistrano" "cloudformation" "pulumi" "cdktf" "kustomize" "helm"
          "helmfile" "crossplane" "openapi" "graphviz" "ditaa" "plantuml"
          "mermaid" "markdown" "asciidoc" "restructuredtext" "latex" "tikz"
          "vscode" "intellij" "eclipse" "netbeans" "pycharm" "rider" "clion"
          "goland" "webstorm" "postman" "datagrip" "dbeaver" "navicat" "heidisql"
          "robo3t" "studio3t" "mongochef" "redisinsight" "compass" "pgadmin"
          "phpmyadmin" "azureportal" "awscli" "azcli" "kubectl" "helm" "terraformcli"
          "packercli" "vagrantcli" "ansibleplaybook" "cloudsql" "bigtable"
          "dynamodbstreams" "timestream" "amazonmq" "sqs" "sns" "eventbridge"
          "stepfunctions" "bedrock" "ai21labs" "anthropic" "aiethics" "bias"
          "interpretability" "explainability" "adversarialai" "zero-shot"
          "few-shot" "self-supervised" "contrastivelearning" "aiagents"
          "langchain" "vectorsearch" "pinecone" "chromadb" "qdrant" "faiss"
          "milvus" "llamaindex" "weaviate" "hnsw" "ann" "rrf" "tfidf" "bm25"
          "word2vec" "fasttext" "glove" "bertscore" "rouge" "meteor" "bleurt"
          "deepfake" "voicecloning" "speechsynthesis" "texttospeech"
          "speechrecognition" "transcription" "diarization" "zero-shottranslation"
          "promptengineering" "rag" "nlg" "nli" "qa" "summarization"
          "aiinfrastructure" "accelerators" "gpus" "tpus" "fpgas" "risc-v" "arm"
          "cuda" "opencl" "vulkancompute" "pytorchjax" "torchscript" "onnx"
          "openvino" "tflite" "coreml" "mlir"
          "serverless" "microservices" "docker" "kubernetes" "terraform" "terraformcloud"
          "terraformenterprise" "helmcharts" "istio" "linkerd" "prometheusalertmanager"
          "grafanadashboards" "elasticsearch" "logstash" "kibana" "fluentbit" "bitbucket"
          "gitlab" "github" "azuredevops" "circleci" "jenkins" "travisci" "gitops"
          "monorepo" "polyrepo" "ci" "cd" "continuousintegration" "continuousdeployment"
          "ci/cd" "versioncontrol" "git" "svn" "mercurial" "bitbucketpipelines" "gitlabci"
          "jenkinsx" "spinnaker" "bamboo" "teamcity" "codeship" "codesandbox" "codespaces"
          "visualstudio" "vscodeextensions" "jetbrains" "intellijplugins" "eclipsesettings"
          "pycharmplugins" "riderplugins" "clionplugins" "golandplugins" "webstormplugins"
          "ideextensions" "codeformatting" "linting" "codecoverage" "unittesting"
          "integrationtesting" "endtoendtesting" "testautomation" "selenium" "cypress"
          "puppeteer" "playwright" "jest" "mocha" "chai" "jasmine" "karma" "protractor"
          "nightwatch" "cucumber" "gauge" "jestjs" "enzyme" "testinglibrary" "vitest"
          "playwrighttesting" "seleniumwebdriver" "webdriverio" "cypressio" "nightwatchjs"
          "mochajs" "chaiassert" "sinonjs" "nock" "supertest" "axios" "fetchapi" "graphql"
          "restapi" "soapapi" "jsonapi" "xmlapi" "oauth" "jwt" "cors" "csrf" "xss"
          "csrfprotection" "csp" "https" "tls" "ssl" "encryption" "authentication"
          "authorization" "oauth2" "saml" "openidconnect" "multifactor" "passwordless"
          "biometrics" "oauthflow" "tokenization" "keymanagement" "secretmanagement"
          "hashing" "salting" "pepper" "encryptionalgorithms" "aes" "rsa" "ecdsa" "sha256"
          "bcrypt" "argon2" "pbkdf2" "hmac" "sslcertificates" "certificates" "pkI"
          "publickeyinfrastructure" "certificatemanagement" "sslproxy" "tunneling"
          "vpnprotocols" "ipsecvpn" "l2tp" "pptp" "sstp" "ikev2" "wireguardvpn" "openvpnprotocol"
          "shadowing" "proxyservers" "reverseproxying" "loadbalancing" "failover"
          "highavailability" "disasterrecovery" "backupsolutions" "recoveryplans"
          "businesscontinuity" "dataredundancy" "datareplication" "datasharding" "partitioning"
          "caching" "redis" "memcached" "varnish" "contentdelivery" "cdnproviders"
          "staticassets" "dynamiccontent" "edgecomputing" "fogcomputing" "cloudflareworkers"
          "akamaiedgeworkers" "fastlycompute" "serverlessfunctions" "edgefunctions"
          "edgecaching" "contentinvalidations" "cachewarmup" "cachemisses" "cachestores"
          "cacheexpiration" "cachecontrol" "etag" "cacheheaders" "cachepurging"
          "cdnoptimization" "cdnsecurity" "cdnanalytics" "cdnperformance" "originpull"
          "originpush" "originshield" "cdnfailover" "cdngeo" "cdnlatency" "cdnthroughput"
          "cdnintegration" "cdnmanagement" "cdntiers" "cdnpricing" "cdnpullzones"
          "cdndns" "cdnssl" "cdncachingrules" "cdnrouting" "cdnpolicy" "cdnmonitoring"
          "cdnmetrics" "cdntemplates" "cdndeployment" "cdntesting" "cdnautomation"
          "cdnisolation" "cdnacceleration" "cdnsaaS" "cdnedge" "cdnorigin" "cdnpeering"
          "cdnapi" "cdnanalyticsplatforms" "cdnlogmanagement" "cdnsecurityfeatures"
          "cdnmitigation" "cdnwaf" "cdnbotmanagement" "cdnrate limiting" "cdnssltermination"
          "cdnhttpprotocols" "cdnipaddressing" "cdnipwhitelisting" "cdnipblacklisting"
          "cdnauthentication" "cdnauthorization" "cdnipfiltering" "cdngeoip" "cdnbandwidth"
          "cdntraffic" "cdnbandwidthoptimization" "cdnresponseheaders" "cdnrequestheaders"
          "cdnlogging" "cdnanomalydetection" "cdnanalyticsdashboards" "cdnuserbehavior"
          "cdndataaggregation" "cdndataenrichment" "cdnusertracking" "cdnwebhooks"
          "cdnalerts" "cdnnotifications" "cdnanomalyalerts" "cdncustomrules" "cdnpolicymanagement"
          "cdnworkflowautomation" "cdnresourceallocation" "cdnloadtesting" "cdnstress"
          "cdncapacityplanning" "cdnresourceoptimization" "cdnperformancemetrics"
          "cdnlatencymetrics" "cdnthroughputmetrics" "cdnavailabilitymetrics"
          "cdnreliabilitymetrics" "cdnuptimemetrics" "cdnerrorrates" "cdnlatencyreduction"
          "cdnthroughputenhancement" "cdnpacketloss" "cdnjitter" "cdnbandwidthutilization"
          "cdnresourceutilization" "cdncachehitratio" "cdncachemissratio" "cdnrequestrates"
          "cdnresponsetimes" "cdnerrorhandling" "cdnprotocolsupport" "cdncontentmanagement"
          "cdncontentrules" "cdncontentrevalidation" "cdncontentminification" "cdncontentcompression"
          "cdncontenttransformation" "cdncontentcustomization" "cdncontentoptimization"
          "cdncontentdeliveryrules" "cdncontentdistribution" "cdncontentsecurity"
          "cdncontentacceleration" "cdncontentcontrol" "cdncontentprotection"
          "cdncontentanalytics" "cdncontentmonitoring" "cdncontentreporting"
          "cdncontentmanagementsystem" "cdncontentintegration" "cdncontentapis"
          "cdncontentservices" "cdncontentframework" "cdncontentplatform" "cdncontentprotocols"
          "cdncontentstandards" "cdncontentformats" "cdncontenttypes" "cdncontentdeliverymethods"
          "cdncontentcachingstrategies" "cdncontentinvalidationsrules" "cdncontentpurgingmethods"
          "cdncontentrefreshing" "cdncontentcachebusting" "cdncontentprefetching"
          "cdncontentpreloading" "cdncontentlazyloading" "cdncontentcacherules" "cdncontentheaders"
          "cdncontenthttpheaders" "cdncontentresponseheaders" "cdncontentrequestheaders"
          "cdncontentsecurityheaders" "cdncontentcors" "cdncontentcsp" "cdncontenthsts"
          "cdncontenthttpprotocols" "cdncontentssl" "cdncontenttls" "cdncontentcertificates"
          "cdncontentencryption" "cdncontentdecryption" "cdncontentauthentications"
          "cdncontentauthorizations" "cdncontentaccesscontrol" "cdncontentpermissions"
          "cdncontentroles" "cdncontentpolicies" "cdncontentcompliance" "cdncontentregulations"
          "cdncontentgdpr" "cdncontentccpa" "cdncontentprivacy" "cdncontentdataresidency"
          "cdncontentdata sovereignty" "cdncontentdataprotection" "cdncontentdataprotection"
          "cdncontentdataprivacy" "cdncontentdataencryption" "cdncontentdataanonymization"
          "cdncontentdata masking" "cdncontentdatagovernance" "cdncontentdatamanagement"
          "cdncontentdataflows" "cdncontentdataintegration" "cdncontentdataaggregation"
          "cdncontentdatawarehousing" "cdncontentdatalakes" "cdncontentdatabases"
          "cdncontentdataanalytics" "cdncontentdataengineering" "cdncontentdatascience"
          "cdncontentmachinelearning" "cdncontentai" "cdncontentdeeplearning" "cdncontentbigdata"
          "cdncontentiot" "cdncontentblockchain" "cdncontentar" "cdncontentvr" "cdncontentmixedreality"
          "cdncontentedgecomputing" "cdncontentserverless" "cdncontentmicroservices"
          "cdncontentcontainerization" "cdncontentdocker" "cdncontentkubernetes" "cdncontentterraform"
          "cdncontentinfrastructureascode" "cdncontentdevops" "cdncontentagile" "cdncontentscrum"
          "cdncontentkanban" "cdncontentcontinuousintegration" "cdncontentcontinuousdeployment"
          "cdncontentci/cd" "cdncontentversioncontrol" "cdncontentgit" "cdncontentgithub"
          "cdncontentgitlab" "cdncontentbitbucket" "cdncontentsourcecode" "cdncontentrepository"
          "cdncontentbranching" "cdncontentmerging" "cdncontentpullrequests" "cdncontentcodereviews"
          "cdncontentcodequality" "cdncontentcodestandards" "cdncontentcoderefactoring"
          "cdncontentcodeoptimization" "cdncontentcodetesting" "cdncontenttestautomation"
          "cdncontentcodecoverage" "cdncontentdebugging" "cdncontentprofiling" "cdncontenttracing"
          "cdncontentlogging" "cdncontentmonitoring" "cdncontentalerting" "cdncontentincidentresponse"
          "cdncontentoncall" "cdncontentavailability" "cdncontentreliability" "cdncontentscalability"
          "cdncontentperformance" "cdncontentlatency" "cdncontentthroughput" "cdncontentbandwidth"
          "cdncontentresourceallocation" "cdncontentloadbalancing" "cdncontentfailover"
          "cdncontenthighavailability" "cdncontentdisasterrecovery" "cdncontentbackup"
          "cdncontentrecovery" "cdncontentbusinesscontinuity" "cdncontentresilience"
          "cdncontentfaulttolerance" "cdncontentcapacityplanning" "cdncontentscaling"
          "cdncontentautoscaling" "cdncontentverticalscaling" "cdncontenthorizontalscaling"
          "cdncontentserverprovisioning" "cdncontentresourceprovisioning" "cdncontentinfrastructure"
          "cdncontentinfrastructuremanagement" "cdncontentinfrastructuremonitoring"
          "cdncontentinfrastructureautomation" "cdncontentinfrastructureascode" "cdncontentconfigurationmanagement"
          "cdncontentsystemadministration" "cdncontentnetworking" "cdncontentsecurity"
          "cdncontentfirewalls" "cdncontentintrusiondetection" "cdncontentintrusionprevention"
          "cdncontentantivirus" "cdncontentantimalware" "cdncontentantispam" "cdncontentantiphishing"
          "cdncontentdatasecurity" "cdncontentapplicationsecurity" "cdncontentendpointsecurity"
          "cdncontentnetworksecurity" "cdncontentcloudsecurity" "cdncontentinformationsecurity"
          "cdncontentcybersecurity" "cdncontentthreatdetection" "cdncontentthreatprevention"
          "cdncontentvulnerabilitymanagement" "cdncontentpatchmanagement" "cdncontentcompliancemanagement"
          "cdncontentriskmanagement" "cdncontentgovernancemanagement" "cdncontentsecurityoperations"
          "cdncontentsecurityinformationandeventmanagement" "cdncontentsiem" "cdncontentsoar"
          "cdncontentsecurityanalytics" "cdncontentsecuritymetrics" "cdncontentsecuritydashboards"
          "cdncontentsecurityalerts" "cdncontentsecurityincidentmanagement" "cdncontentsecurityreporting"
          "cdncontentsecuritycompliance" "cdncontentsecuritystandards" "cdncontentsecurityframeworks"
          "cdncontentsecuritypolicies" "cdncontentsecurityprocedures" "cdncontentsecurityguidelines"
          "cdncontentsecuritybestpractices" "cdncontentsecuritytools" "cdncontentsecuritytechnologies"
          "cdncontentsecuritysolutions" "cdncontentsecurityservices" "cdncontentsecurityproviders"
          "cdncontentsecurityproducts" "cdncontentsecuritysoftware" "cdncontentsecurityhardware"
          "cdncontentsecurityplatforms" "cdncontentsecurityappliances" "cdncontentsecuritydevices"
          "cdncontentsecurityprotocols" "cdncontentsecurityapis" "cdncontentsecurityintegration"
          "cdncontentsecurityautomation" "cdncontentsecurityorchestration" "cdncontentsecurityorchestrators"
          "cdncontentsecurityframework" "cdncontentsecuritylibraries" "cdncontentsecuritymodules"
          "cdncontentsecurityplugins" "cdncontentsecurityextensions" "cdncontentsecurityaddons"
          "cdncontentsecuritycustomizations" "cdncontentsecurityconfigurations" "cdncontentsecuritysettings"
          "cdncontentsecuritycustomrules" "cdncontentsecuritypolicies" "cdncontentsecuritytemplates"
          "cdncontentsecurityblueprints" "cdncontentsecuritypatterns" "cdncontentsecurityusecases"
          "cdncontentsecurityscenarios" "cdncontentsecuritycases" "cdncontentsecurityexamples"
          "cdncontentsecurityapplications" "cdncontentsecurityusecases" "cdncontentsecurityindustries"
          "cdncontentsecuritysectors" "cdncontentsecuritydomains" "cdncontentsecurityverticals"
          "cdncontentsecuritytopics" "cdncontentsecurityconcepts" "cdncontentsecurityterminology"
          "cdncontentsecuritylexicon" "cdncontentsecurityvocabulary" "cdncontentsecurityglossary"
          "cdncontentsecuritydefinitions" "cdncontentsecurityterms" "cdncontentsecurityabbreviations"
          "cdncontentsecurityacronyms" "cdncontentsecurityjargon" "cdncontentsecurityslang"
          "cdncontentsecuritycolloquialisms" "cdncontentsecurityidioms" "cdncontentsecurityexpressions"
          "cdncontentsecurityphrases" "cdncontentsecurityterminology" "cdncontentsecuritynomenclature"
          "cdncontentsecurityclassification" "cdncontentsecuritytaxonomy" "cdncontentsecurityontology"
          "cdncontentsecuritymetadata" "cdncontentsecuritydata" "cdncontentsecurityinformation"
          "cdncontentsecurityknowledge" "cdncontentsecurityintelligence" "cdncontentsecurityawareness"
          "cdncontentsecuritytraining" "cdncontentsecurityeducation" "cdncontentsecuritycertification"
          "cdncontentsecuritytrainingcourses" "cdncontentsecuritycertifications" "cdncontentsecuritycourses"
          "cdncontentsecuritylearning" "cdncontentsecuritydevelopment" "cdncontentsecurityskills"
          "cdncontentsecuritycompetencies" "cdncontentsecurityexpertise" "cdncontentsecurityproficiency"
          "cdncontentsecuritycapabilities" "cdncontentsecuritytalent" "cdncontentsecuritystaffing"
          "cdncontentsecurityrecruitment" "cdncontentsecurityhiring" "cdncontentsecuritytalentacquisition"
          "cdncontentsecurityhr" "cdncontentsecurityhumanresources" "cdncontentsecurityhrtech"
          "cdncontentsecurityhrsoftware" "cdncontentsecurityhrtools" "cdncontentsecurityhrplatforms"
          "cdncontentsecurityhrsolutions" "cdncontentsecurityhrservices" "cdncontentsecurityhrproviders"
          "cdncontentsecurityhrproducts" "cdncontentsecurityhrapplications" "cdncontentsecurityhrsystems"
          "cdncontentsecurityhrintegrations" "cdncontentsecurityhrautomation" "cdncontentsecurityhrworkflow"
          "cdncontentsecurityhrprocesses" "cdncontentsecurityhrpolicies" "cdncontentsecurityhrprocedures"
          "cdncontentsecurityhrbestpractices" "cdncontentsecurityhrguidelines" "cdncontentsecurityhrframeworks"
          "cdncontentsecurityhrstandards" "cdncontentsecurityhrcompliance" "cdncontentsecurityhrregulations"
          "cdncontentsecurityhrlaws" "cdncontentsecurityhrlegislation" "cdncontentsecurityhrcompliancemanagement"
          "cdncontentsecurityhrriskmanagement" "cdncontentsecurityhraudit" "cdncontentsecurityhrcontrols"
          "cdncontentsecurityhrmonitoring" "cdncontentsecurityhrreporting" "cdncontentsecurityhranalytics"
          "cdncontentsecurityhrdashboards" "cdncontentsecurityhrmetrics" "cdncontentsecurityhrkeyperformanceindicators"
          "cdncontentsecurityhrkpies" "cdncontentsecurityhrperformance" "cdncontentsecurityhrperformanceevaluation"
          "cdncontentsecurityhrperformancemanagement" "cdncontentsecurityhrfeedback" "cdncontentsecurityhrreviews"
          "cdncontentsecurityhrappraisals" "cdncontentsecurityhrgoalsetting" "cdncontentsecurityhrobjective"
          "cdncontentsecurityhrobjectives" "cdncontentsecurityhrtargets" "cdncontentsecurityhrkeyresults"
          "cdncontentsecurityhrgoalalignment" "cdncontentsecurityhrstrategicplanning" "cdncontentsecurityhrstrategies"
          "cdncontentsecurityhrtactics" "cdncontentsecurityhrinitiatives" "cdncontentsecurityhrprojects"
          "cdncontentsecurityhrprograms" "cdncontentsecurityhractivities" "cdncontentsecurityhrtasks"
          "cdncontentsecurityhrresponsibilities" "cdncontentsecurityhrroles" "cdncontentsecurityhrjobdescriptions"
          "cdncontentsecurityhrjobtitles" "cdncontentsecurityhrjoblevels" "cdncontentsecurityhrjobgrades"
          "cdncontentsecurityhrjobfamilies" "cdncontentsecurityhrjobcategories" "cdncontentsecurityhrjobclasses"
          "cdncontentsecurityhrjobstructures" "cdncontentsecurityhrjobarchitecture" "cdncontentsecurityhrjobframeworks"
          "cdncontentsecurityhrjobdesign" "cdncontentsecurityhrjobanalysis" "cdncontentsecurityhrjobevaluation"
          "cdncontentsecurityhrjobrequirements" "cdncontentsecurityhrjobcompetencies" "cdncontentsecurityhrjobskills"
          "cdncontentsecurityhrjobqualifications" "cdncontentsecurityhrjobexperience" "cdncontentsecurityhrjobcriteria"
          "cdncontentsecurityhrjobstandards" "cdncontentsecurityhrjobbenchmarks" "cdncontentsecurityhrjobmetrics"
          "cdncontentsecurityhrjoboutcomes" "cdncontentsecurityhrjobresults" "cdncontentsecurityhrjobperformance"
          "cdncontentsecurityhrjobsuccess" "cdncontentsecurityhrjobachievement" "cdncontentsecurityhrjobrecognition"
          "cdncontentsecurityhrjobrewards" "cdncontentsecurityhrjobincentives" "cdncontentsecurityhrjobbenefits"
          "cdncontentsecurityhrjobcompensation" "cdncontentsecurityhrjobpay" "cdncontentsecurityhrjobwages"
          "cdncontentsecurityhrjobsalary" "cdncontentsecurityhrjobremuneration" "cdncontentsecurityhrjobbonuses"
          "cdncontentsecurityhrjobcommissions" "cdncontentsecurityhrjobequity" "cdncontentsecurityhrjobstocks"
          "cdncontentsecurityhrjoboptions" "cdncontentsecurityhrjobvesting" "cdncontentsecurityhrjobretirement"
          "cdncontentsecurityhrjob401k" "cdncontentsecurityhrjobira" "cdncontentsecurityhrjobrothira"
          "cdncontentsecurityhrjobretirementplans" "cdncontentsecurityhrjobhealthbenefits" "cdncontentsecurityhrjobhealthinsurance"
          "cdncontentsecurityhrjobdentalinsurance" "cdncontentsecurityhrjobvisioninsurance" "cdncontentsecurityhrjoblifeinsurance"
          "cdncontentsecurityhrjobdisabilityinsurance" "cdncontentsecurityhrjobpaidtimeoff" "cdncontentsecurityhrjobvacation"
          "cdncontentsecurityhrjobsickleave" "cdncontentsecurityhrjobholidays" "cdncontentsecurityhrjobpersonaldays"
          "cdncontentsecurityhrjobflexiblehours" "cdncontentsecurityhrjobremote" "cdncontentsecurityhrjobtelecommuting"
          "cdncontentsecurityhrjobworkfromhome" "cdncontentsecurityhrjobflexiblework" "cdncontentsecurityhrjobflextime"
          "cdncontentsecurityhrjobcompressedworkweek" "cdncontentsecurityhrjobparttime" "cdncontentsecurityhrjobfulltime"
          "cdncontentsecurityhrjobcontract" "cdncontentsecurityhrjobfreelance" "cdncontentsecurityhrjobtemporary"
          "cdncontentsecurityhrjobinternship" "cdncontentsecurityhrjobapprenticeship" "cdncontentsecurityhrjobco-op"
          "cdncontentsecurityhrjobgig" "cdncontentsecurityhrjobconsulting" "cdncontentsecurityhrjoboutsourcing"
          "cdncontentsecurityhrjoboffshoring" "cdncontentsecurityhrjobnearshoring" "cdncontentsecurityhrjobonshoring"
          "cdncontentsecurityhrjobstaffaugmentation" "cdncontentsecurityhrjobtalentpool" "cdncontentsecurityhrjobtalentpipeline"
          "cdncontentsecurityhrjobtalentmanagement" "cdncontentsecurityhrjobtalentdevelopment" "cdncontentsecurityhrjobtalentretention"
          "cdncontentsecurityhrjobtalentacquisition" "cdncontentsecurityhrjobtalentrecruitment" "cdncontentsecurityhrjobtalentstrategies"
          "cdncontentsecurityhrjobtalentacquisitionstrategies" "cdncontentsecurityhrjobtalentrecruitmentstrategies"
          "cdncontentsecurityhrjobtalentengagement" "cdncontentsecurityhrjobtalentmarketing" "cdncontentsecurityhrjobtalentbranding"
          "cdncontentsecurityhrjobtalentattraction" "cdncontentsecurityhrjobtalentbrandingstrategies" "cdncontentsecurityhrjobtalentattractionstrategies"
          "cdncontentsecurityhrjobtalentacquisitiontools" "cdncontentsecurityhrjobtalentrecruitmenttools" "cdncontentsecurityhrjobtalentmanagementtools"
          "cdncontentsecurityhrjobtalentanalytics" "cdncontentsecurityhrjobtalentmetrics" "cdncontentsecurityhrjobtalentkeyperformanceindicators"
          "cdncontentsecurityhrjobtalentdashboards" "cdncontentsecurityhrjobtalentreports" "cdncontentsecurityhrjobtalentdata"
          "cdncontentsecurityhrjobtalentinsights" "cdncontentsecurityhrjobtalentforecasting" "cdncontentsecurityhrjobtalentplanning"
          "cdncontentsecurityhrjobtalentstrategicplanning" "cdncontentsecurityhrjobtalentstrategy"
)


# Initialize counters
TOTAL_LINKS=0
TOTAL_PAGES=0
declare -A SEARCH_ENGINE_COUNTS

# Loop through each keyword
for keyword in "${KEYWORDS[@]}"; do
    echo "🔍 Searching for: $keyword"

    # Call the API and capture the response
    RESPONSE=$(curl -s "${API_URL}${keyword}")

    # Check if response is empty or invalid
    if [[ -z "$RESPONSE" ]]; then
        echo "❌ Error: No response received for '$keyword'. Skipping..."
        continue
    fi

    # Extract the number of links
    LINKS_COUNT=$(echo "$RESPONSE" | jq '. | length' 2>/dev/null)

    # If jq fails, skip this keyword
    if [[ $? -ne 0 ]]; then
        echo "⚠️ Warning: Failed to parse JSON response for '$keyword'. Skipping..."
        continue
    fi

    # Add to total link count
    TOTAL_LINKS=$((TOTAL_LINKS + LINKS_COUNT))

    # Extract unique pages from results and count them
    PAGES_COUNT=$(echo "$RESPONSE" | jq '.[].page' | sort -u | wc -l)
    TOTAL_PAGES=$((TOTAL_PAGES + PAGES_COUNT))

    # Count occurrences of each search engine
    ENGINES=$(echo "$RESPONSE" | jq -r '.[].engines[]' 2>/dev/null)
    for engine in $ENGINES; do
        SEARCH_ENGINE_COUNTS[$engine]=$((SEARCH_ENGINE_COUNTS[$engine] + 1))
    done

    # Print results for this keyword
    echo "📄 Pages searched for '$keyword': $PAGES_COUNT"
    echo "🔗 Links found for '$keyword': $LINKS_COUNT"
    echo "--------------------------------------------"

    # Wait for 1 second before next request
    sleep 1
done

# Print final summary
echo "✅ Total links retrieved from all searches: $TOTAL_LINKS"
echo "📄 Total pages visited across all keywords: $TOTAL_PAGES"
echo "--------------------------------------------"

# Print search engine statistics
echo "📊 Search Engine Breakdown:"
for engine in "${!SEARCH_ENGINE_COUNTS[@]}"; do
    echo "🔍 $engine: ${SEARCH_ENGINE_COUNTS[$engine]}"
done

echo "🎉 Search process completed successfully!"