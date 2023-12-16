# frozen_string_literal: true

class Record < ApplicationRecord
  enum :grade, %i[first pre_first second pre_second third fourth fifth], suffix: true
  enum :first_stage, %i[pass fail exemption], suffix: true
  enum :second_stage, %i[pass fail], suffix: true
  enum :result, %i[pass fail], suffix: true

  validates :test_date, presence: true
  validates :grade, presence: true
end
