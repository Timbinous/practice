class AlarmClock
  def alarms
    @alarms ||= []
  end

  def time
    DateTime.now.strftime("%H:%M")
  end

  def set_alarm(alarm_time)
    alarms << alarm_time
  end
end
describe AlarmClock do
  let (:clock)                          { AlarmClock.new }
  describe "#time" do
    it 'shows the time' do
      clock.time.should == DateTime.now.strftime("%H:%M")
    end
  end

  describe "#set_alarm" do

    it 'sets an alarm wake up time' do
      clock.set_alarm("4:00")
      clock.alarms.should include("4:00")
    end
    
    it 'does not duplicate the alarm' do
      # clock.should_receive(:<<).once
      clock.set_alarm("4:00")
      clock.set_alarm("4:00")
    end
  end
end
