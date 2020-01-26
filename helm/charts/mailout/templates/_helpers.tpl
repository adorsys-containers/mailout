{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mailout.name" -}}
  {{- default "mailout" $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully app name truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mailout.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- tpl .Values.fullnameOverride $ | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
      {{- printf .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "mailout.labels" -}}
app: "{{ template "mailout.fullname" . }}"
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/name: "{{ template "mailout.name" . }}"
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
{{- end -}}

{{/* matchLabels */}}
{{- define "mailout.matchLabels" -}}
release: {{ .Release.Name }}
app: "{{ template "mailout.fullname" . }}"
{{- end -}}

{{/* matchLabels */}}
{{- define "mailout.helmRouteFix" -}}
status:
  ingress:
    - host: ""
{{- end -}}
