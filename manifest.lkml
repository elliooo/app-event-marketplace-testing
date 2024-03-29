project_name: "app-event"

application: web-analytics {
  label: "Web Analytics (MP Ready)"
  definition_file: "application.json"
}

################ Constants ################

# Used in google_analytics_block.model connection param
constant: CONNECTION_NAME {
  value: "looker_application"
  export: override_required
}

# Used in ga_sessions.view sql_table_name
constant: SCHEMA_NAME {
  value: "ga360_generated_2"
  export: override_required
}

constant: GA360_TABLE_NAME {
  value: "ga_sessions_*"
  export: override_required
}

constant: CONFIG_PROJECT_NAME {
  value: "app-event-config"
  export: override_required
}

################ Dependencies ################

remote_dependency: app-event-adapter {
  url: "git://github.com/looker/app-event-ga360-bigquery"
  # TODO: update ref value by going to github.com/looker/app-event-ga360-bigquery and finding the latest query
  ref: "7cc3cc60aafb49f932b1284c7758ced1eb67621a"
}

remote_dependency: app-event-ga360 {
  url: "git://github.com/looker/app-event-ga360"
  # TODO: update ref value by going to github.com/looker/app-event-ga360 and finding the latest query
  ref: "266eebe57995cb65548ebafb93b9d19d151744d8"
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

  override_constant: GA360_TABLE_NAME {
    value: "@{GA360_TABLE_NAME}"
  }
}
