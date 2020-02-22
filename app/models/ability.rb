class Ability

  include CanCan::Ability

  def initialize(user)
    # ログインしているユーザ情報設定
    user ||= User.new
    # 自分のレコードのみ更新を許可
    can [:read,:update], User, id: user.id
    can :read, ActiveAdmin::Page, name: 'Dashboard'
    can :manage, Ashop, user_id: user
  end

  def admin
  end

  
end
