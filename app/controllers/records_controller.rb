class RecordsController < ApplicationController

    def show
        @records = Record.all
        @record = Record.find(params[:id])
    end

    def new
        @records = Record.all
        @record = Record.new
    end

    def edit
        @records = Record.all
        @record = Record.find(params[:id])
    end

    def index
      @records = Record.all
    end

    def create
        @record = Record.new(record_params)
        @records = Record.all

        if @record.save
            redirect_to @record
        else
            render 'new'
        end
    end

    def update
        @record = Record.find(params[:id])
        @records = Record.all

        if @record.update(record_params)
          redirect_to @record
        else
          render 'edit'
        end
    end

    def destroy
        @records = Record.all
        @record = Record.find(params[:id])
        @record.destroy
       
        redirect_to records_path
      end

    private
        def record_params
            params.require(:record).permit(:name, :description)
        end

end
