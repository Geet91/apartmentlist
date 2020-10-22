view: funnel_derived_table {
  derived_table: {
    sql: SELECT
        users.ID  AS users_id
        ,FORMAT_TIMESTAMP('%F %T', users.CREATED_AT ) AS users_created_time
        ,FORMAT_TIMESTAMP('%F %T', users.DATA_UPDATED_AT ) AS users_data_updated_time
        , SUM(CASE WHEN al_quiz_form_entity.event_section IN ('amenities', 'areas','neighborhood') THEN 1 ELSE NULL END) AS Amentities_And_Area_Questions
              , SUM(CASE WHEN al_quiz_form_entity.event_section IN ('commute_location', 'commute_map','commute_mode','location')  THEN 1 ELSE NULL END) AS Commute_Questions
              , SUM(CASE WHEN al_quiz_form_entity.event_section IN ('parking', 'personality','pets','price','laundry','urgency','beds','eviction') THEN 1 ELSE NULL END) AS Personality_Questions
              , SUM(CASE WHEN al_quiz_form_entity.event_section IN ('price', 'rent','qualified','price','laundry','lease_length', 'lease_signing','move_in') THEN 1 ELSE NULL end) AS Lease_Information_questions
              ,SUM(CASE WHEN al_quiz_form_entity.event_section IN ('income', 'income_qualified','not_income_qualified')  THEN 1 ELSE NULL END) AS Income_Questions
      FROM `al-poc-data-wrangling.quiz_events.al_quiz`
           AS al_quiz
      LEFT JOIN UNNEST([al_quiz.form_entity]) as al_quiz_form_entity
      LEFT JOIN UNNEST([al_quiz.global_entity]) as al_quiz_global_entity
      LEFT JOIN `al-poc-data-wrangling.API.USERS`
           AS users ON users.ID = al_quiz_global_entity.uid

      GROUP BY 1,2,3

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: users_created_time {
    type: string
    sql: ${TABLE}.users_created_time ;;
  }

  dimension: users_data_updated_time {
    type: string
    sql: ${TABLE}.users_data_updated_time ;;
  }

  dimension: amentities_and_area_questions {
    type: number
    sql: ${TABLE}.Amentities_And_Area_Questions ;;
  }

  measure: total_amentities_and_area_questions {
    type: sum
    sql: ${amentities_and_area_questions} ;;
  }

  dimension: commute_questions {
    type: number
    sql: ${TABLE}.Commute_Questions ;;
  }

  measure: total_commute_questions {
    type: sum
    sql: ${commute_questions} ;;
  }

  dimension: personality_questions {
    type: number
    sql: ${TABLE}.Personality_Questions ;;
  }

  measure: total_personality_questions{
    type: sum
    sql: ${personality_questions} ;;
  }

  dimension: lease_information_questions {
    type: number
    sql: ${TABLE}.Lease_Information_questions ;;
  }

  measure: total_lease_information_questions{
    type: sum
    sql: ${lease_information_questions} ;;
  }

  dimension: income_questions {
    type: number
    sql: ${TABLE}.Income_Questions ;;
  }

  measure: total_income_questions{
    type: sum
    sql: ${income_questions} ;;
  }

  set: detail {
    fields: [
      users_id,
      users_created_time,
      users_data_updated_time,
      amentities_and_area_questions,
      commute_questions,
      personality_questions,
      lease_information_questions,
      income_questions
    ]
  }
}
