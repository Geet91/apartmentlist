view: users {
  sql_table_name: `al-poc-data-wrangling.API.USERS`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: archived_at {
    type: string
    sql: ${TABLE}.ARCHIVED_AT ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: current_sign_in_at {
    type: string
    sql: ${TABLE}.CURRENT_SIGN_IN_AT ;;
  }

  dimension: current_sign_in_ip {
    type: string
    sql: ${TABLE}.CURRENT_SIGN_IN_IP ;;
  }

  dimension_group: data_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATA_UPDATED_AT ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: email_verified {
    type: string
    sql: ${TABLE}.EMAIL_VERIFIED ;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
    link: {
      label: "{{value}} Analytics Dashbord"
      url: "https://apartmentlist20.cloud.looker.com/dashboards/2?User%20Name={{value}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }


  }

  dimension: has_been_evicted {
    type: string
    sql: ${TABLE}.HAS_BEEN_EVICTED ;;
  }

  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: last_sign_in_at {
    type: string
    sql: ${TABLE}.LAST_SIGN_IN_AT ;;
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.LAST_SIGN_IN_IP ;;
  }

  dimension: monthly_income_max {
    type: string
    sql: ${TABLE}.MONTHLY_INCOME_MAX ;;
  }

  dimension: monthly_income_min {
    type: string
    sql: ${TABLE}.MONTHLY_INCOME_MIN ;;
  }

  dimension: password_set {
    type: yesno
    sql: ${TABLE}.PASSWORD_SET ;;
  }

  dimension: registered_at {
    type: string
    sql: ${TABLE}.REGISTERED_AT ;;
  }

  dimension: registered_source_app {
    type: string
    sql: ${TABLE}.REGISTERED_SOURCE_APP ;;
  }

  dimension: remember_created_at {
    type: string
    sql: ${TABLE}.REMEMBER_CREATED_AT ;;
  }


  dimension: sign_in_count {
    type: string
    sql: ${TABLE}.SIGN_IN_COUNT ;;
  }

  dimension: source_partner {
    type: string
    sql: ${TABLE}.SOURCE_PARTNER ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.UPDATED_AT ;;
  }

  measure: count {
    type: count
    drill_fields: [id, full_name,monthly_income_max,email_verified]
  }
}
