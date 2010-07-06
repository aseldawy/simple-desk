module SimpleDeskHelper
  def format_hours(hours)
    h = Integer(hours)
    m = Integer(hours * 60) % 60
    "%d:%02d" % [h, m]
  end
end
