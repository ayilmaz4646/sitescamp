# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160831112969) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeder_feed_errors", force: :cascade do |t|
    t.integer  "feed_source_id",             null: false
    t.text     "feed_param"
    t.text     "error_message"
    t.string   "error_type",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["feed_source_id"], name: "index_feeder_feed_errors_on_feed_source_id", using: :btree
  end

  create_table "feeder_feed_sources", force: :cascade do |t|
    t.string   "title",           null: false
    t.string   "url"
    t.string   "duration"
    t.datetime "last_check_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain_name"
  end

  create_table "feeder_feeds", force: :cascade do |t|
    t.string   "title",                                       null: false
    t.text     "content"
    t.string   "url"
    t.boolean  "analyzed",                    default: false
    t.string   "language",                    default: "f"
    t.integer  "feed_source_id"
    t.string   "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.date     "published_at"
    t.integer  "likes_count"
    t.string   "image_url",      limit: 1000
    t.index ["entry_id", "feed_source_id"], name: "index_feeder_feeds_on_entry_id_and_feed_source_id", unique: true, using: :btree
  end

  create_table "feeder_readlaters", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_feeder_readlaters_on_user_id", using: :btree
  end

  create_table "feeder_sites", force: :cascade do |t|
    t.string   "domain",      limit: 500,  null: false
    t.string   "title",       limit: 1000
    t.text     "description"
    t.text     "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.index ["domain"], name: "index_feeder_sites_on_domain", using: :btree
  end

  create_table "feeder_sites_feeds", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeder_user_likes", force: :cascade do |t|
    t.integer  "feed_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeder_user_readlaters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["feed_id"], name: "index_feeder_user_readlaters_on_feed_id", using: :btree
    t.index ["user_id"], name: "index_feeder_user_readlaters_on_user_id", using: :btree
  end

  create_table "feeder_user_sources", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "feed_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nimbos_activities", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "target_type", limit: 40
    t.integer  "target_id"
    t.string   "target_name", limit: 60
    t.integer  "patron_id",              null: false
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "patron_id"], name: "index_nimbos_activities_on_user_id_and_patron_id", using: :btree
  end

  create_table "nimbos_authorizations", force: :cascade do |t|
    t.integer  "user_id",                              null: false
    t.string   "controller", limit: 50,                null: false
    t.boolean  "can_manage",            default: true
    t.boolean  "can_read",              default: true
    t.boolean  "can_create",            default: true
    t.boolean  "can_update",            default: true
    t.boolean  "can_delete",            default: true
    t.boolean  "can_list",              default: true
    t.integer  "patron_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["patron_id"], name: "index_nimbos_authorizations_on_patron_id", using: :btree
    t.index ["user_id"], name: "index_nimbos_authorizations_on_user_id", using: :btree
  end

  create_table "nimbos_branches", force: :cascade do |t|
    t.string   "name",       limit: 40,                     null: false
    t.string   "tel",        limit: 15
    t.string   "fax",        limit: 15
    t.string   "email",      limit: 40
    t.string   "postcode",   limit: 5
    t.string   "address",    limit: 80
    t.string   "district",   limit: 40
    t.string   "city_name",  limit: 100
    t.string   "state",      limit: 100
    t.string   "country_id", limit: 2
    t.string   "status",     limit: 10,  default: "active"
    t.integer  "patron_id",                                 null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
    t.integer  "city_id"
    t.index ["patron_id"], name: "index_nimbos_branches_on_patron_id", using: :btree
  end

  create_table "nimbos_cities", force: :cascade do |t|
    t.string   "code"
    t.string   "name",                 null: false
    t.string   "tel_code"
    t.string   "country_id", limit: 2, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["country_id"], name: "index_nimbos_cities_on_country_id", using: :btree
  end

  create_table "nimbos_comments", force: :cascade do |t|
    t.integer  "user_id",                                   null: false
    t.text     "comment_text",                              null: false
    t.string   "commentable_type", limit: 40
    t.integer  "commentable_id"
    t.string   "commenter",        limit: 1,  default: "U"
    t.integer  "patron_id",                                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.index ["commentable_type", "commentable_id"], name: "index_nimbos_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["patron_id"], name: "index_nimbos_comments_on_patron_id", using: :btree
  end

  create_table "nimbos_counters", force: :cascade do |t|
    t.string   "counter_type"
    t.integer  "count"
    t.string   "prefix"
    t.string   "suffix"
    t.integer  "period"
    t.boolean  "confirmed"
    t.integer  "patron_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",           limit: 30, default: "active"
    t.string   "period_scope",     limit: 10, default: "year"
    t.string   "engine",           limit: 30
    t.integer  "active_year"
    t.integer  "active_month"
    t.integer  "count_str_length"
    t.index ["patron_id"], name: "index_nimbos_counters_on_patron_id", using: :btree
  end

  create_table "nimbos_countries", primary_key: "code", id: :string, limit: 2, force: :cascade do |t|
    t.string   "name",          limit: 40,                 null: false
    t.string   "telcode",       limit: 10
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "locale",        limit: 20
    t.string   "language",      limit: 10
    t.string   "time_zone"
    t.string   "mail_encoding", limit: 20
    t.string   "domain",        limit: 10
    t.string   "code3",         limit: 3
    t.string   "currency",      limit: 20
    t.string   "region",        limit: 100
    t.string   "subregion",     limit: 100
    t.boolean  "listable",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uic_code",      limit: 20
  end

  create_table "nimbos_currencies", primary_key: "code", id: :string, limit: 5, force: :cascade do |t|
    t.string   "name",       limit: 40,                           null: false
    t.string   "symbol",     limit: 1
    t.decimal  "multiplier",            precision: 5, default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nimbos_discussions", force: :cascade do |t|
    t.string   "title",          limit: 255,             null: false
    t.text     "content"
    t.string   "target_type",    limit: 50
    t.integer  "target_id"
    t.integer  "user_id",                                null: false
    t.integer  "patron_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",             default: 0
    t.index ["patron_id"], name: "index_nimbos_discussions_on_patron_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_nimbos_discussions_on_target_type_and_target_id", using: :btree
  end

  create_table "nimbos_group_contacts", force: :cascade do |t|
    t.integer "group_id"
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_nimbos_group_contacts_on_contact_id", using: :btree
    t.index ["group_id"], name: "index_nimbos_group_contacts_on_group_id", using: :btree
  end

  create_table "nimbos_groups", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "grouped_type",    limit: 100
    t.integer  "grouped_id"
    t.boolean  "hidden",                      default: false
    t.integer  "admin_id",                                    null: false
    t.integer  "patron_id",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",              default: 0
    t.integer  "tasks_count",                 default: 0
    t.integer  "reminders_count",             default: 0
    t.index ["grouped_type", "grouped_id"], name: "index_nimbos_groups_on_grouped_type_and_grouped_id", using: :btree
    t.index ["patron_id"], name: "index_nimbos_groups_on_patron_id", using: :btree
    t.index ["title"], name: "index_nimbos_groups_on_title", using: :btree
  end

  create_table "nimbos_listheaders", force: :cascade do |t|
    t.string   "code",        null: false
    t.string   "name"
    t.string   "i18n_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nimbos_listitems", force: :cascade do |t|
    t.string   "code",          limit: 50, null: false
    t.string   "name",          limit: 50
    t.string   "list_code"
    t.string   "i18n_code"
    t.integer  "listheader_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["listheader_id"], name: "index_nimbos_listitems_on_listheader_id", using: :btree
  end

  create_table "nimbos_menu_users", id: false, force: :cascade do |t|
    t.integer "menu_id"
    t.integer "user_id"
    t.index ["user_id", "menu_id"], name: "index_nimbos_menu_users_on_user_id_and_menu_id", using: :btree
  end

  create_table "nimbos_menus", force: :cascade do |t|
    t.string   "label",      limit: 50
    t.string   "i18n_code",  limit: 255
    t.string   "icon",       limit: 30
    t.string   "url",        limit: 2000
    t.string   "app_model",  limit: 50
    t.integer  "patron_id",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["patron_id"], name: "index_nimbos_menus_on_patron_id", using: :btree
  end

  create_table "nimbos_patrons", force: :cascade do |t|
    t.string   "name",            limit: 40,                     null: false
    t.string   "title",           limit: 60
    t.string   "email",           limit: 60,                     null: false
    t.string   "website",         limit: 60
    t.string   "tel",             limit: 20
    t.string   "fax",             limit: 20
    t.string   "gsm",             limit: 20
    t.string   "postcode",        limit: 5
    t.string   "address",         limit: 60
    t.string   "contact_name",    limit: 40
    t.string   "contact_surname", limit: 40
    t.string   "city",            limit: 100
    t.string   "state",           limit: 100
    t.string   "country_id",      limit: 2
    t.string   "patron_type",     limit: 20
    t.string   "employees",       limit: 10
    t.string   "language",        limit: 2
    t.string   "status",          limit: 10,  default: "active"
    t.string   "logo"
    t.string   "patron_token",    limit: 40
    t.string   "time_zone",       limit: 30
    t.string   "district",        limit: 40
    t.string   "currency",        limit: 10
    t.string   "locale",          limit: 20
    t.string   "mail_encoding",   limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "appname",         limit: 30
    t.decimal  "credit_limit",                default: "0.0"
    t.string   "tax_no",          limit: 30
    t.string   "tax_office",      limit: 100
    t.integer  "remained_coins",              default: 0
    t.string   "police",          limit: 40
    t.boolean  "demo",                        default: false
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "broker_id"
  end

  create_table "nimbos_posts", force: :cascade do |t|
    t.integer  "user_id",                                    null: false
    t.text     "message",                                    null: false
    t.string   "target_type",    limit: 40
    t.integer  "target_id"
    t.string   "target_title",   limit: 255
    t.string   "target_url",     limit: 255
    t.boolean  "is_private",                 default: false
    t.boolean  "is_syspost",                 default: false
    t.integer  "patron_id",                                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_type",    limit: 40
    t.integer  "parent_id"
    t.string   "parent_title"
    t.string   "parent_url"
    t.string   "post_action",    limit: 50
    t.string   "channel",        limit: 50
    t.boolean  "trashed",                    default: false
    t.integer  "comments_count",             default: 0
    t.integer  "likes_count",                default: 0
    t.integer  "group_id"
    t.index ["patron_id"], name: "index_nimbos_posts_on_patron_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_nimbos_posts_on_target_type_and_target_id", using: :btree
    t.index ["user_id"], name: "index_nimbos_posts_on_user_id", using: :btree
  end

  create_table "nimbos_regions", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.integer  "city_id"
    t.string   "country_id", limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["city_id"], name: "index_nimbos_regions_on_city_id", using: :btree
    t.index ["country_id"], name: "index_nimbos_regions_on_country_id", using: :btree
  end

  create_table "nimbos_reminders", force: :cascade do |t|
    t.string   "title",          limit: 255,                 null: false
    t.date     "start_date",                                 null: false
    t.string   "start_hour",     limit: 5
    t.date     "finish_date"
    t.string   "calendar_scope", limit: 40
    t.text     "description"
    t.string   "remindfor_type", limit: 100
    t.integer  "remindfor_id"
    t.integer  "user_id",                                    null: false
    t.integer  "patron_id",                                  null: false
    t.boolean  "trashed",                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.index ["patron_id"], name: "index_nimbos_reminders_on_patron_id", using: :btree
    t.index ["remindfor_type", "remindfor_id"], name: "index_nimbos_reminders_on_remindfor_type_and_remindfor_id", using: :btree
  end

  create_table "nimbos_roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",         limit: 100
    t.index ["name", "resource_type", "resource_id"], name: "index_nimbos_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_nimbos_roles_on_name", using: :btree
  end

  create_table "nimbos_taggings", force: :cascade do |t|
    t.integer  "tag_id",      null: false
    t.string   "parent_type", null: false
    t.integer  "parent_id",   null: false
    t.integer  "patron_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_type", "parent_id"], name: "index_nimbos_taggings_on_parent_type_and_parent_id", using: :btree
    t.index ["patron_id"], name: "index_nimbos_taggings_on_patron_id", using: :btree
    t.index ["tag_id", "parent_type", "parent_id", "patron_id"], name: "nimbos_taggings_unique_tag", unique: true, using: :btree
    t.index ["tag_id"], name: "index_nimbos_taggings_on_tag_id", using: :btree
  end

  create_table "nimbos_tags", force: :cascade do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "tag_type",   limit: 50
    t.integer  "patron_id",             null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name", "patron_id"], name: "index_nimbos_tags_on_name_and_patron_id", unique: true, using: :btree
    t.index ["name"], name: "index_nimbos_tags_on_name", using: :btree
    t.index ["patron_id"], name: "index_nimbos_tags_on_patron_id", using: :btree
  end

  create_table "nimbos_tasks", force: :cascade do |t|
    t.integer  "todolist_id",                                   null: false
    t.integer  "user_id",                                       null: false
    t.string   "task_text",      limit: 255,                    null: false
    t.string   "task_code",      limit: 50
    t.string   "i18n_code",      limit: 50
    t.integer  "cruser_id"
    t.string   "status",         limit: 10,  default: "active"
    t.date     "due_date"
    t.date     "closed_date"
    t.string   "close_text",     limit: 255
    t.boolean  "system_task",                default: false
    t.integer  "patron_id",                                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",             default: 0
    t.string   "color"
    t.integer  "group_id"
    t.index ["patron_id"], name: "index_nimbos_tasks_on_patron_id", using: :btree
    t.index ["todolist_id"], name: "index_nimbos_tasks_on_todolist_id", using: :btree
    t.index ["user_id"], name: "index_nimbos_tasks_on_user_id", using: :btree
  end

  create_table "nimbos_todolists", force: :cascade do |t|
    t.string   "name",        limit: 255,                 null: false
    t.integer  "user_id",                                 null: false
    t.string   "todop_type",  limit: 100
    t.integer  "todop_id"
    t.integer  "patron_id",                               null: false
    t.integer  "tasks_count",             default: 0
    t.boolean  "trashed",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.boolean  "isdefault",               default: false
    t.index ["patron_id"], name: "index_nimbos_todolists_on_patron_id", using: :btree
    t.index ["todop_type", "todop_id"], name: "index_nimbos_todolists_on_todop_type_and_todop_id", using: :btree
    t.index ["user_id"], name: "index_nimbos_todolists_on_user_id", using: :btree
  end

  create_table "nimbos_users", force: :cascade do |t|
    t.string   "email",                           limit: 40,                                          null: false
    t.string   "password_digest"
    t.string   "salt"
    t.string   "name",                            limit: 40
    t.string   "surname",                         limit: 40
    t.integer  "patron_id"
    t.string   "patron_key",                      limit: 20
    t.string   "language",                                     default: "en"
    t.string   "time_zone",                                    default: "Eastern Time (US & Canada)"
    t.string   "locale",                          limit: 8
    t.string   "region",                          limit: 2
    t.string   "user_type",                       limit: 2
    t.string   "mail_encoding",                   limit: 20
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_email_time"
    t.datetime "password_reset_token_expires_at"
    t.integer  "failed_logins_count"
    t.integer  "lock_expires_at"
    t.string   "role"
    t.string   "avatar"
    t.integer  "branch_id",                                    default: 0,                            null: false
    t.string   "remember_me_token"
    t.string   "remember_me_token_expires_at"
    t.string   "datetime"
    t.boolean  "firstuser",                                    default: false
    t.string   "user_status",                     limit: 10,   default: "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_guest",                                     default: false
    t.boolean  "rootuser",                                     default: false,                        null: false
    t.boolean  "authorized",                                   default: true,                         null: false
    t.integer  "manager_id"
    t.string   "jobtitle"
    t.date     "menu_config_date"
    t.boolean  "smtp_enabled",                                 default: false
    t.string   "smtp_address",                    limit: 100
    t.integer  "smtp_port",                                    default: 587
    t.string   "smtp_domain",                     limit: 100
    t.string   "smtp_user_name",                  limit: 100
    t.string   "smtp_user_password",              limit: 100
    t.string   "smtp_user_signature",             limit: 1000
    t.index ["email"], name: "index_nimbos_users_on_email", unique: true, using: :btree
    t.index ["patron_id"], name: "index_nimbos_users_on_patron_id", using: :btree
    t.index ["remember_me_token"], name: "index_nimbos_users_on_remember_me_token", using: :btree
  end

  create_table "nimbos_users_groups", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.index ["group_id", "user_id"], name: "index_nimbos_users_groups_on_group_id_and_user_id", using: :btree
  end

  create_table "nimbos_users_patrons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "patron_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nimbos_users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_nimbos_users_roles_on_user_id_and_role_id", using: :btree
  end

end
