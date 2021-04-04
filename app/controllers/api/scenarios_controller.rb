module Api
  class ScenariosController < ApplicationController
    include Secured
    before_action :set_scenario, only: [:show, :update, :destroy]

    # GET /scenarios
    def index
      @scenarios = Scenario.all

      render json: @scenarios
    end

    # GET /scenarios/1
    def show
      render json: @scenario
    end

    # POST /scenarios
    def create
      @scenario = Scenario.new(scenario_params)

      if @scenario.save
        render json: @scenario, status: :created
      else
        render json: @scenario.errors, status: :unprocessable_entity
      end
    end

    # POST /scenarios/create_scenario
    def create_scenario
      error = false

      scenario_name = params['name']
      scenario_description = params['description']
      feature_id = params['feature_id']
      scenario_steps = params['steps']
      @scenario = Scenario.new(name: scenario_name, description: scenario_description, feature_id: feature_id)

      unless @scenario.save
        error = true
      end

      unless scenario_steps.empty?
        scenario_steps.each do |step|
          puts step['keyword']
          puts step['step']

          @step = Step.new(keyword: step['keyword'], step: step['step'], order: step['order'], scenario_id: @scenario.id)

          unless @step.save
            error = true
          end
        end
      end

      if error
        render json: { error: 'there was an error saving the data' }, status: :unprocessable_entity
      else
        render json: @scenario, status: :created
      end
    end

    # PATCH/PUT /scenarios/1
    def update
      if @scenario.update(scenario_params)
        render json: @scenario
      else
        render json: @scenario.errors, status: :unprocessable_entity
      end
    end

    # DELETE /scenarios/1
    def destroy
      @scenario.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scenario_params
      params.permit(:name, :description, :feature_id, :steps)
    end
  end
end