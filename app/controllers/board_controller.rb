require 'mailgun'

class BoardController < ApplicationController
  def list
  end 
  def wow
    @title1=params[:title]
    @email1=params[:email]
    @content2=params[:content]

    
    mg_client = Mailgun::Client.new("key-ac0ff08c632a425bca7cac83b19a326f")

    message_params =  {
                       from: 'bbj0423@naver.com',
                       to:   @email1,
                       subject: @title1,
                       text:    @content2
                      }
    
    result = mg_client.send_message('sandboxbd988120baa2489eb8d30859b55ced13.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  
    new_post = Letter.new
    new_post.title = @title1
    new_post.contents = @content2
    new_post.email = @email1
    new_post.save
    redirect_to "/help"
  
  def help
  @board=Letter.all
  
  end
  end
end
