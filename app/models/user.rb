
class User < ApplicationRecord
    has_many :project_roles
    has_many :projects, through: :project_roles

    has_many :time_logs
end