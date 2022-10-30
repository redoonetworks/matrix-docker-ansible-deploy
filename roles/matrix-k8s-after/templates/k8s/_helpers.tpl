{{- define "deployment.selector" -}}
chat: {{ .Values.Vars.matrix_server_fqn_matrix }}
{{- end -}}