# -*- encoding : utf-8 -*-
class Week
  def initialize(week)
    @week = week
  end

  def section
    Week.get_time(@week.to_i).to_date.strftime("%m/%d") + ' - ' +
      Week.get_time(@week.to_i + 1).to_date.strftime("%m/%d")
  end

  class << self
    def previous
      this - 1
    end

    def next
      this + 1
    end

    def get_time(week)
      Date.commercial(2012 + week/52, week%52).to_time
    end

    def get_week(time)
      this(time.to_date)
    end

    def this(date=Date.today)
      (date.cwyear - 2012)*52 + date.cweek
    end
  end
end