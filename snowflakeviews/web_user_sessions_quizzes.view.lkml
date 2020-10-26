view: web_user_sessions_quizzes {
  sql_table_name: "ANALYTICS"."WEB_USER_SESSIONS_QUIZZES"
    ;;

  dimension: already_registered {
    type: number
    sql: ${TABLE}."ALREADY_REGISTERED" ;;
  }

  dimension: bot_flag {
    type: number
    sql: ${TABLE}."BOT_FLAG" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
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
    sql: ${TABLE}."DATA_UPDATED_AT" ;;
  }

  dimension: days_since_last_session {
    type: number
    sql: ${TABLE}."DAYS_SINCE_LAST_SESSION" ;;
  }

  dimension: email_modal_flag {
    type: number
    sql: ${TABLE}."EMAIL_MODAL_FLAG" ;;
  }

# measure: test {
#   type: percent_of_total

# }

  dimension: email_modal_return_flag {
    type: number
    sql: ${TABLE}."EMAIL_MODAL_RETURN_FLAG" ;;
  }

  dimension: email_test_flag {
    type: number
    sql: ${TABLE}."EMAIL_TEST_FLAG" ;;
  }

  dimension: guest_user_id {
    type: string
    sql: ${TABLE}."GUEST_USER_ID" ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}."PERSONA" ;;
  }

  dimension: pref_metro_id {
    type: string
    sql: ${TABLE}."PREF_METRO_ID" ;;
  }

  dimension: pref_mkt_priority {
    type: number
    sql: ${TABLE}."PREF_MKT_PRIORITY" ;;
  }

  dimension: pref_primary_location {
    type: string
    sql: ${TABLE}."PREF_PRIMARY_LOCATION" ;;
  }

  dimension_group: quiz_ended {
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
    sql: ${TABLE}."QUIZ_ENDED_AT" ;;
  }

  dimension: quiz_flow {
    type: string
    sql: ${TABLE}."QUIZ_FLOW" ;;
  }

  measure: total_quiz_started{
    type: count_distinct
    sql: case when ${quiz_id} is not NULL then ${user_id} END  ;;
  }

  measure: beds_steps{
    type: count_distinct
    sql: case when ${quiz_flow} LIKE '%beds_submit%' then ${user_id} END  ;;
  }

  measure: price_step {
    type: count_distinct
    sql: case when ${quiz_flow} LIKE '%price_submit%' then ${user_id} END  ;;
  }

  dimension: quiz_id {
    type: string
    sql: ${TABLE}."QUIZ_ID" ;;
  }

  dimension: quiz_registered {
    type: number
    sql: ${TABLE}."QUIZ_REGISTERED" ;;
  }

  dimension: quiz_start_page_type {
    type: string
    sql: ${TABLE}."QUIZ_START_PAGE_TYPE" ;;
  }

  dimension_group: quiz_started {
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
    sql: ${TABLE}."QUIZ_STARTED_AT" ;;
  }

  dimension: quiz_started_from {
    type: string
    sql: ${TABLE}."QUIZ_STARTED_FROM" ;;
  }

  dimension_group: registered {
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
    sql: ${TABLE}."REGISTERED_AT" ;;
  }

  dimension: registered_source_app {
    type: string
    sql: ${TABLE}."REGISTERED_SOURCE_APP" ;;
  }

  dimension: saw_registration {
    type: number
    sql: ${TABLE}."SAW_REGISTRATION" ;;
  }

  dimension: session_browser_name {
    type: string
    sql: ${TABLE}."SESSION_BROWSER_NAME" ;;
  }

  dimension: session_campaign_referrer {
    type: string
    sql: ${TABLE}."SESSION_CAMPAIGN_REFERRER" ;;
  }

  dimension: session_cmpn_ref {
    type: string
    sql: ${TABLE}."SESSION_CMPN_REF" ;;
  }

  dimension_group: session_ended {
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
    sql: ${TABLE}."SESSION_ENDED_AT" ;;
  }

  dimension: session_key {
    type: string
    sql: ${TABLE}."SESSION_KEY" ;;
  }

  dimension: session_landing_page {
    type: string
    sql: ${TABLE}."SESSION_LANDING_PAGE" ;;
  }

  dimension: session_lp_id {
    type: string
    sql: ${TABLE}."SESSION_LP_ID" ;;
  }

  dimension: session_lp_mkt_metro_id {
    type: number
    sql: ${TABLE}."SESSION_LP_MKT_METRO_ID" ;;
  }

  dimension: session_lp_mkt_tier {
    type: string
    sql: ${TABLE}."SESSION_LP_MKT_TIER" ;;
  }

  dimension: session_next_page {
    type: string
    sql: ${TABLE}."SESSION_NEXT_PAGE" ;;
  }

  dimension: session_number_asc {
    type: number
    sql: ${TABLE}."SESSION_NUMBER_ASC" ;;
  }

  dimension: session_number_desc {
    type: number
    sql: ${TABLE}."SESSION_NUMBER_DESC" ;;
  }

  dimension: session_of_day_number_asc {
    type: number
    sql: ${TABLE}."SESSION_OF_DAY_NUMBER_ASC" ;;
  }

  dimension: session_of_day_number_desc {
    type: number
    sql: ${TABLE}."SESSION_OF_DAY_NUMBER_DESC" ;;
  }

  dimension: session_path {
    type: string
    sql: ${TABLE}."SESSION_PATH" ;;
  }

  dimension: session_quiz_number_asc {
    type: number
    sql: ${TABLE}."SESSION_QUIZ_NUMBER_ASC" ;;
  }

  dimension: session_quiz_number_desc {
    type: number
    sql: ${TABLE}."SESSION_QUIZ_NUMBER_DESC" ;;
  }

  dimension: session_registered {
    type: number
    sql: ${TABLE}."SESSION_REGISTERED" ;;
  }

  dimension: session_source {
    type: string
    sql: ${TABLE}."SESSION_SOURCE" ;;
  }

  dimension: session_source_app {
    type: string
    sql: ${TABLE}."SESSION_SOURCE_APP" ;;
  }

  dimension_group: session_started {
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
    sql: ${TABLE}.SESSION_STARTED_AT ;;
  }

  dimension_group: session_started_date_pst {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SESSION_STARTED_DATE_PST" ;;
  }

  dimension: source_partner {
    type: string
    sql: ${TABLE}."SOURCE_PARTNER" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_session_id {
    type: string
    sql: ${TABLE}."USER_SESSION_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [session_browser_name]
  }
}
