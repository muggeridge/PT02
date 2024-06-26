class Project < ApplicationRecord
    has_many :project_roles
    has_many :users, through: :project_roles

    has_many :time_logs
end