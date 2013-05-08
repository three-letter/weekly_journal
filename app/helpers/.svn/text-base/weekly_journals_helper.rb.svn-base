# -*- encoding : utf-8 -*-
module WeeklyJournalsHelper
  def week_info(week)
    case week.to_i
    when previous_week
      "上周"
    when this_week
      "本周"
    when next_week
      "下周"
    else
      week
    end
  end

  def get_weekly_journal_class(weekly_journal)
    "success" if weekly_journal.commented_by?(current_user)
  end
end