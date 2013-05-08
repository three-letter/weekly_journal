# -*- encoding : utf-8 -*-
# seed role
unless Role.first
  Role.create(:name => "admin")
  Role.create(:name => "tmd")
  Role.create(:name => "guest")
end

UserAction.refresh!

#create default
unless User.first
  ["jiayp", "hanxm", "zengjm", "linc", "linw", "zhangsk", "zhangjq-c", "gaosy-a", "liuwm", "wangqb-a", "shangj", "zhangz-c", "dil", "chensw", "liuj-a", "leik-a", "lipl", "wuy-b", "kongdm", "cuidc", "chenf-a", "huangp", "duanb", "zhouj-d"].each do |login|
    User.fetch_by_login(login)
  end
end

# -*- encoding : utf-8 -*-
unless PositiveEnergy.first
  postive_energes = ["在你坚持不住的时候，记得告诉自己，再坚持一下。", "我们之所以心会累，就是常常徘徊在坚持与放弃之间，举棋不定；我们之所以会烦恼，就是记性太好，该记的，不该记的，都会留在记忆里；我们之所以会痛苦，就是追求的太多；我们之所以不快乐，就是奢望的太多。——不是我们拥有的太少，而是计较的太多。", "俄罗斯方块告诉我们：犯下的错误会积累，获得的成功会消失；植物大战僵尸告诉我们：须常调整状态，方能应付不同挑战；愤怒的小鸟告诉我们：有时沉下身心，是为了飞的更高；跑跑卡丁车告诉我们：永远别觉得时间还多，可以浪费；水果忍者告诉我们：水果与炸弹同在，机遇与挑战并存！", "我不知道我要走向何方，但我一定会追随我心。", "我们可以轻易的躲开一头大象，却总是躲不开苍蝇。使我们不快乐的，也往往是一些芝麻绿豆般的小事。生活中的小细节莫轻视，多用点心把幸福掌握！", "旁观者的姓名永远爬不到比赛的计分板上。", "世界上没有一个人是只靠自己一个人的力量就可以达到成功的，成功的背后一定有许多人在有意或无意识地帮助你，你要永远感激他们。", "成功的人就是能够从一切事物中吸取对自己有益的东西。", "世上有三样东西是别人抢不走的：一是吃进胃里的食物，二是藏在心中的梦想，三是读进大脑的书。", "不管发生什么，都不要放弃，坚持走下去，肯定会有意想不到的风景。也许不是你本来想走的路，也不是你本来想登临的山顶，可另一条路有另一条路的风景，不同的山顶也一样会有美丽的日出，不要念念不忘原来的路。", "每个人都像一个小丑，同时在玩着五个球，也就是你的工作、健康、家庭、朋友还有灵魂。这五个球只有一个是用橡胶做的，掉下去会弹起来，那就是工作。另外四个呢，都是用玻璃做的，掉下去会碎的。所以工作要努力，但是家庭、健康、朋友还有灵魂大家更要珍惜。", "当生活给你一百个理由哭泣时，你就拿出一千个理由笑给它看！", "无论多么艰难，都要继续向前，因为只有你放弃的那一刻，你才输了。", "一批成功的美国50岁的人被采访：什么是你希望你25岁时，有过来人告诉你的话。最多的三个回答：1、不要被世俗教条蒙蔽，追随你的心和梦想；2、关注你的家庭和你爱的人；3、享受人生体验和珍惜快乐时光。", "人，往往急于成长，然后又哀叹失去的童年；以健康换取金钱，不久后又想用金钱恢复健康；对未来焦虑不已，却又无视现在的幸福，既不活在当下，也不活在未来。人生短短几十年，不要在临死前才感叹自己仿佛从未活过。", "老师提问：“有个人要烧壶开水，生火到一半时发现柴不够，他该怎么办?”有的同学说赶快去找，有的说去借、去买。老师说：“为什么不把壶里的水倒掉一些呢?”", "大部分人在二三十岁上就死去了，因为过了这个年龄，他们只是自己的影子，此后的余生则是在模仿自己中度过，日复一日，更机械，更装腔作势地重复他们在有生之年的所作所为，所思所想，所爱所恨。——罗曼·罗兰", "能干的人，不在情绪上计较，只在做事上认真；无能的人，不在做事上认真，只在情绪上计较。——星云大师", "当我吃东西时，就只管吃；当我走路时，就只管走。因为我既不生活在过去，也不生活在未来，我只有现在，它才是我感兴趣的。如果你能永远停留在现在，那你将是最幸福的人。生活就是一个节日，是一场盛大的庆典。因为生活永远是，也仅仅是我们现在经历的这一刻。——保罗·柯艾略", "只要走出第一步，下一步就变得不太难。想做的事情，就在今天做吧，不要让未来的自己遗憾。", "泥泞的道路上，请保持一颗玩泥巴的心。", "你现在做的事情最好是你晚年时愿意回忆的事。", "一个人越是有许多事情能够放得下，他越是富有。", "优于别人，并不高贵，真正的高贵应该是优于过去的自己。", "那些打不死我们的痛苦，最后都变成了我们骄傲的资本。"]
  postive_energes.each do |postive_energe|
    PositiveEnergy.create(:content => postive_energe, :user_id => User.find_by_login('zhangz-c').id)
  end
end

unless WeeklyJournal.first
  require 'spreadsheet'
  @workbook = Spreadsheet.open("public/journal.xls")
  @worksheet = @workbook.worksheet(0)

  WeeklyJournal.delete_all  
  include ActionView::Helpers::SanitizeHelper

  0.upto @worksheet.last_row_index do |index|
    row = @worksheet.row(index)
    if user = User.find_by_name(row[1])
      WeeklyJournal.create(:title => row[2], :content => strip_tags(row[3]), :year => row[4], :month => row[5], :week => row[6], :visited_times => row[7], :created_at => row[8].to_time, :user_id => user.id, :tmp_id => row[0])
    end
  end
  
  @worksheet = @workbook.worksheet(1)
  Comment.delete_all
  0.upto @worksheet.last_row_index do |index|
    row = @worksheet.row(index)
    if (user = User.find_by_name(row[1])) && (weekly_journal = WeeklyJournal.find_by_tmp_id(row[0].to_i))
      weekly_journal.comments.create(:content => row[2], :created_at => row[3].to_time, :user_id => user.id)
    end
  end
end
