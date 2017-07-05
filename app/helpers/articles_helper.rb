module ArticlesHelper

 def pickinfo(pick)
  if pick.text.blank?
    "まだメッセージはありません。"
  else
    pick.text
  end
 end

 def pickfront(pick)
  if pick.text.blank?
    "まだメッセージはありません。"
  else
    pick.text
  end
 end

end
