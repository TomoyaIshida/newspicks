module ArticlesHelper

 def pickinfo(pick)
  if pick.text.blank?
    "まだメッセージはありません"
  else
    pick.text.truncate(70)
  end
 end

 def pickfront(pick)
  if pick.text.blank?
    "まだメッセージはありません"
  else
    pick.text.truncate(70)
  end
 end

 def pickshow(pick)
  if pick.text.blank?
    "まだメッセージはありません"
  else
    pick.text.truncate(50)
  end
 end

end
