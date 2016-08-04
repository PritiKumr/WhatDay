json.success "true"
json.state_logs do
	json.array! @state_logs, :date, :state
end