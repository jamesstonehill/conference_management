class Talk
  attr_reader :details, :minutes

  def initialize(details)
    @details = details

    if details.end_with?("lightning")
      @minutes = 5
    else
      @minutes = / (\d+)min$/.match(details)[0].to_i
    end
  end
end
