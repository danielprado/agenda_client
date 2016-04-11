class ContactsController < ApplicationController
  before_action :check_user!


  # GET /contacts
  def index
    begin
     @contacts = Contact.find(:all, :params => {:user_id => session[:user_id]})
    rescue => e
     format.html { redirect_to root_path, notice: "Error getting contacts" }
    end
  end
  # GET /users/:user_id/contacts/:id
  def show
    begin
     @contact= Contact.find(params[:id], :params =>{:user_id => session[:user_id]})
    rescue =>e
     format.html { redirect_to root_path, notice: "Error getting contact" }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :surnames, :email, :category, :photo, phones_attributes: [:id, :number, :_destroy])
    end

    def check_user!
      if !session[:user_id]
        flash[:notice] = 'Identificate'

        redirect_to root_path

        return false
      else
        Contact.headers['X-AUTH-TOKEN'] = session[:token]
      end
    end
end
