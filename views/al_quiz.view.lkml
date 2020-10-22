view: al_quiz {
  sql_table_name: `al-poc-data-wrangling.quiz_events.al_quiz`
    ;;

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: form_entity {
    hidden: yes
    sql: ${TABLE}.form_entity ;;
  }

  dimension: global_entity {
    hidden: yes
    sql: ${TABLE}.global_entity ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: al_quiz__form_entity {
  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: default_value {
    type: string
    sql: TO_JSON_STRING(${TABLE}.default_value );;
  }

  dimension: event_section {
    type: string
    sql: ${TABLE}.event_section ;;
  }

  dimension: funnel_step {
    description: "Amenities And Area -> Commute Information And Location -> Personality And Preferences -> Lease Information ->Income Information"
    sql: CASE
        WHEN ${event_section} IN ('amenities', 'areas','neighborhood') THEN '(1) Amenities And Area'
        WHEN ${event_section} IN ('commute_location', 'commute_map','commute_mode','location') THEN '(2) Commute Information And Location'
        WHEN ${event_section} IN ('parking', 'personality','pets','price','laundry','urgency','beds','eviction') THEN '(3) Personality And Preferences'
        WHEN ${event_section} IN ('price', 'rent','qualified','price','laundry','lease_length', 'lease_signing','move_in') THEN '(4) Lease Information'
        WHEN ${event_section} IN ('income', 'income_qualified','not_income_qualified') THEN '(5) Income Information'
      END
       ;;
  }

  dimension: meta_data {
    type: string
    sql:TO_JSON_STRING( ${TABLE}.meta_data) ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: object_label {
    type: string
    sql: ${TABLE}.object_label ;;
  }

  dimension: submit_value {
    type: string
    sql: TO_JSON_STRING(${TABLE}.submit_value) ;;
  }
}

view: al_quiz__global_entity {
  dimension: duid {
    type: string
    sql: ${TABLE}.duid ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: logged_in {
    type: yesno
    sql: ${TABLE}.logged_in ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_uuid {
    type: string
    sql: ${TABLE}.page_uuid ;;
  }

  dimension: referral_url {
    type: string
    sql: ${TABLE}.referral_url ;;
  }

  dimension: sid {
    type: string
    sql: ${TABLE}.sid ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }
}
