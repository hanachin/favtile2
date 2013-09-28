# -*- coding: utf-8 -*-
step ":text をクリックする" do |text|
  click_on text
end

step ":text が表示されている" do |text|
  page.should have_text text
end
