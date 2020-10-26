view: quiz_funnel {
  derived_table: {
    sql: SELECT
        web_user_sessions_quizzes."USER_ID"  AS "web_user_sessions_quizzes.user_id",
        TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes.SESSION_STARTED_AT  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD HH24:MI:SS') AS "web_user_sessions_quizzes.session_started_time",
        web_user_sessions_quizzes."SESSION_REGISTERED"  AS "web_user_sessions_quizzes.session_registered",
        web_user_sessions_quizzes."QUIZ_REGISTERED"  AS "web_user_sessions_quizzes.quiz_registered",
        TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes."REGISTERED_AT"  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD HH24:MI:SS') AS "web_user_sessions_quizzes.registered_time",
        web_user_sessions_quizzes."QUIZ_ID"  AS "web_user_sessions_quizzes.quiz_id",
        TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes."QUIZ_STARTED_AT"  AS TIMESTAMP_NTZ))), 'YYYY-MM-DD HH24:MI:SS') AS "web_user_sessions_quizzes.quiz_started_time",
        web_user_sessions_quizzes."QUIZ_STARTED_FROM"  AS "web_user_sessions_quizzes.quiz_started_from",
        web_user_sessions_quizzes."QUIZ_START_PAGE_TYPE"  AS "web_user_sessions_quizzes.quiz_start_page_type",
        web_user_sessions_quizzes."QUIZ_FLOW"  AS "web_user_sessions_quizzes.quiz_flow"
      FROM "ANALYTICS"."WEB_USER_SESSIONS_QUIZZES"
           AS web_user_sessions_quizzes

      WHERE (web_user_sessions_quizzes."ALREADY_REGISTERED"  IS NULL OR web_user_sessions_quizzes."ALREADY_REGISTERED" !=1) AND ((((web_user_sessions_quizzes."QUIZ_STARTED_AT" ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', CAST(DATEADD('day', -30, DATE_TRUNC('day', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ)))) AS TIMESTAMP_NTZ)))) AND (web_user_sessions_quizzes."QUIZ_STARTED_AT" ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', CAST(DATEADD('day', 30, DATEADD('day', -30, DATE_TRUNC('day', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ))))) AS TIMESTAMP_NTZ))))))) AND ((web_user_sessions_quizzes."SESSION_CMPN_REF"  IN ('aol', ' ask', 'baidu', 'bing', 'google_search', 'yahoo', 'yandex', 'google_mail'))) AND (web_user_sessions_quizzes."SESSION_NUMBER_ASC"  = 1) AND (((web_user_sessions_quizzes."SESSION_SOURCE") = 'organic/direct')) AND ((web_user_sessions_quizzes.SESSION_STARTED_AT  < (CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', CAST(DATEADD('day', 0, DATE_TRUNC('day', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ)))) AS TIMESTAMP_NTZ)))))
      GROUP BY 1,DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes.SESSION_STARTED_AT  AS TIMESTAMP_NTZ))),3,4,DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes."REGISTERED_AT"  AS TIMESTAMP_NTZ))),6,DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CAST(web_user_sessions_quizzes."QUIZ_STARTED_AT"  AS TIMESTAMP_NTZ))),8,9,10
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: web_user_sessions_quizzes_user_id {
    type: number
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.USER_ID" ;;
  }

  dimension: web_user_sessions_quizzes_session_started_time {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.SESSION_STARTED_TIME" ;;
  }

  dimension: web_user_sessions_quizzes_session_registered {
    type: number
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.SESSION_REGISTERED" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_registered {
    type: number
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_REGISTERED" ;;
  }

  dimension: web_user_sessions_quizzes_registered_time {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.REGISTERED_TIME" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_id {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_ID" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_started_time {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_STARTED_TIME" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_started_from {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_STARTED_FROM" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_start_page_type {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_START_PAGE_TYPE" ;;
  }

  dimension: web_user_sessions_quizzes_quiz_flow {
    type: string
    sql: ${TABLE}."WEB_USER_SESSIONS_QUIZZES.QUIZ_FLOW" ;;
  }

  set: detail {
    fields: [
      web_user_sessions_quizzes_user_id,
      web_user_sessions_quizzes_session_started_time,
      web_user_sessions_quizzes_session_registered,
      web_user_sessions_quizzes_quiz_registered,
      web_user_sessions_quizzes_registered_time,
      web_user_sessions_quizzes_quiz_id,
      web_user_sessions_quizzes_quiz_started_time,
      web_user_sessions_quizzes_quiz_started_from,
      web_user_sessions_quizzes_quiz_start_page_type,
      web_user_sessions_quizzes_quiz_flow
    ]
  }
}
