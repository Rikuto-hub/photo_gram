module ApplicationHelper
  def default_meta_tags
    {
      site: 'Photo_Gram',
      title: '画像をシェアしよう',
      reverse: true,
      description: '画像をメインとしたSNSです',
    }
  end
end
