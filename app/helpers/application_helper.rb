module ApplicationHelper
  def date_hash_to_datetime(date)
    DateTime.new(date['date(1i)'].to_i,
                 date['date(2i)'].to_i,
                 date['date(3i)'].to_i,
                 date['date(4i)'].to_i,
                 date['date(5i)'].to_i)
  end
end
