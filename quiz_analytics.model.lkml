connection: "quiz_data"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: al_quiz {
  join: al_quiz_form_entity {
    from:  al_quiz__form_entity
    view_label: "AL QUIZ: Form Entity"
    sql:LEFT JOIN UNNEST([${al_quiz.form_entity}]) as al_quiz_form_entity ;;
    relationship: one_to_one
  }
  join: al_quiz_global_entity {
    from: al_quiz__global_entity
    view_label: "AL QUIZ: Global Entity"
    sql:LEFT JOIN UNNEST([${al_quiz.global_entity}]) as al_quiz_global_entity ;;
    relationship: one_to_one

  }
}
explore: al_quiz_error_records {
  join: al_quiz_error_records__attributes {
    view_label: "Al Quiz Error Records: Attributes"
    sql: LEFT JOIN UNNEST(${al_quiz_error_records.attributes}) as al_quiz_error_records__attributes ;;
    relationship: one_to_many
  }}

# explore:connection_reg_r3 {}
