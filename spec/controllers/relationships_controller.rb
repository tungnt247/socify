class RelationshipsController < ApplicationController
  def create
    return if not_allow_send_friend_request(params[:receiver_id])
    relationship = current_user.friend_sent.build(
      receiver_id: params[:receiver_id],
      status: 'pending'
    )

    if relationship.save
      flash[:success] = 'Send request successfully!'
    else
      flash[:error] = 'Send request fail!'
    end
    redirect_to users_path
  end

  def accept
    
  end

  def decline
    
  end

  private

  def not_allow_send_friend_request(user_id)
    current_user.id == user_id || sent_request?(user_id) || received_request?(user_id)
  end

  def sent_request?(user_id)
    current_user.friend_sent.exists?(receiver_id: params[:receiver_id], status: 'pending')
  end

  def received_request?(user_id)
    current_user.friend_request.exists?(sender_id: params[:receiver_id], status: 'pending')
  end
end
