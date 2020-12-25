class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    get_Week
    @plan = Plan.new
  end

  # 予定の保存
  def create
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan)
  end

  def get_Week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    
    @todays_date = Date.today
    

    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end

      wday_num = Date.today.wday + x
      if wday_num >= 7
        wday_num = wday_num -7
      end

      wday_num = wdays[wday_num]

<<<<<<< HEAD
      days = { month: (@todays_date + x).month, date: @todays_date.day + x, plans: today_plans, wdays: wday_num}
||||||| a97fbe1
      days = { :month => (@todays_date + x).month, :date => @todays_date.day + x, :plans => today_plans, :wdays => wday_num}
=======
      days = { :month => (@todays_date + x).month, :date => @todays_date.day + x, :plans => today_plans, :wdays => wday_num}

>>>>>>> 174f5eebf5a81ba3a363b7cbc6f90fa0553b2919
      @week_days.push(days)
    end

  end
end
