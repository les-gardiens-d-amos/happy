require 'benchmark'

class CheckServiceController < ApplicationController
  skip_before_action :authorized

  def initialize
    @database_connection = false
  end

  def check_service
    database_runtime = Benchmark.measure { find_check_service }
    CheckService.delete_all
    render json: {
      app_connection: true,
      db_connection: @db_connection,
      db_runtime: database_runtime.real
    }
  end


  def find_check_service
    begin
      create_check_service
      CheckService.last
      @db_connection = true
    rescue => err
      raise err
    end
  end

  def create_check_service
    CheckService.new.save
  end
end
