# frozen_string_literal: true

class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to @record
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def record_params
    attributes = %i[test_date grade first_stage second_stage result reading writing listening speaking]
    params.require(:record).permit(*attributes)
  end
end
