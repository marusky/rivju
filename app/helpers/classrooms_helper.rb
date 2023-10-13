module ClassroomsHelper
  def complete_school_year(school_year)
    "#{school_year}/#{school_year + 1}"
  end

  def current_school_year
    current_date = Date.current

    return current_date.year if current_date.month >= 7

    current_date.year - 1
  end
end
