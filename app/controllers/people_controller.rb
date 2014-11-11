class PeopleController < ApplicationController
  respond_to :xml, :json, :html

  def show
    @person = Person.find_by(:id => params[:id])
    respond_with(@person)
  end

  def index
    @people = Person.all
    respond_with(@people)
  end

  def create
    @person = Person.create(person_params)
    respond_with(@person)
  end

  private

  def person_params
    return params.require(:person).permit(:first_name, :last_name, :email, :phone_number)
  end
end
