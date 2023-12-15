# frozen_string_literal: true

class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    set_record
  end

  def new
    @record = Record.new
  end

  def edit
    set_record
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to @record
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    set_record

    if @record.update(record_params)
      redirect_to @record
    else
      render 'update', status: :unprocessable_entity
    end
  end

  private

  def record_params
    attributes = %i[test_date grade first_stage second_stage result reading writing listening speaking]
    params.require(:record).permit(*attributes)
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
