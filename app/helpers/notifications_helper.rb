module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.comment_id
    case notification.action
    when 'like'
      tag.a(@visitor.email, href: account_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: article_path(notification.article_id)) + 'にいいねしました'
    when 'comment' then 
      tag.a(@visitor.email, href: account_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: article_path(notification.article_id)) +  'にコメントしました'
    end
  end
end